<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" defer="defer">
  var bounds = new OpenLayers.Bounds( -20037508.34, -20037508.34, 20037508.34, 20037508.34 );
  var map = new OpenLayers.Map({
    controls: [],
    div : "map",
    allOverlays : true,
    projection: new OpenLayers.Projection( "EPSG:900913" ),
    units: "m",
    maxExtent: bounds
  });
  var baselayer = new OpenLayers.Layer.OSM();
  baselayer['z'] = 0;
  var rainfall = new OpenLayers.Layer.WMS(
      "rainfall",
      '<c:out value="${configParameters.rainfallUrl}" />',
      {
        layers : "rainfall",
        image : "image/png",
        transparent : true
      }
    );
  rainfall['z'] = 1;
  var landcover = new OpenLayers.Layer.WMS(
      "landcover",
      '<c:out value="${configParameters.landCoverUrl}" />',
      {
        layers : "landcover",
        image : "image/png",
        transparent : true
      }
    );
  landcover['z'] = 2;
  var erosion = new OpenLayers.Layer.WMS(
      "erosion",
      '<c:out value="${configParameters.erosionUrl}" />',
      {
        layers : "erosion",
        image : "image/png",
        transparent : true
      }
    );
  erosion['z'] = 4; // 3 is reserved for the landcover preview
  var places = new OpenLayers.Layer.WMS(
      "eframework_places",
      '<c:out value="${configParameters.placesUrl}" />',
      {
        layers : "eframework_places",
        image : "image/png",
        transparent : true
      }
    );
  places['z'] = 6; // 5 is reserved for the result
  
  map.addLayers([baselayer,places]);
  
  map.addControl( new OpenLayers.Control.Navigation() );
  map.addControl( new OpenLayers.Control.Scale() );
  map.addControl( new OpenLayers.Control.PanZoomBar() );
  map.addControl( new OpenLayers.Control.MousePosition() );
  
  map.zoomToExtent( new OpenLayers.Bounds( -2400000, 5500000, 1500000, 9000000 ),
                    true );
</script>
