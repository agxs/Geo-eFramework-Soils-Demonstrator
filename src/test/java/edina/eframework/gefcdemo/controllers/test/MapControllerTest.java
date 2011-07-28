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

package edina.eframework.gefcdemo.controllers.test;

import static org.junit.Assert.assertEquals;

import java.net.MalformedURLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edina.eframework.gefcdemo.controllers.MapController;
import edina.eframework.gefcdemo.domain.ConfigParameters;
import edina.eframework.gefcdemo.domain.SoilErosionWps;
import edina.eframework.gefcdemo.helpers.MockServletContextWebContextLoader;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = MockServletContextWebContextLoader.class,
                      locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml",
                                   "file:src/main/webapp/WEB-INF/gefcdemo-servlet.xml"})
public class MapControllerTest {

  @Autowired
  private MapController mapController;
  
  @Test
  public void testHandleMap() throws MalformedURLException {
    String viewName = mapController.handleMap( new SoilErosionWps(), new ConfigParameters() );
    assertEquals( "Unexpected view name returned from MapController.",
                  "gefcdemo", viewName );
  }
}
