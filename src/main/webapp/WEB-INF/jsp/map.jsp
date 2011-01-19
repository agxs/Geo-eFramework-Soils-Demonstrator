<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" defer="defer">
  var bounds = new OpenLayers.Bounds( 0, 0, 700000, 1300000 );
  var map = new OpenLayers.Map({
    controls: [],
    div : "map",
    allOverlays : true,
    projection: new OpenLayers.Projection( "EPSG:27700" ),
    units: "m",
    maxExtent: bounds,
    resolutions: [2000,1250,1000,400,200,50,25,4.41,3.53,2,2.5,1.25,0.625]
  });
//  var baselayer = new OpenLayers.Layer.Google(
//      "Google Streets", // the default
//      {numZoomLevels: 20}
//    );
  var baselayer = new OpenLayers.Layer.WMS(
      "OpenLayers WMS",
      '<c:out value="${configParameters.baselayerUrl}" />',
      {
        format: 'image/png',
        layers : 'vml_OS_background',
        visibility : false,
      }
    );
  baselayer['z'] = 0;
  var rainfall = new OpenLayers.Layer.WMS(
      "rainfall",
      '<c:out value="${configParameters.rainfallUrl}" />',
      {
        layers : "rainfall",
        image : "image/png",
        transparent : true,
      }
    );
  rainfall['z'] = 1;
  var landcover = new OpenLayers.Layer.WMS(
      "landcover",
      '<c:out value="${configParameters.landCoverUrl}" />',
      {
        layers : "landcover",
        image : "image/png",
        transparent : true,
      }
    );
  landcover['z'] = 2;
  var erosion = new OpenLayers.Layer.WMS(
      "erosion",
      '<c:out value="${configParameters.erosionUrl}" />',
      {
        layers : "erosion",
        image : "image/png",
        transparent : true,
        myprop : 3
      }
    );
  erosion['z'] = 3;
  map.addLayer(baselayer);
  
  map.addControl( new OpenLayers.Control.Navigation() );
  map.addControl( new OpenLayers.Control.Scale() );
  map.addControl( new OpenLayers.Control.PanZoomBar() );
  
  map.zoomToMaxExtent();
</script>
