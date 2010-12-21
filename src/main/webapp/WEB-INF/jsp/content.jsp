<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">
  function toggleLayer( layer, elementName ) {
    var element = document.getElementById( elementName );
    if ( element.checked ) {
      map.addLayer( layer );
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
        "http://localhost/cgi-bin/mapserv?map=/var/www/data/aseales/result.map&cacheControl="
            + (cacheControl++) + "&",
        {
          layers : "gefc_result",
          image : "image/png",
          transparent : true
        }
      );
    if ( resultCheckBox.checked ) {
      map.addLayer( result );
    }
  }
</script>
