<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="view.title.index"/></title>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link href='http://fonts.googleapis.com/css?family=Chivo&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <%-- Tooltip enable --%>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
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
    <c:if test="${agent == null}">
        <div class="row">
            <div class="col-8">
                <h6><spring:message code="view.index.agent.search"/></h6>
            </div>
        </div>
        <%-- x.x Agent search : Search with --%>
        <form:form action="${pageContext.request.contextPath}/findagent" method="post">
            <div class="row justify-content-start">
                <div class="col-1"></div>
                <div class="col-2"><spring:message code="view.index.agent.searchwith"/>:</div>
                <div class="col-5">
                    <input type="radio" name="identifierType" value="agsymbol"><spring:message code="view.index.agent.searchwithsymbol"/><br>
                    <input type="radio" name="identifierType" value="taxnumber"><spring:message code="view.index.agent.searchwithnip"/><br>
                </div>
            </div>
            <%-- x.x Agent search : Search value --%>
            <div class="row justify-content-start">
                <div class="col-1"></div>
                <div class="col-2"><spring:message code="view.index.agent.searchval"/>:</div>
                <div class="col-5"><input type="text" name="identifierValue" placeholder="AG_SYMBOL / NIP" value="${formerror_identifierValue}"/></div>
            </div>
            <%-- x.x Agent search :  Error --%>
            <c:if test="${formerror == 'noAgentFound'}">
                <div class="row justify-content-start">
                    <div class="col-5 text-center alert alert-danger">
                        <spring:message code="view.index.agent.notfound"/>
                        <c:if test="${formerror_identifierType == 'agsymbol'}"> agenta </c:if>
                        <c:if test="${formerror_identifierType == 'taxnumber'}"> NIP </c:if>
                        = ${formerror_identifierValue}
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
    </c:if>
    <!-- x. Agent data -->
    <c:if test="${agent != null}">
        <!-- x.x Agent data : Search again -->
        <div class="row">
            <div class="col-8">
                <h6>
                    <button class="btn btn-success"><a href="${pageContext.request.contextPath}/"><spring:message code="view.index.agent.searchagain"/></a></button>
                </h6>
            </div>
        </div>
        <!-- x.x Agent data : Title -->
        <div class="row">
            <div class="col-8">
                <h6><spring:message code="view.index.agent.agentdata"/></h6>
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
            <div class="col-2"><spring:message code="view.index.agent.www"/>:
                <img src="${pageContext.request.contextPath}/resources/images/qmark.png" width="15" height="15" data-toggle="tooltip" title="Hooray!">
            </div>
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
                <h6><spring:message code="view.index.links.choose"/></h6>
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

</body>
</html>
