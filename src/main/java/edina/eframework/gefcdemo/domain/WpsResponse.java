package edina.eframework.gefcdemo.domain;

import java.net.URL;

/**
 * Contains the response details of the WPS process.
 * 
 * @author Andrew Seales
 */
public class WpsResponse {
  private URL outputUrl;
  private int status;
  
  /**
   * The URL to the output coverage that has just been processed if the process
   * was successful.
   * 
   * @return the URL to the user's processed output coverage
   */
  public URL getOutputUrl() {
    return outputUrl;
  }

  /**
   * The URL to the output coverage that has just been processed if the process
   * was successful.
   * 
   * @param outputUrl the URL to the user's processed output coverage
   */
  public void setOutputUrl( URL outputUrl ) {
    this.outputUrl = outputUrl;
  }
  
  public int getStatus() {
    return status;
  }
  
  public void setStatus( int status ) {
    this.status = status;
  }
}
