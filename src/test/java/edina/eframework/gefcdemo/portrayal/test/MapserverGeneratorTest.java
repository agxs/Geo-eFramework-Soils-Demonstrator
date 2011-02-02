package edina.eframework.gefcdemo.portrayal.test;

import static org.junit.Assert.fail;

import java.io.File;
import java.io.IOException;

import org.apache.commons.configuration.Configuration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edina.eframework.gefcdemo.helpers.MockServletContextWebContextLoader;
import edina.eframework.gefcdemo.portrayal.MapserverGenerator;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = MockServletContextWebContextLoader.class,
                      locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml",
                                   "file:src/main/webapp/WEB-INF/gefcdemo-servlet.xml"})
public class MapserverGeneratorTest {
  
  @Autowired
  private MapserverGenerator mapserverGenerator;
  
  @Autowired
  private Configuration config;

  @Test
  public void testGenerateResultConfiguration() throws IOException {
    mapserverGenerator.generateResultConfiguration( "test" );
    
    File mapFile = new File( config.getString( "wps.output.location" ) + "test/result.map" );
    try {
      if ( !mapFile.exists() ) {
        fail( "Map file did not generate" );
      }
    }
    finally {
      mapFile.delete();
      mapFile.getParentFile().delete();
    }
  }
  
  @Test
  public void testGenerateLandcoverConfiguration() throws IOException {
    mapserverGenerator.generateLandcoverConfiguration( "test" );
    
    File mapFile = new File( config.getString( "wps.output.location" ) + "test/landcoverPreview.map" );
    try {
      if ( !mapFile.exists() ) {
        fail( "Map file did not generate" );
      }
    }
    finally {
      mapFile.delete();
      mapFile.getParentFile().delete();
    }
  }
}
