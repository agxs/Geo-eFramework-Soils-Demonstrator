<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form id="soilErosionForm" commandName="soilErosionWps" action="processmodel" >
  <div id="variables">
    <table>
      <tr>
        <td>Rainfall Exponent:</td>
        <td>
          <form:input path="rainfallExponent" />
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
        </td>
      </tr>
      <tr>
        <td>Grow Factor:</td>
        <td>
          <form:input path="growFactor" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "growFactor",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                invalidMessage : "Invalid grow factor.",
                regExp : "\\d+(\\.\\d*)?",
                required : true
              }
            }));
          </script>
        </td>
      </tr>
      <tr>
        <td>Stream Connectivity</td>
        <td>
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
        </td>
      </tr>
    </table>
  </div>
  <div id="coverages">
    <table>
      <tr>
        <td>Rainfall WCS:</td>
        <td>
          <form:input path="rainfallWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "rainfallWcs",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                required : true
              }
            }));
          </script>
        </td>
      </tr>
      <tr>
        <td>Landcover WCS:</td>
        <td>
          <form:input path="landcoverWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "landcoverWcs",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                required : true
              }
            }));
          </script>
        </td>
      </tr>
      <tr>
        <td>Erosion Terrain WCS:</td>
        <td>
          <form:input path="erosionWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "erosionWcs",
              widgetType : "dijit.form.ValidationTextBox",
              widgetAttrs : {
                required : true
              }
            }));
          </script>
        </td>
      </tr>
    </table>
  </div>
  <div id="process">
    <input id="submitProcess" type="submit" value="Submit Process" />
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
</form:form>
