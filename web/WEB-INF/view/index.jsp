<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <title><spring:message code="view.title.index"/></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link href='http://fonts.googleapis.com/css?family=Chivo&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
</head>
<body>

<!-- x. Header -->
<div class="container font">
    <div class="row">
        <div class="col-8">
            <h1>E-shop
                <small class="text-muted"><spring:message code="view.index.headertitle"/></small>
            </h1>
        </div>
    </div>
    <!-- x. Agent search -->
    <div class="row">
        <div class="col-8">
            <h6>1. <spring:message code="view.index.agent.search"/></h6>
        </div>
    </div>
    <%-- x.x Agent search : Search with --%>
    <form:form action="${pageContext.request.contextPath}/findagent" method="post">
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"><spring:message code="view.index.agent.searchwith"/>:</div>
            <div class="col-5">
                <input type="radio" name="identifierType" value="agsymbol" checked><spring:message code="view.index.agent.searchwithsymbol"/><br>
                <input type="radio" name="identifierType" value="taxnumber"><spring:message code="view.index.agent.searchwithnip"/>
            </div>
        </div>
        <%-- x.x Agent search : Search value --%>
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"><spring:message code="view.index.agent.searchval"/>:</div>
            <div class="col-5"><input type="text" name="identifierValue" placeholder="AG_SYMBOL / NIP"/></div>
        </div>
        <%-- x.x Agent search :  Error --%>
        <c:if test="${formerror == 'noAgentFound'}">
            <div class="row justify-content-start">
                <div class="col-1"></div>
                <div class="col-4 text-center alert alert-danger">
                    <spring:message code="view.index.agent.notfound"/>
                </div>
            </div>
        </c:if>
        <%-- x.x Agent search :  Search button --%>
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"></div>
            <div class="col-5">
                <button class="btn btn-success" type="submit"><spring:message code="view.index.agent.searchbutton"/></button>
            </div>
        </div>
    </form:form>
    <!-- x. Agent data -->
    <c:if test="${agent != null}">
        <div class="row">
            <div class="col-8">
                <h6>2. <spring:message code="view.index.agent.agentdata"/></h6>
            </div>
        </div>
        <!-- x.x Agent data : Agent symbol -->
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"><spring:message code="view.index.agent.agsymbol"/>:</div>
            <div class="col-5">${agent.agSymbol}</div>
        </div>
        <!-- x.x Agent data : Tax number -->
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"><spring:message code="view.index.agent.nip"/>:</div>
            <div class="col-5">${agent.taxNumber}</div>
        </div>
        <!-- x.x Agent data : WWW -->
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"><spring:message code="view.index.agent.www"/>:</div>
            <div class="col-5"><input type="text" value="${agent.www}"></div>
        </div>
        <!-- x.x Agent data : Update www -->
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2"></div>
            <div class="col-5">
                <button class="btn btn-success" type="submit"><spring:message code="view.index.agent.update"/></button>
            </div>
        </div>
    </c:if>
    <c:if test="${dupadada != NULL}">
        <br>
        <!-- x. Footer preview -->
        <div class="row">
            <div class="col-8">
                <h6>3. <spring:message code="view.index.preview"/></h6>
            </div>
        </div>
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-7">Stopaaa</div>
        </div>
        <br>
        <!-- x. Choose links -->
        <!-- x.x List -->
        <div class="row">
            <div class="col-8">
                <h6>4. <spring:message code="view.index.links.choose"/></h6>
            </div>
        </div>
        <div class="row justify-content-start">
            <div class="col-8"><b>TRAVEL</b></div>
        </div>
        <div class="row justify-content-start">
            <div class="col-1 text-right my-auto"><input type="checkbox"></div>
            <div class="col-7 my-auto">Przykładowy link</div>
        </div>
        <!-- x.x Options -->
        <div class="row justify-content-start">
            <div class="col-1"></div>
            <div class="col-2">
                <button class="btn btn-success" type="submit"><spring:message code="view.index.links.copy"/></button>
            </div>
            <div class="col-2">
                <button class="btn btn-success" type="submit"><spring:message code="view.index.links.mail"/></button>
            </div>
        </div>
    </c:if>
    <!-- x. Footer -->
    <div class="row">
        <div class="col-8">
            <h6>Footer</h6>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
