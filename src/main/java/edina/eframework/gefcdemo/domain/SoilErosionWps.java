/*
 * Copyright 2011 by EDINA, University of Edinburgh
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package edina.eframework.gefcdemo.domain;

import java.net.URL;

/**
 * This domain object stores the user customisable parameters from the main
 * interface. The data stored in this object is used to create a WPS request
 * to calculate the soil erosion model. A better explanation of the parameters
 * can be found in the paper "An erosion model for evaluating regional land-use
 * scenarios" by John Dymond, et al.
 * 
 * @author Andrew Seales
 */
public class SoilErosionWps {
  private double growFactor;
  private double rainfallExponent;
  private double streamConnectivity;
  private URL rainfallWcs;
  private URL landcoverWcs;
  private URL erosionWcs;
  
  /**
   * Gets the grow factor to apply to the land cover dataset. The default value
   * is 0 to indicate that there is no growth or shrinkage. Valid values can be
   * positive or negative.
   * 
   * @return The grow factor to apply to the land cover dataset.
   */
  public double getGrowFactor() {
    return growFactor;
  }

  /**
   * Sets the grow factor to apply to the land cover dataset. The default value
   * is 0 to indicate that there is no growth or shrinkage. Valid values can be
   * positive or negative.
   * 
   * @param growFactor grow factor to apply to the land cover dataset.
   */
  public void setGrowFactor( double growFactor ) {
    this.growFactor = growFactor;
  }
  
  /**
   * Gets the exponent to apply to the rainfall data. The default value is 2 to
   * indicate that the rainfall data is squared. Valid values are positive but
   * can include 0.
   * 
   * @return The exponent to apply to the rainfall data.
   */
  public double getRainfallExponent() {
    return rainfallExponent;
  }

  /**
   * Gets the exponent to apply to the rainfall data. The default value is 2 to
   * indicate that the rainfall data is squared. Valid values are positive but
   * can include 0.
   * 
   * @param rainfallExponent the exponent to apply to the rainfall data.
   */
  public void setRainfallExponent( double rainfallExponent ) {
    this.rainfallExponent = rainfallExponent;
  }
  
  /**
   * Gets the stream connectivity constant. The default value is 1 to indicate
   * that all the erosion sediment ends up in a stream network. Valid values
   * are between 0 and 1, inclusive.
   * 
   * @return The stream connectivity constant.
   */
  public double getStreamConnectivity() {
    return streamConnectivity;
  }

  /**
   * Gets the stream connectivity constant. The default value is 1 to indicate
   * that all the erosion sediment ends up in a stream network. Valid values
   * are between 0 and 1, inclusive.
   * 
   * @param streamConnectivity the stream connectivity constant.
   */
  public void setStreamConnectivity( double streamConnectivity ) {
    this.streamConnectivity = streamConnectivity;
  }
  
  /**
   * The GetCapabilities URL for the WCS server containing rainfall data. This
   * URL should include all the GET parameters required to actually return a
   * correct document.
   * 
   * @return A GetCapabilities URL.
   */
  public URL getRainfallWcs() {
    return rainfallWcs;
  }

  /**
   * The GetCapabilities URL for the WCS server containing rainfall data. This
   * URL should include all the GET parameters required to actually return a
   * correct document.
   * 
   * @param rainfallWcs a GetCapabilities URL.
   */
  public void setRainfallWcs( URL rainfallWcs ) {
    this.rainfallWcs = rainfallWcs;
  }
  
  /**
   * The GetCapabilities URL for the WCS server containing land cover data. This
   * URL should include all the GET parameters required to actually return a
   * correct document.
   * 
   * @return A GetCapabilities URL.
   */
  public URL getLandcoverWcs() {
    return landcoverWcs;
  }
  
  /**
   * The GetCapabilities URL for the WCS server containing land cover data. This
   * URL should include all the GET parameters required to actually return a
   * correct document.
   * 
   * @param landcoverWcs a GetCapabilities URL.
   */
  public void setLandcoverWcs( URL landcoverWcs ) {
    this.landcoverWcs = landcoverWcs;
  }
  
  /**
   * The GetCapabilities URL for the WCS server containing erosion data. This
   * URL should include all the GET parameters required to actually return a
   * correct document.
   * 
   * @return A GetCapabilities URL.
   */
  public URL getErosionWcs() {
    return erosionWcs;
  }
  
  /**
   * The GetCapabilities URL for the WCS server containing erosion data. This
   * URL should include all the GET parameters required to actually return a
   * correct document.
   * 
   * @param erosionWcs a GetCapabilities URL.
   */
  public void setErosionWcs( URL erosionWcs ) {
    this.erosionWcs = erosionWcs;
  }
}
