<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" href="./assets/css/SHARED.css">
    <link rel="stylesheet" href="./assets/css/login.css">
    <title>Secure Sips</title>
</head>

<%-- Alert Code (has to be on every page)--%>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<input type="hidden" id="message" value="<%= request.getAttribute("message")%>">

<%-- Body--%>
<body>
<h1>Login</h1>
<form action="login" method="post">
    <label class="email" for="email">Email</label>
    <input type="email" id="email" name="email" required>

    <label class="password" for="password">Password</label>
    <input type="password" id="password" name="password" required>

    <button id="login" type="submit">Login</button>
</form>
<label class="register">Need an account?<a href="register"> Sign up!</a></label>
<button><a href="index">Go To Home</a></button>
<%@include file="footer.jsp" %>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="./assets/js/alert.js"></script>
<script type="text/javascript" src="./assets/js/login.js"></script>
</html>