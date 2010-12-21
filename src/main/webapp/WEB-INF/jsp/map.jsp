<script type="text/javascript" defer="defer">
  var map = new OpenLayers.Map({
    div : "map",
    allOverlays : false
  });
//  var baselayer = new OpenLayers.Layer.Google(
//      "Google Streets", // the default
//      {numZoomLevels: 20}
//    );
  var baselayer = new OpenLayers.Layer.WMS(
      "OpenLayers WMS",
      "http://vmap0.tiles.osgeo.org/wms/vmap0",
      {layers : 'basic',
        visibility : false
      }
    );
  var rainfall = new OpenLayers.Layer.WMS(
      "rainfall",
      "http://localhost/cgi-bin/mapserv?map=/var/www/data/rainfall.map&",
      {
        layers : "rainfall",
        image : "image/png",
        transparent : true
      }
    );
  var landcover = new OpenLayers.Layer.WMS(
      "landcover",
      "http://localhost/cgi-bin/mapserv?map=/var/www/data/landcover.map&",
      {
        layers : "landcover",
        image : "image/png",
        transparent : true
      }
    );
  var erosion = new OpenLayers.Layer.WMS(
      "erosion",
      "http://localhost/cgi-bin/mapserv?map=/var/www/data/erosion.map&",
      {
        layers : "erosion",
        image : "image/png",
        transparent : true
      }
    );
  map.addLayer(baselayer);
  
  map.zoomToExtent( new OpenLayers.Bounds( -9.5, 49.5, 4, 62 ) );
</script>
