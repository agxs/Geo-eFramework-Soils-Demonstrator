package edina.eframework.gefcdemo.portrayal;

import java.io.IOException;


public interface WmsGenerator {
  public void generateResultConfiguration( String user ) throws IOException;
  public void generateLandcoverConfiguration( String user ) throws IOException;
}
