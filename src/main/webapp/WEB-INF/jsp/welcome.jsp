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
    <c:url value="/css/main.css" var="jstlCss"/>
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
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
        }
        .button1 {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }

        .button1:hover {
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
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">All modules</a></li>
                <li><a href="#editModule">Table view</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

    <div class="starter-template">
        <h2>${message}</h2>

        <a href="/new">Add new first level module</a>

        <table id="modules">
            <thead>
            <tr>
                <th>Module ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>ParentId</th>
            </tr>
            </thead>
            <c:forEach items="${modules}" var="module">
                <tr>
                    <td><c:out value="${module.id}"/></td>
                    <td><c:out value="${module.name}"/></td>
                    <td><c:out value="${module.type}"/></td>
                    <td><c:out value="${module.parentId}"/></td>
                    <td>
                        <a href="/edit/${module.id}">Edit</a>
                        <a href="/add/parentId=<c:out value="${module.id}"/>">Add new child module</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>

</div>
<!-- /.container -->

<script type="text/javascript"
        src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
