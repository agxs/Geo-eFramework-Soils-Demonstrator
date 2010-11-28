<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <body>
    <p>You can see me! - wps servlet</p>
    <form:form commandName="soilErosionWps" >
      <table>
        <tr>
          <td>Rainfall WCS:</td>
          <td><form:input path="rainfallWcs" value="http://test/rainfall" /></td>
        </tr>
        <tr>
          <td>Landcover WCS:</td>
          <td><form:input path="landcoverWcs" value="http://test/landcover" /></td>
        </tr>
        <tr>
          <td>Erosion Terrain WCS:</td>
          <td><form:input path="erosionWcs" value="http://test/erosion" /></td>
        </tr>
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
        <tr>
          <td colspan="2">
            <input type="submit" value="Submit Process" />
          </td>
        </tr>
      </table>
    </form:form>
  </body>
</html>
