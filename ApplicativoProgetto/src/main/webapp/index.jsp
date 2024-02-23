<html>
<header>
    <title>KAMI</title>
    <link href="style/stylesheet.css" rel="stylesheet" type="text/css">
</header>
<body>
<%
    String redirectURL = "http://localhost:8080/ApplicativoProgetto/login.jsp";
    //response.sendRedirect(redirectURL);
    response.setHeader("Refresh", "4;url="+ redirectURL);
%>
<video autoplay="" loop="" muted>
    <source src="images/KAMI-loading.mp4" type="video/mp4" />
</video>
</body>
</html>