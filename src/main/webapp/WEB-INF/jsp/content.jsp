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
    <input id="landcoverCheckBox" type="checkbox" />
    <label for="landcoverCheckBox">Landcover</label>
  </li>
  <li>
    <input id="erosionCheckBox" type="checkbox" />
    <label for="erosionCheckBox">Erosion</label>
  </li>
  <li>
    <input id="resultCheckbox" type="checkbox" disabled="disabled" onclick="gmap.display(false)") />
    <label for="resultCheckBox">Result</label>
  </li>
</ul>

<script type="text/javascript">
  function toggleLayer( layer, elementName ) {
    var element = document.getElementById( elementName );
    layer.display( element.checked );
  }
  function enableResult() {
    var resultCheckbox = document.getElementById( "resultCheckbox" );
    resultCheckbox.removeAttribute( "disabled" );
    // Add new layer to openlayers goes here
  }
</script>
