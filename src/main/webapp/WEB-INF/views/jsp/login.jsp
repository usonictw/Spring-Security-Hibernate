<%--@elvariable id="_csrf" type="org.springframework.web.bind.MissingServletRequestParameterException"--%>
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
    <title>Log in</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<body>
<div class="container" style="width: 300px">

    <form name="loginForm"  method="post" modelAttribute="userForm" class="form-signin">
        <h2 class="form-heading"> Log in</h2>

        <div class="form-group ${error ? 'has-error' : ''}">
            <span>${massage}</span>
            <input name="userName" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
        </div>
        <div>
            <span>${massage}</span>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
        </div>
        <div></div>
        <div>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
        </div>
        <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
</form>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>