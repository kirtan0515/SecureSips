<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" href="./assets/css/SHARED.css">
    <link rel="stylesheet" href="./assets/css/login.css">
    <title>Secure Sips - Login</title>
</head>

<%-- Alert Code (has to be on every page)--%>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<input type="hidden" id="message" value="<%= request.getAttribute("message")%>">

<%-- Body--%>
<body>
<div class="form">
    <h2>Login to your account</h2>
    <form action="login" method="post">
        <input type="email" title="email" name="email" placeholder="name@email.com" required/>
        <input type="password" title="username" placeholder="password" name="password"/>
        <button type="submit" class="btn">Login</button>
        <a class="forgot" href="register">Don't have an account?</a>
    </form>
</div><!--end log form -->

<%--<%@include file="footer.jsp" %>--%>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="./assets/js/alert.js"></script>
<script type="text/javascript" src="./assets/js/login.js"></script>
</html>