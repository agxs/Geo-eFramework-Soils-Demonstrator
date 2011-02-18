<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form id="soilErosionForm" commandName="soilErosionWps" action="processmodel" >
  <div id="variables">
    <fieldset>
      <legend>Edit Variables:</legend>
      <ul id="variablesList">
        <li>
          <label for="rainfallExponent">Rainfall Exponent:</label>
          <form:input path="rainfallExponent" cssClass="inputs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "rainfallExponent",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                invalidMessage : "Invalid rainfall exponent.",
                regExp : "\\d+(\\.\\d*)?",
                required : true
              }
            }));
          </script>
        </li>
        <li>
          <label for="streamConnectivity">Stream Connectivity:</label>
          <form:input path="streamConnectivity" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "streamConnectivity",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                invalidMessage : "Invalid stream connectivity constant.",
                regExp : "\\d+(\\.\\d*)?",
                required : true
              }
            }));
          </script>
        </li>
        <li>
          <label for="growFactor">Grow Factor:</label>
          <form:input path="growFactor" /><span class="units">metres</span>
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "growFactor",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                invalidMessage : "Invalid grow factor.",
                regExp : "\\-?\\d+(\\.\\d*)?",
                required : true
              }
            }));
          </script>
        </li>
        <li><div id="preview">
          <input id="previewGrow" type="submit" value="Preview Grow" onclick="lastButton = 'previewGrow'"/>
            <script type="text/javascript">
              Spring.addDecoration( new Spring.ValidateAllDecoration({
                elementId : "previewGrow",
                event : "onclick"
              }));
              Spring.addDecoration( new Spring.AjaxEventDecoration({
                elementId : "previewGrow",
                event : "onclick",
                formId : "soilErosionForm",
                params : { fragments : "controls" }
              }));
            </script></div>
        </li>
      </ul>
    </fieldset>
  </div>
  <div id="coverages">
    <fieldset>
      <legend>Data Coverages:</legend>
      <ul id="coveragesList">
        <li>
          <label>Rainfall Coverage:</label>
          <form:input path="rainfallWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "rainfallWcs",
              widgetType : "dijit.form.SimpleTextarea",
              widgetAttrs : {
                required : true,
                cols : 30
              }
            }));
          </script>
        </li>
        <li>
          <label>Landcover Coverage:</label>
          <form:input path="landcoverWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "landcoverWcs",
              widgetType : "dijit.form.SimpleTextarea",
              widgetAttrs : {
                required : true,
                cols : 30
              }
            }));
          </script>
        </li>
        <li>
          <label>Erosion Terrain Coverage:</label>
          <form:input path="erosionWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "erosionWcs",
              widgetType : "dijit.form.SimpleTextarea",
              widgetAttrs : {
                required : true,
                cols : 30
              }
            }));
          </script>
        </li>
      </ul>
    </fieldset>
  </div>
  <div id="process">
    <fieldset>
      <legend>Process:</legend>
      <div>
        <input id="submitProcess" type="submit" value="Submit Process" onclick="lastButton = 'submitProcess'"/>
        <script type="text/javascript">
          Spring.addDecoration( new Spring.ValidateAllDecoration({
            elementId : "submitProcess",
            event : "onclick"
          }));
          Spring.addDecoration( new Spring.AjaxEventDecoration({
            elementId : "submitProcess",
            event : "onclick",
            formId : "soilErosionForm",
            params : { fragments : "controls" }
          }));
        </script>
      </div>
      <div id="downloadLink">
        <script type="text/javascript">
        <c:if test="${!empty wpsResponse.outputUrl}">
          <c:out value="downloadUrl = '${wpsResponse.outputUrl}';" escapeXml="false" />
        </c:if>
      
        if ( downloadUrl != '' ) {
          var downloadLink = document.getElementById( 'downloadLink' );
          downloadLink.innerHTML = '<a href="' + downloadUrl + '">Download Output</a>';
        }
        </script>
      </div>
    </fieldset>
  </div>
</form:form>
<c:if test="${param['simple']}">
  <script type="text/javascript">
    document.getElementById('coverages').style.display = "none";
  </script>
</c:if>
