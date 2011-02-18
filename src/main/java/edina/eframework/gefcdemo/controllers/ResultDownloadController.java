package edina.eframework.gefcdemo.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.configuration.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controller to help give the erosion result for downloading a nice name;
 * instead of seeing "RetrieveResultServlet" they see "ErosionResult.tiff".
 * 
 * At the moment the id of the download is retrieved from the client. This
 * allows the application to remain http session free, and thus, stateless.
 * This makes the result of the wps slightly more fragile as the application
 * has to know what the download url servlet of the WPS is(and thus limiting it
 * to 52N wps') instead of directly using the result url from the wps response
 * xml. An alternative would be to store that url in an http session.
 * 
 * @author Andrew Seales
 */
@Controller
@RequestMapping(value="/ErosionResult.tiff")
public class ResultDownloadController {
  
  private Configuration config;
  
  public void setConfig( Configuration config ) {
    this.config = config;
  }

  @RequestMapping
  public void handleResultDownload( @RequestParam String id, HttpServletResponse response )
    throws MalformedURLException, IOException {
    
    // Retrieving the wps result url this way avoids using the session and keeps
    // the application stateless. Alternative would be to directly store the
    // wps output result url in the session instead in ProcessErosionController.
    System.out.println( "Fetching id " + id );
    String wpsResultHost = config.getString( "wps.url.result" );
    URL wpsResult = new URL( wpsResultHost + "id=" + id );
    
    response.setContentType( "image/tiff" );
    InputStream inputStream = wpsResult.openStream();
    try {
      OutputStream outputStream = response.getOutputStream();
      byte[] buffer = new byte[4096];
      int bytesRead = 0;
      while( ( bytesRead = inputStream.read( buffer ) ) != -1 ) {
        outputStream.write( buffer, 0, bytesRead );
      }
      outputStream.flush();
    }
    finally {
      try { inputStream.close(); } catch ( Exception e ) {}
    }
  }
}
