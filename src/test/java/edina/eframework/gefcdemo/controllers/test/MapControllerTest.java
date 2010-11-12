package edina.eframework.gefcdemo.controllers.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edina.eframework.gefcdemo.controllers.MapController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/applicationContext.xml",
                       "file:src/main/webapp/WEB-INF/gefcdemo-servlet.xml"})
public class MapControllerTest {

  @Autowired
  private MapController mapController;
  
  @Test
  public void testHandleMap() {
    String viewName = mapController.handleMap();
    assertEquals( "Unexpected view name returned from MapController.",
                  "gefcdemo", viewName ); 
  }
}
