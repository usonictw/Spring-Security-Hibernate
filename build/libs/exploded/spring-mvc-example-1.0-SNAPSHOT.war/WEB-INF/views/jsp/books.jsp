<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
        <table class="features-table">
            <caption align="center">Book List</caption>
            <tr>
                <th class="grey">id</th>
                <th class="grey">Books Title</th>
                <th class="grey">Books Author</th>
                <th class="grey">Books price</th>
                <th class="grey">Edit</th>
                <th class="grey">Delete</th>
            </tr>
            <c:forEach items="${bookList}" var="book">
                <tr>
                    <td class="grey">${book.id}</td>
                    <td class="grey"><a href="/bookData/${book.id}" target="_blank">${book.bookTitle}</a></td>
                    <td class="grey">${book.bookAuthor}</td>
                    <td class="grey">${book.bookPrice}</td>
                    <td class="grey"><a href="<c:url value="/edit/${book.id}"/>">Edit</a></td>
                    <td class="grey"><a href="<c:url value="/remove/${book.id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<c:url var="addAction" value="/addBook"/>

<div class="container">
    <h1>Add a Book</h1>

    <form:form action="${addAction}" commandName="book">
        <table class="features-table">
            <tr>
                <td class="grey">
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td class="grey">
                    <form:input path="id" readonly="true"/>
                </td>
            </tr>

            <tr>
                <td class="grey">
                    <form:label path="bookTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td class="grey">
                    <form:input path="bookTitle"/>
                </td>
            </tr>
            <tr>
                <td class="grey">
                    <form:label path="bookAuthor">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td class="grey">
                    <form:input path="bookAuthor"/>
                </td>
            </tr>

            <tr>
                <td class="grey">
                    <form:label path="bookPrice">
                        <spring:message text="Price"/>
                    </form:label>
                </td>
                <td class="grey">
                    <form:input path="bookPrice"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="grey">
                    <c:if test="${!empty book.bookTitle}">
                        <input type="submit" value="<spring:message text="Edit Book"/>"/>
                    </c:if>

                    <c:if test="${empty book.bookTitle}">
                        <input type="submit" value="<spring:message text="Add Book"/>"/>
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
