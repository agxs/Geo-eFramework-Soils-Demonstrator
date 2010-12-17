package edina.eframework.gefcdemo.controllers;

import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edina.eframework.gefcdemo.domain.SoilErosionWps;

@Controller
@RequestMapping(value="/gefcdemo")
public class MapController {
  
  @RequestMapping(method=RequestMethod.GET)
  public String handleMap( SoilErosionWps params ) throws MalformedURLException {
    // Sets default values - move to properties file
    params.setRainfallExponent( 2.0 );
    params.setGrowFactor( 0.0 );
    params.setStreamConnectivity( 1.0 );
    params.setRainfallWcs( new URL( "http://localhost/data/rainfall_smaller.tiff" ) );
    params.setLandcoverWcs( new URL( "http://localhost/data/landcover.tiff" ) );
    params.setErosionWcs( new URL( "http://localhost/data/erosion_smaller.tiff" ) );
    
    return "gefcdemo";
  }
}
