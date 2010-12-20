<script type="text/javascript" defer="defer">
  var map = new OpenLayers.Map({
    div : "map",
    allOverlays : true
  });
  var baselayer = new OpenLayers.Layer.Google(
      "Google Streets", // the default
      {numZoomLevels: 20}
    );
  var rainfall = new OpenLayers.Layer.WMS(
      "OpenLayers WMS",
      "http://vmap0.tiles.osgeo.org/wms/vmap0",
      {layers : 'basic',
        visibility : false}
  );
  map.addLayers([baselayer, rainfall]);
  
  map.zoomToMaxExtent();
  rainfall.display( false );
</script>
