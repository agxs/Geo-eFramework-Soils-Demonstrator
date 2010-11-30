package edina.eframework.gefcdemo.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

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

    InputStream wpsStream = post.getResponseBodyAsStream();
    FileOutputStream wpsOutput = new FileOutputStream( "/tmp/result.xml" );
    byte[] buffer = new byte[4096];
    int i;
    while ( ( i = wpsStream.read( buffer ) ) != -1 ) {
      wpsOutput.write( buffer, 0, i );
    }

    // generate wps request
    // store data
    // run WmsConfigurationGenerator
    {
    // generate mapserver configuration
    // index data
    }
    // return data
    
    return "wps";
  }
}
