<script type="text/javascript" defer="defer">
  var bounds = new OpenLayers.Bounds( 0, 0, 700000, 1300000 );
  var map = new OpenLayers.Map({
    controls: [],
    div : "map",
    allOverlays : false,
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
      "http://canisp.edina.ac.uk:7992/cgi-mapserv/mapserv?",
      { 
        map: 'mapfiles/fhf_test/vml_OS_background.map',
        format: 'image/png',
        layers : 'vml_OS_background',
        visibility : false
      }
    );
  var rainfall = new OpenLayers.Layer.WMS(
      "rainfall",
      "http://localhost/cgi-bin/mapserv?map=/var/www/data/rainfall.map&amp;",
      {
        layers : "rainfall",
        image : "image/png",
        transparent : true
      }
    );
  var landcover = new OpenLayers.Layer.WMS(
      "landcover",
      "http://localhost/cgi-bin/mapserv?map=/var/www/data/landcover.map&amp;",
      {
        layers : "landcover",
        image : "image/png",
        transparent : true
      }
    );
  var erosion = new OpenLayers.Layer.WMS(
      "erosion",
      "http://localhost/cgi-bin/mapserv?map=/var/www/data/erosion.map&amp;",
      {
        layers : "erosion",
        image : "image/png",
        transparent : true
      }
    );
  map.addLayer(baselayer);
  
  map.addControl( new OpenLayers.Control.Navigation() );
  map.addControl( new OpenLayers.Control.Scale() );
  map.addControl( new OpenLayers.Control.PanZoomBar() );
  
  map.zoomToMaxExtent();
</script>
