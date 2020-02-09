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
    <style>
        #modules {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #modules td, #modules th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #modules tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #modules tr:hover {
            background-color: #ddd;
        }

        #modules th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Modules application</a>
        </div>
    </div>
</nav>

<div class="container">

    <div class="starter-template">
        <h2>Hierarchical structure called Module using Spring Boot and JPA</h2>

        <a href="/new">Add new first level module</a>

        <table id="modules">
            <thead>
            <tr>
                <th>Module ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Parent ID</th>
            </tr>
            </thead>
            <c:forEach items="${modules}" var="module">
                <tr>
                    <td><c:out value="${module.id}"/></td>
                    <td><c:out value="${module.name}"/></td>
                    <td><c:out value="${module.type}"/></td>
                    <td><c:out value="${module.parentId}"/></td>
                    <td>
                        <a href="/edit/${module.id}">Change name</a> ||
                        <a href="/add/parentId=${module.id}">Add new child module</a>
                    </td>
                </tr>
                <c:forEach items="${module.subModules}" var="child">
                    <tr >
                        <td><c:out value="${child.id}"/></td>
                        <td><c:out value="${child.name}"/></td>
                        <td><c:out value="${child.type}"/></td>
                        <td><c:out value="${child.parentId}"/></td>
                        <td>
                            <a href="/edit/${child.id}">Change name</a> ||
                            <a href="/add/parentId=${child.id}">Add new child module</a>
                        </td>
                    </tr>
                    <c:forEach items="${child.subModules}" var="secondChild">
                        <tr >
                            <td><c:out value="${secondChild.id}"/></td>
                            <td><c:out value="${secondChild.name}"/></td>
                            <td><c:out value="${secondChild.type}"/></td>
                            <td><c:out value="${secondChild.parentId}"/></td>
                            <td>
                                <a href="/edit/${secondChild.id}">Change name</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </c:forEach>
        </table>

    </div>

</div>
<!-- /.container -->

<script type="text/javascript"
        src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
