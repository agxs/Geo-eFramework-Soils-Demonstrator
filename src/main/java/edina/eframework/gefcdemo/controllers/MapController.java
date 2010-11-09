package edina.eframework.gefcdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/gefcdemo")
public class MapController {
  
  @RequestMapping(method=RequestMethod.GET)
  String handleMap() {
    return "gefcdemo";
  }
}
