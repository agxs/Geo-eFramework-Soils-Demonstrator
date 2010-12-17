package edina.eframework.gefcdemo.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edina.eframework.gefcdemo.domain.SoilErosionWps;
import edina.eframework.gefcdemo.generated.wps.ExecuteResponse;

@Controller
@RequestMapping(value="/processmodel")
public class ProcessErosionController {
  
  private VelocityEngine velocityEngine;
  
  public void setVelocityEngine( VelocityEngine velocityEngine ) {
    this.velocityEngine = velocityEngine;
  }
  
  private String templateLocation;
  
  public void setTemplateLocation( String templateLocation ) {
    this.templateLocation = templateLocation;
  }
  
  private URL wpsServer;
  
  public void setWpsServer( URL wpsServer ) {
    this.wpsServer = wpsServer;
  }

  @RequestMapping(method = RequestMethod.GET)
  public String handleProcess( SoilErosionWps params ) {
    return "wps";
  }
  
  @RequestMapping(method = RequestMethod.GET, params="test=true")
  public void handleTest( SoilErosionWps params, HttpServletResponse response )
    throws IOException, JAXBException {
   
    JAXBContext jaxbContext = JAXBContext.newInstance("edina.eframework.gefcdemo.generated.wps");
    Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
    
    ExecuteResponse executeResponse =
      (ExecuteResponse)unmarshaller.unmarshal( new File( "/tmp/result.xml" ) );

    //executeResponse.getStatus().getProcessAccepted(); // TODO check for failed
    String resultUrl = executeResponse.getProcessOutputs().getOutput().get( 0 ).getReference().getHref();
    
    System.out.println( "Output " + resultUrl );
    
    InputStream wpsStream = null;
    try {
      wpsStream = new URL( resultUrl ).openStream();
      response.setContentType( "image/tiff" );
      OutputStream wpsOutput = response.getOutputStream();
      byte[] buffer = new byte[4096];
      int i;
      while ( ( i = wpsStream.read( buffer ) ) != -1 ) {
        wpsOutput.write( buffer, 0, i );
      }
      wpsOutput.flush();
    }
    finally {
      try { wpsStream.close(); } catch ( Exception e ) {}
    }
  }
  
  @RequestMapping(method = RequestMethod.POST)
  public String handleProcessResult( SoilErosionWps params ) throws IOException {
    
    Writer wpsRequest = new StringWriter();
    Map<String, Object> velocityMap = new HashMap<String,Object>();
    
    velocityMap.put( "params", params );
    
    VelocityEngineUtils.mergeTemplate( velocityEngine, templateLocation, velocityMap, wpsRequest );
    wpsRequest.close();
    
    System.out.println( wpsRequest.toString() );
    System.out.println( "Submitting to " + wpsServer );

    RequestEntity entity = null;
    try {
      entity = new StringRequestEntity( wpsRequest.toString(), "text/xml", "UTF-8" );
    }
    catch ( UnsupportedEncodingException e ) {
      throw new MalformedURLException( "Apparantly 'UTF-8' is an unsupported encoding type." );
    }

    PostMethod post = new PostMethod( wpsServer.toString() );
    post.setRequestEntity( entity );

    HttpClient client = new HttpClient( new SimpleHttpConnectionManager() );

    client.getHttpConnectionManager().getParams().setSoTimeout( 0 );
    client.getHttpConnectionManager().getParams().setConnectionTimeout( 0 );

    client.executeMethod( post );

    InputStream wpsStream = null;
    FileOutputStream wpsOutput = null;
    try {
      wpsStream = post.getResponseBodyAsStream();
      wpsOutput = new FileOutputStream( "/tmp/result.xml" );
      byte[] buffer = new byte[4096];
      int i;
      while ( ( i = wpsStream.read( buffer ) ) != -1 ) {
        wpsOutput.write( buffer, 0, i );
      }
      wpsOutput.flush();
    }
    finally {
      try { wpsStream.close(); } catch ( Exception e ) {}
      try { wpsOutput.close(); } catch ( Exception e ) {}
    }

    // generate wps request
    // store data
    // run WmsConfigurationGenerator
    {
    // generate mapserver configuration
    // index data
    }
    // return data
    
    return "gefcdemo";
  }
}
