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
    <script src="javascript/gefcdemo.js" type="text/javascript"></script>
    <script type="text/javascript">
      var result = null;  // the result OpenLayers.layer object
      var landcoverPreview = null; // the landcover preview OpenLayers.layer object
      var cacheControl = 0; // dummy parameter to stop map caching
      var lastButton = ''; // String - stores the last hit form button for handling responses
      var downloadUrl = ''; // String - stores url to download of wps response
      var blockedDiv; // Div that is shown/hidden over the form to block input
      function init() {
        dojo.connect( Spring.RemotingHandler.prototype, 'handleResponse', this, 'gefcResponseHandler' );
        dojo.connect( Spring.RemotingHandler.prototype, 'submitForm', this, 'gefcSubmitHandler' );
      }
      function gefcResponseHandler() {
        // Unblock form input div after result
        dojo.query(blockedDiv).unblock();
        
        // Enable map tickboxes after a submit
        if ( lastButton == 'submitProcess' ) {
          enableResult();
        }
        else if ( lastButton == 'previewGrow' ) {
          enableLandcover();
        }
      }
      function gefcSubmitHandler() {
        // Block form input to stop multiple submits
        blockedDiv = dojo.query( '#controls' ).block()[0];
      }
    </script>
  </head>
  <body onload="init()">
    <div id="map">
      <tiles:insertAttribute name="map" />
    </div>
    <div id="tools">
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
