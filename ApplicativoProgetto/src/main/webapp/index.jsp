<html>
<body>
<h2>You will now be redirected to the login page!</h2>
<%
    String redirectURL = "http://localhost:8080/ApplicativoProgetto/login.jsp";
    response.sendRedirect(redirectURL);
    out.write("cs");
%>
</body>
</html>