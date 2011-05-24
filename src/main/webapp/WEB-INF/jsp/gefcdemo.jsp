<%@ page contentType="text/html; charset=UTF-8" %><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>GeFC Demonstrator</title>
    <link rel="stylesheet" href="./theme/default/style.css" type="text/css" />
    <link rel="stylesheet" href="./theme/default/google.css" type="text/css" />
    <link rel="stylesheet" href="<c:url value="/resources/dijit/themes/tundra/tundra.css" />" type="text/css" />
    <link rel="stylesheet" href="./css/gefcdemo.css" type="text/css" />
    <script src="./OpenLayers.js" type="text/javascript"></script>
    <script src="<c:url value="/resources/dojo/dojo.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/spring/Spring.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/spring/Spring-Dojo.js" />" type="text/javascript"></script>
    <script src="javascript/blocker.js" type="text/javascript"></script>
    <script src="javascript/gefcdemo.js" type="text/javascript"></script>
    <script type="text/javascript">
      // Set up special globals using JSP
      
      // Simple interface or not
      var g_simple = false;
      <c:if test="${param['simple']}">
        g_simple = true;
      </c:if>
      // Rainfall WMS url
      var g_rainfallWms = '<c:out value="${configParameters.rainfallUrl}" />';
      // Landcover WMS url
      var g_landcoverWms = '<c:out value="${configParameters.landCoverUrl}" />';
      // Erosion WMS url
      var g_erosionWms = '<c:out value="${configParameters.erosionUrl}" />';
      // Places WMS url
      var g_placesWms = '<c:out value="${configParameters.placesUrl}" />';
      // Result WMS url
      var g_resultWms = '<c:out value="${configParameters.resultUrl}" />';
      // Landcover Preview WMS urls
      var g_landcoverPreviewWms = '<c:out value="${configParameters.landCoverPreviewUrl}" />';
    </script>
  </head>
  <body onload="init()">
    <div id="map">
      <tiles:insertAttribute name="map" />
    </div>
    <div id="tools">
      <div id="help">
        <a href="help.html" onclick="window.open('./help.html', 'Help', 'status=1,width=550,resizable=1,scrollbars=1'); return false;">Help</a>
      </div>
      <div id="content">
        <tiles:insertAttribute name="content" />
      </div>
      <div id="legend">
        <tiles:insertAttribute name="legend" />
      </div>
      <div id="controls">
        <tiles:insertAttribute name="controls" />
      </div>
    </div>
  </body>
</html>
