<%--@elvariable id="error" type="java"--%>
<%--@elvariable id="contextPath" type="java"--%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="vieport" content="width=device-width, initial-scale=1">
    <meta name="discription" content="">
    <meta name="author" content="">
    <title>Create a acount</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<body>

<div class="container">

    <%--

    <form method="post" modelAttribute="userForm" class="form-signin">
        <h2 class="form-heading"> Create your account</h2>

        <div class="form-group ${error ? 'has-error' : ''}">
            <input name="userName" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
        </div>

        <div class="form-group ${error ? 'has-error' : ''}">
            <input name="password" type="password" class="form-control" placeholder="Password"/>
        </div>

        <div class="form-group" ${error ? 'has-error' : ''}>
            <input name="passwordConfirm" type="password" class="form-control" placeholder="Password"/>
        </div>

        <div class="form-group" ${error ? 'has-error' : ''}>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        </div>
    </form>
    --%>


    <form:form method="post" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading"> Create your account</h2>
        <spring:bind path="userName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="userName" class="form-control" placeholder="Username"
                            autofocus="true"/>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                <form:errors path="password"/>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="confirmPassword" class="form-control"
                            placeholder="Confirm your password"/>
                <form:errors path="confirmPassword"/>
            </div>
        </spring:bind>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>


</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>