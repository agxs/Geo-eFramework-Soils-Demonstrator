package edina.eframework.gefcdemo.domain;

import java.net.URL;

/**
 * Contains the response details of the WPS process.
 * 
 * @author Andrew Seales
 */
public class WpsResponse {
  private URL outputUrl;
  private String outputId;
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
  
  /**
   * The download id from the wps indicating what result has just been created.
   * 
   * @return the id of the processed wps request.
   */
  public String getOutputId() {
    return outputId;
  }
  
  /**
   * The download id from the wps indicating what result has just been created.
   * 
   * @param outputId the id of the processed wps request.
   */
  public void setOutputId( String outputId ) {
    this.outputId = outputId;
  }
  
  /**
   * The response code from the WPS request. 200 is a success.
   * 
   * @return the response code from the WPS request.
   */
  public int getStatus() {
    return status;
  }
  
  /**
   * The response code from the WPS request. 200 is a success.
   * 
   * @param status the response code from the WPS request.
   */
  public void setStatus( int status ) {
    this.status = status;
  }
}
