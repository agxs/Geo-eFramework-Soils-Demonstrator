package edina.eframework.gefcdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edina.eframework.gefcdemo.domain.SoilErosionWps;

@Controller
@RequestMapping(value="/gefcdemo")
public class MapController {
  
  @RequestMapping(method=RequestMethod.GET)
  public String handleMap( SoilErosionWps params ) {
    return "gefcdemo";
  }
  
  @RequestMapping(method=RequestMethod.POST)
  public String temp( SoilErosionWps params ) {
    return "gefcdemo";
  }
}
