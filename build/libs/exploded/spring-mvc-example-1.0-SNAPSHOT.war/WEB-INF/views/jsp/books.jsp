<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:url var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="name" value="Admin"/>

<html lang="en">

<title>List Books</title>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="vieport" content="width=device-width, initial-scale=1">
    <meta name="discription" content="">
    <meta name="author" content="">
    <title>Book List</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">

</head>

<body>
<h1 align="center">List Book</h1>
<a href="/">Back to main menu</a>
<div class="container" style="width: 300px">
    <c:if test="${!empty bookList}">
        <table>
            <caption align="center">Book List</caption>
            <tr>
                <th>id</th>
                <th>Books Title</th>
                <th>Books Author</th>
                <th>Books price</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${bookList}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td><a href="/bookData/${book.id}" target="_blank">${book.bookTitle}</a></td>
                    <td>${book.bookAuthor}</td>
                    <td>${book.bookPrice}</td>
                    <c:if test="${pageContext.request.userPrincipal.name == name}">
                    <td><a href="<c:url value="/edit/${book.id}"/>">Edit</a></td>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == name}">
                    <td><a href="<c:url value="/remove/${book.id}"/>">Delete</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:url var="addAction" value="/addBook"/>

    <h1>Add a Book</h1>

    <form:form action="${addAction}" commandName="book">
        <table>
            <tr>
                <td style="border-radius: 10px 0 0 0;" class="radius">
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td style="border-radius: 0 10px 0 0;" class="radius">
                    <form:input path="id" readonly="true"/>
                </td>
            </tr>

            <tr>
                <td>
                    <form:label path="bookTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookTitle"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookAuthor">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookAuthor"/>
                </td>
            </tr>

            <tr>
                <td>
                    <form:label path="bookPrice">
                        <spring:message text="Price"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookPrice"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-radius: 0 0 10px 10px;" class="radius">
                    <c:if test="${!empty book.bookTitle}">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">"Edit Book"</button>
                    </c:if>

                    <c:if test="${empty book.bookTitle}">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">"Add Book"</button>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>