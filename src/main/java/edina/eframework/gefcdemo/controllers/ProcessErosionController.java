package edina.eframework.gefcdemo.controllers;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;

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

  @RequestMapping
  public String handleProcess( SoilErosionWps params ) throws IOException {
    
    Writer wpsRequest = new StringWriter();
    Map<String, Object> velocityMap = new HashMap<String,Object>();
    
    velocityMap.put( "test", "a url" );
    
    VelocityEngineUtils.mergeTemplate( velocityEngine, templateLocation, velocityMap, wpsRequest );
    wpsRequest.close();
    
    System.out.println( wpsRequest.toString() );
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
