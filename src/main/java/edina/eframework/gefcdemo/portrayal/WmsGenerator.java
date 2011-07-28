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
