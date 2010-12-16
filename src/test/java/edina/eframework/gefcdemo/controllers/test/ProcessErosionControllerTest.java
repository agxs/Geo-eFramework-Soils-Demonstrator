package edina.eframework.gefcdemo.controllers.test;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edina.eframework.gefcdemo.controllers.ProcessErosionController;
import edina.eframework.gefcdemo.helpers.MockServletContextWebContextLoader;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = MockServletContextWebContextLoader.class,
                      locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml",
                                   "file:src/main/webapp/WEB-INF/gefcdemo-servlet.xml"})
public class ProcessErosionControllerTest {

  @Autowired
  private ProcessErosionController processController;
  
  @Test
  public void testHandleProcess() throws IOException {
    processController.handleProcess( null );
  }
}
