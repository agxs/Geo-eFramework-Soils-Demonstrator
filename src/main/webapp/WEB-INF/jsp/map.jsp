<script type="text/javascript" defer="defer">
  var map = new OpenLayers.Map('map');
  var gmap = new OpenLayers.Layer.Google(
      "Google Streets", // the default
      {numZoomLevels: 20}
    );
  map.addLayer(gmap);
  
  map.zoomToMaxExtent();
</script>
