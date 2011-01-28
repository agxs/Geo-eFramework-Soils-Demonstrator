<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form id="soilErosionForm" commandName="soilErosionWps" action="processmodel" >
  <div id="variables">
    <fieldset>
      <legend>Edit Variables:</legend>
      <ul>
        <li>
          <label>Rainfall Exponent:</label>
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
          <label>Grow Factor:</label>
          <form:input path="growFactor" />
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
        <li>
          <label>Stream Connectivity</label>
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
      </ul>
    </fieldset>
  </div>
  <div id="coverages">
    <fieldset>
      <legend>Data Coverages:</legend>
      <ul>
        <li>
          <label>Rainfall Coverage:</label>
          <form:input path="rainfallWcs" />
          <script type="text/javascript">
            Spring.addDecoration( new Spring.ElementDecoration({
              elementId : "rainfallWcs",
              widgetType : "dijit.form.SimpleTextarea",
              widgetAttrs : {
                required : true
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
                required : true
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
                required : true
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
      <c:if test="${!empty wpsResponse.outputUrl}">
        <a href="<c:out value="${wpsResponse.outputUrl}" />">Download Output</a>
      </c:if>
    </fieldset>
    <c:if test="${param['simple']}">
      <script type="text/javascript">
        document.getElementById('coverages').style.display = "none";
      </script>
    </c:if>
  </div>
</form:form>
