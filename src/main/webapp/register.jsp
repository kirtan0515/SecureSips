<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" href="./assets/css/SHARED.css">
    <link rel="stylesheet" href="./assets/css/register.css">
    <title>Secure Sips</title>
</head>
<body>
<div class="form">
    <h2>Create an account</h2>
    <form action="register" method="post">
        <input type="text" id="fullname" name="fullname" placeholder="Full Name" required/>
        <input type="email" title="email" name="email" placeholder="Email Address" required/>
        <input type="password" title="username" placeholder="Password" name="password"/>
        <button type="submit" class="btn">Register</button>
        <a class="forgot" href="login">Have an account?</a>
    </form>
</div><!--end log form -->
<%--<%@include file="footer.jsp" %>--%>
</body>
</html>