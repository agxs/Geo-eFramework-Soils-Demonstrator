<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fieldset>
  <legend>Map Content Control:</legend>
  <ul>
    <li>
      <input id="baseLayerCheckBox" type="checkbox" checked="checked" onclick="toggleLayer(baselayer, 'baseLayerCheckBox')" />
      <label for="baseLayerCheckBox">Base Layer</label>
    </li>
    <li>
      <input id="rainfallCheckBox" type="checkbox" onclick="toggleLayer(rainfall, 'rainfallCheckBox')" />
      <label for="rainfallCheckBox">Rainfall</label>
    </li>
    <li>
      <input id="landcoverCheckBox" type="checkbox" onclick="toggleLayer(landcover, 'landcoverCheckBox')" />
      <label for="landcoverCheckBox">Landcover</label>
    </li>
    <li>
      <input id="erosionCheckBox" type="checkbox" onclick="toggleLayer(erosion, 'erosionCheckBox')" />
      <label for="erosionCheckBox">Erosion</label>
    </li>
    <li>
      <input id="resultCheckBox" type="checkbox" disabled="disabled" onclick="toggleLayer(result, 'resultCheckBox')" />
      <label for="resultCheckBox">Result</label>
    </li>
  </ul>
</fieldset>

<script type="text/javascript">
  function toggleLayer( layer, elementName ) {
    var element = document.getElementById( elementName );
    if ( element.checked ) {
      map.addLayer( layer );
      // Re-orders the layers to make sure they are in the correct order
      for ( i = 0; i < map.getNumLayers(); i++ ) {
        var mapLayer = map.layers[i];
        if ( mapLayer['z'] > layer['z'] ) {
          map.setLayerIndex( layer, map.getLayerIndex( mapLayer ) );
          break;
        }
      }
    } else {
      map.removeLayer( layer );
    }
  }
  function enableResult() {
    var resultCheckBox = document.getElementById( "resultCheckBox" );
    resultCheckBox.removeAttribute( "disabled" );
    
    if ( result != null ) {
      result.destroy();
    }
    result = new OpenLayers.Layer.WMS(
        "gefc_result",
        '<c:out value="${configParameters.resultUrl}" />' + 'cacheControl=' + (cacheControl++) + '&amp;',
        {
          layers : "gefc_result",
          image : "image/png",
          transparent : true,
        }
      );
    result['z'] = 4;
    // Make sure to insert this new layer at the top of the stack
    if ( resultCheckBox.checked ) {
      map.addLayer( result );
      map.setLayerIndex( result, 4 );
    }
  }
</script>
