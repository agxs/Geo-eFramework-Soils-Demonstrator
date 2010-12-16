package edina.eframework.gefcdemo.helpers;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.support.BeanDefinitionReader;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigUtils;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.core.io.FileSystemResourceLoader;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.support.AbstractContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.GenericWebApplicationContext;

/**
 * Helper class to allow unit tests to load the web application context xml
 * files and have a ServletContext available. This is required to be able to
 * initialise the TileConfigurer class.
 * 
 * @see https://jira.springframework.org/browse/SPR-5243 for the issue
 * @see http://forum.springsource.org/showthread.php?t=62533&page=2
 *      for the workaround
 */
public class MockServletContextWebContextLoader extends AbstractContextLoader {

  @Override
  public ApplicationContext loadContext( String... locations ) throws Exception {
    ServletContext context = new MockServletContext("file:src/main/webapp", new FileSystemResourceLoader());
    final GenericWebApplicationContext webContext = new GenericWebApplicationContext();
    context.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, webContext);
    webContext.setServletContext(context);
    createBeanDefinitionReader(webContext).loadBeanDefinitions(locations);
    AnnotationConfigUtils.registerAnnotationConfigProcessors(webContext);
    webContext.refresh();
    webContext.registerShutdownHook();
    return webContext;
  }
  
  protected BeanDefinitionReader createBeanDefinitionReader(final GenericApplicationContext context) {
    return new XmlBeanDefinitionReader(context);
  }

  @Override
  protected String getResourceSuffix() {
    return "-context.xml";
  }
}
