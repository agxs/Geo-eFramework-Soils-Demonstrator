package edina.eframework.gefcdemo.controllers;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edina.eframework.gefcdemo.domain.SoilErosionWps;

@Controller
@RequestMapping(value="/processmodel")
public class ProcessErosionController {
  
  private VelocityEngine velocityEngine;
  
  public void setVelocityEngine( VelocityEngine velocityEngine ) {
    this.velocityEngine = velocityEngine;
  }

  @RequestMapping
  String handleProcess( SoilErosionWps params ) {
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
