var g_baselayer = null; // baselayer OpenLayers.layer object
var g_rainfall = null; // rainfall OpenLayers.layer object
var g_landcover = null; // landcover OpenLayers.layer object
var g_erosion = null; // erosion OpenLayers.layer object
var g_result = null;  // the result OpenLayers.layer object
var g_landcoverPreview = null; // the landcover preview OpenLayers.layer object
var g_cacheControl = 0; // dummy parameter to stop map caching
var g_lastButton = ''; // String - stores the last hit form button for handling responses
var g_downloadUrl = ''; // String - stores url to download of wps response
var g_blockedDiv; // Div that is shown/hidden over the form to block input
var g_map; // The OpenLayers.Map object

/**
 * Body on load init method.
 */
function init() {
  dojo.connect( Spring.RemotingHandler.prototype, 'handleResponse', this, 'gefcResponseHandler' );
  dojo.connect( Spring.RemotingHandler.prototype, 'submitForm', this, 'gefcSubmitHandler' );
}

/**
 * Response handler for AJAX requests. This method is ran after every AJAX
 * response is received.
 */
function gefcResponseHandler() {
  // Unblock form input div after result
  dojo.query(g_blockedDiv).unblock();
  
  // Enable map tickboxes after a submit
  if ( g_lastButton == 'submitProcess' ) {
    enableResult();
  }
  else if ( g_lastButton == 'previewGrow' ) {
    enableLandcover();
  }
}

/**
 * Submit handler for AJAX requests. This method is ran before every AJAX
 * request is sent.
 */
function gefcSubmitHandler() {
  // Block form input to stop multiple submits
  g_blockedDiv = dojo.query( '#controls' ).block()[0];
}

/**
 * Initialises the OpenLayers map. Adds all the WMS layers
 * @returns
 */
function initMap() {
  var bounds = new OpenLayers.Bounds( -20037508.34, -20037508.34, 20037508.34, 20037508.34 );
  g_map = new OpenLayers.Map({
    controls: [],
    div : "map",
    allOverlays : true,
    projection: new OpenLayers.Projection( "EPSG:900913" ),
    units: "m",
    maxExtent: bounds
  });
  g_baselayer = new OpenLayers.Layer.OSM();
  g_baselayer['z'] = 0;
  g_rainfall = new OpenLayers.Layer.WMS(
      "rainfall",
      g_rainfallWms,
      {
        layers : "rainfall",
        image : "image/png",
        transparent : true
      }
    );
  g_rainfall['z'] = 1;
  g_landcover = new OpenLayers.Layer.WMS(
      "landcover",
      g_landcoverWms,
      {
        layers : "landcover",
        image : "image/png",
        transparent : true
      }
    );
  g_landcover['z'] = 2;
  g_erosion = new OpenLayers.Layer.WMS(
      "erosion",
      g_erosionWms,
      {
        layers : "erosion",
        image : "image/png",
        transparent : true
      }
    );
  g_erosion['z'] = 4; // 3 is reserved for the landcover preview
  g_places = new OpenLayers.Layer.WMS(
      "eframework_places",
      g_placesWms,
      {
        layers : "eframework_places",
        image : "image/png",
        transparent : true
      }
    );
  g_places['z'] = 6; // 5 is reserved for the result
  
  g_map.addLayers([g_baselayer,g_places]);
  
  g_map.addControl( new OpenLayers.Control.Navigation() );
  g_map.addControl( new OpenLayers.Control.Scale() );
  g_map.addControl( new OpenLayers.Control.PanZoomBar() );
  g_map.addControl( new OpenLayers.Control.MousePosition() );
  
  g_map.zoomToExtent( new OpenLayers.Bounds( -2400000, 5500000, 1500000, 9000000 ),
                      true );
}

function toggleLayer( layer, elementName ) {
  var element = document.getElementById( elementName );
  if ( element.checked ) {
    g_map.addLayer( layer );
    reorderLayers( layer );
  } else {
    g_map.removeLayer( layer );
  }
}

function enableResult() {
  if ( g_simple ) {
    document.getElementById('coverages').style.display = "none";
  }

  var resultCheckBox = document.getElementById( "resultCheckBox" );
  resultCheckBox.removeAttribute( "disabled" );
  
  if ( g_result != null ) {
    g_result.destroy();
  }
  g_result = new OpenLayers.Layer.WMS(
      "gefc_result",
      g_resultWms + 'cacheControl=' + (g_cacheControl++) + '&amp;',
      {
        layers : "gefc_result",
        image : "image/png",
        transparent : true
      }
    );
  g_result['z'] = 5;
  // Make sure to insert this new layer at the top of the stack
  if ( resultCheckBox.checked ) {
    g_map.addLayer( g_result );
    g_map.setLayerIndex( g_result, 5 );
    reorderLayers( g_result );
  }
}

function enableLandcover() {
  if ( g_simple ) {
    document.getElementById('coverages').style.display = "none";
  }

  var landcoverPreviewCheckBox = document.getElementById( "landcoverPreviewCheckBox" );
  landcoverPreviewCheckBox.removeAttribute( "disabled" );
  
  if ( g_landcoverPreview != null ) {
    g_landcoverPreview.destroy();
  }
  g_landcoverPreview = new OpenLayers.Layer.WMS(
      "landcoverPreview",
      g_landcoverPreviewWms + 'cacheControl=' + (g_cacheControl++) + '&amp;',
      {
        layers : "landcoverPreview",
        image : "image/png",
        transparent : true
      }
    );
  g_landcoverPreview['z'] = 3;
  // Make sure to insert this new layer at the top of the stack
  if ( landcoverPreviewCheckBox.checked ) {
    g_map.addLayer( g_landcoverPreview );
    g_map.setLayerIndex( g_landcoverPreview, 3 );
    reorderLayers( g_landcoverPreview );
  }
}

function reorderLayers( layer ) {
  // Re-orders the layers to make sure they are in the correct order
  for ( i = 0; i < g_map.getNumLayers(); i++ ) {
    var mapLayer = g_map.layers[i];
    if ( mapLayer['z'] > layer['z'] ) {
      g_map.setLayerIndex( layer, g_map.getLayerIndex( mapLayer ) );
      break;
    }
  }
}
