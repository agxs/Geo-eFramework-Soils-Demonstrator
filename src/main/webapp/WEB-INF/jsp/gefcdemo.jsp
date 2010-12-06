<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>GeFC Demonstrator</title>
    <link rel="stylesheet" href="./theme/default/style.css" type="text/css" />
    <link rel="stylesheet" href="./theme/default/google.css" type="text/css" />
    <script src="./OpenLayers.js" type="text/javascript"></script>
    <script src='http://maps.google.com/maps?file=api&amp;v=2&amp;'></script>
  </head>
  <body>
    <p>You can see me! - map servlet</p>
    <div style="width:600px; height:400px" id="map"></div>
    <script type="text/javascript" defer="defer">
      var map = new OpenLayers.Map('map');
      var gmap = new OpenLayers.Layer.Google(
          "Google Streets", // the default
          {numZoomLevels: 20}
        );
      map.addLayer(gmap);
      
      map.zoomToMaxExtent();
    </script>
  </body>
</html>
