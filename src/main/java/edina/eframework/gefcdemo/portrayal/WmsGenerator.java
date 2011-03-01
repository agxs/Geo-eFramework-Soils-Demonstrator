package edina.eframework.gefcdemo.portrayal;

import java.io.IOException;

/**
 * Interface which generates a portrayal service from the WPS result of the
 * soil erosion model and the landcover preview.
 * 
 * @TODO should probably use Spring Principals rather than passing in a String
 * 
 * @author Andrew Seales
 */
public interface WmsGenerator {
  /**
   * Generates a WMS which points to the result of the WPS soil erosion model.
   * 
   * @param user the user id who made the request
   * @throws IOException
   */
  public void generateResultConfiguration( String user ) throws IOException;
  
  /**
   * Generates a WMS which points to the landcover preview result.
   * 
   * @param user the user id who made the request
   * @throws IOException
   */
  public void generateLandcoverConfiguration( String user ) throws IOException;
}
