<!DOCTYPE html SYSTEM "http://www.thymeleaf.org/dtd/xhtml1-strict-thymeleaf-spring4-4.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>

    <link rel="stylesheet" type="text/css"
          href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!--
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
    <link href="${jstlCss}" rel="stylesheet"/>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/home">Modules application</a>
        </div>
    </div>
</nav>

<div align="center">
    <h1>Create New Module</h1>
    <br />
    <form action="#" th:object="${module}"
          method="post">

        <table border="0" cellpadding="10">
            <tr><input name="id" value='${module.id}' readonly="readonly" hidden></tr>
            <tr>
                <td>Module Name:</td>
                <td><input name="name" ></td>
            </tr>
            <tr>
                <td>Type:</td>
                <td>
                    <input name="type" value='${module.type}' readonly="readonly" class="required">
                </td>
            </tr>
            <c:choose>
                <c:when test="${module.parentId != null}">
                    <tr>
                        <td>Parent ID:</td>
                        <td>
                            <input name="parentId" value='${module.parentId}' readonly="readonly" class="required">
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <input name="parentId" value='${module.parentId}' readonly="readonly" hidden>
                </c:otherwise>
            </c:choose>
            <tr>
                <td colspan="2"><button type="submit">Save</button> </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript"
        src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>