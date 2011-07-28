/*
 * Copyright 2011 by EDINA, University of Edinburgh
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package edina.eframework.gefcdemo.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
  
  private static final Log log = LogFactory.getLog( ResultDownloadController.class );
  
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
    log.debug( "Fetching id " + id );
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
