<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/extensions" prefix="t" %>
<%@ taglib uri="http://jboss.org/customCD" prefix="custom" %>

<html>
  <head>
    <title>CD manager</title>
    <style type="text/css">
      .error {
        color: red;
   	    font-size: 10px; 
      }
      .myCSSClass {
        text-decoration: underline
      }
    </style>
  </head>
  <body>
  <f:view>
  
    <!-- BEGIN Display last entered CD -->
    <custom:mytag text="Last entered CD" cssClass="myCssClass"/>
    <h:outputText value="#{cd.title}" /><br/>
    <h:outputText value="#{cd.cddb}">
      <f:converter converterId="cddbConverter"/>
    </h:outputText><br/>
    <h:outputText value="#{cd.publishedDate}">
      <f:convertDateTime type="date" dateStyle="long"/>
    </h:outputText><br/>
    <% /*  TODO: Display the CD price */ %>
    <% /*  TODO: Add a convertNumber with attributes: type="currency" currencyCode="CHF" to the cd price output */ %>
    <h:outputText value="#{cd.price}">
      <f:convertNumber type="currency" currencyCode="CHF"/>
    </h:outputText><br/><br/>
    <!-- END Display last entered CD -->
  
    <!-- BEGIN Display cds -->
    <custom:mytag text="All CDs"/>
    <h:dataTable value="#{collection.cds}" var="cdItem">
      <h:column>
        <custom:cd cdTitle="#{cdItem.title}"/>
      </h:column>
    </h:dataTable>
    <!-- END Display photos -->
            
    <!-- BEGIN Add CD -->
    <custom:mytag id="addCD" text="Add a new CD"/>
    <h:form>
      <table>
        <tr>
          <td>Title:</td>
          <td><h:inputText id="title" value="#{cd.title}" required="true" /><br/>
            <h:message for="title" styleClass="error"/></td>
        </tr>
        <tr>
          <td>CDDB:</td>
          <td>
            <h:inputText id="cddb" value="#{cd.cddb}">
              <f:converter converterId="cddbConverter"/>
              <f:validator validatorId="cddbValidator"/>
            </h:inputText><br/>
            <h:message for="cddb" styleClass="error"/>
          </td>
        </tr>
        <tr>
          <td>Date:</td>
          <td>
            <h:inputText id="date" value="#{cd.publishedDate}" required="true">
              <f:convertDateTime type="date" dateStyle="short"/>
            </h:inputText><br/>
            <h:message for="date" styleClass="error"/>
          </td>
        </tr>
        <tr>
          <td>Price:</td>
          <td>
            <% /*  TODO: Add an input field for the CD price */ %>
            <% /*  TODO: Add an error message display in case of validation error */ %>
            <% /*  TODO: Add a range validation between 1 and 100 by using validateDoubleRange */ %>
            <h:inputText id="price" value="#{cd.price}">
              <f:validateDoubleRange minimum="1" maximum="100"/>
            </h:inputText><br/>
            <h:message for="price" styleClass="error"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <h:commandButton value="Add cd" action="#{collection.addCd}" />
          </td>
        </tr>
      </table>
    </h:form>
    <!-- END Add cd -->
            
  </f:view>
  </body>
</html>