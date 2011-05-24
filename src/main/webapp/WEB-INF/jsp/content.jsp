<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fieldset>
  <legend>Map Content Control:</legend>
  <ul id="contentList">
    <li>
      <input id="baseLayerCheckBox" type="checkbox" checked="checked" onclick="toggleLayer(g_baselayer, 'baseLayerCheckBox')" disabled="disabled"/>
      <label for="baseLayerCheckBox">Base Layer</label>
    </li>
    <li>
      <input id="rainfallCheckBox" type="checkbox" onclick="toggleLayer(g_rainfall, 'rainfallCheckBox')" />
      <label for="rainfallCheckBox">Rainfall</label>
    </li>
    <li>
      <input id="landcoverCheckBox" type="checkbox" onclick="toggleLayer(g_landcover, 'landcoverCheckBox')" />
      <label for="landcoverCheckBox">Landcover</label>
    </li>
    <li>
      <input id="landcoverPreviewCheckBox" type="checkbox" disabled="disabled" onclick="toggleLayer(g_landcoverPreview, 'landcoverPreviewCheckBox')" />
      <label for="landcoverPreviewCheckBox">Landcover Preview</label>
    </li>
    <li>
      <input id="erosionCheckBox" type="checkbox" onclick="toggleLayer(g_erosion, 'erosionCheckBox')" />
      <label for="erosionCheckBox">Erosion Coefficients</label>
    </li>
    <li>
      <input id="resultCheckBox" type="checkbox" disabled="disabled" onclick="toggleLayer(g_result, 'resultCheckBox')" />
      <label for="resultCheckBox">Result</label>
    </li>
  </ul>
</fieldset>
