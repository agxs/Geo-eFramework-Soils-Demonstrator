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

/**
 * This class simply retrieves properties from the Apache Commons Configurations
 * and makes these properties available to JSP pages. JSTL isn't really up to
 * this as you can't use do, eg, functions directly on the config object. This
 * class also does any required manipulations to properties, eg, combining them
 * with other properties.
 * 
 * @author Andrew Seales
 */
public class ConfigParameters {
  private String rainfallUrl; // URL to WMS preview of rainfall data
  private String landCoverUrl; // URL to WMS preview of landcover data
  private String landCoverPreviewUrl; // URL for generated landcover WMS preview
  private String erosionUrl; // URL to WMS preview of erosion coefficient data
  private String resultUrl; // URL to WMS preview of the result data
  private String placesUrl; // URL to the city and coast outline data
  
  public String getRainfallUrl() {
    return rainfallUrl;
  }
  
  public void setRainfallUrl( String rainfallUrl ) {
    this.rainfallUrl = rainfallUrl;
  }
  
  public String getLandCoverUrl() {
    return landCoverUrl;
  }
  
  public void setLandCoverUrl( String landCoverUrl ) {
    this.landCoverUrl = landCoverUrl;
  }
  
  public String getLandCoverPreviewUrl() {
    return landCoverPreviewUrl;
  }
  
  public void setLandCoverPreviewUrl( String landCoverPreviewUrl ) {
    this.landCoverPreviewUrl = landCoverPreviewUrl;
  }
  
  public String getErosionUrl() {
    return erosionUrl;
  }
  
  public void setErosionUrl( String erosionUrl ) {
    this.erosionUrl = erosionUrl;
  }
  
  public String getResultUrl() {
    return resultUrl;
  }
  
  public void setResultUrl( String resultUrl ) {
    this.resultUrl = resultUrl;
  }

  public String getPlacesUrl() {
    return placesUrl;
  }

  public void setPlacesUrl( String placesUrl ) {
    this.placesUrl = placesUrl;
  }
}
