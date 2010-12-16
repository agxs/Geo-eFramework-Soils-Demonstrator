<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form  commandName="soilErosionWps" action="processmodel" >
  <div id="variables">
    <table>
      <tr>
        <td>Rainfall Exponent:</td>
        <td><form:input path="rainfallExponent" value="2.0" /></td>
      </tr>
      <tr>
        <td>Grow Factor:</td>
        <td><form:input path="growFactor" value="0.0" /></td>
      </tr>
      <tr>
        <td>Stream Connectivity</td>
        <td><form:input path="streamConnectivity" value="1.0" /></td>
      </tr>
    </table>
  </div>
  <div id="coverages">
    <table>
      <tr>
        <td>Rainfall WCS:</td>
        <td><form:input path="rainfallWcs" value="http://localhost/data/rainfall.tiff" /></td>
      </tr>
      <tr>
        <td>Landcover WCS:</td>
        <td><form:input path="landcoverWcs" value="http://localhost/data/landcover.tiff" /></td>
      </tr>
      <tr>
        <td>Erosion Terrain WCS:</td>
        <td><form:input path="erosionWcs" value="http://localhost/data/erosion.tiff" /></td>
      </tr>
    </table>
  </div>
  <div id="process">
    <input type="submit" value="Submit Process" />
  </div>
</form:form>
