<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" href="./assets/css/SHARED.css">
    <link rel="stylesheet" href="./assets/css/dash.css">
</head>
<body>
<div class="form">
    <h2>Dashboard</h2>
    <h3>Hello <%=session.getAttribute("userName")%>!</h3>
    <a class="forgot" href="logout">Logout</a>
</div><!--end log form -->
<%--<%@include file="footer.jsp" %>--%>
</body>
</html>