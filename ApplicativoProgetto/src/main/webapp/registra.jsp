<%--
    Document   : registrazione
    Created on : Oct 13, 2023, 11:21:50 AM
    Author     : falz
--%>

<%@page import="javaDB.Utente"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="java.io.*"%>
<%@include file="connessione.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<a href="signup.jsp"></a>

<head>
    <title>JSP Page</title>
</head>

<body>
<h1>Registrazione!</h1>

<%
    String username = request.getParameter("username");
    String mail = request.getParameter("email");
    String cognome = request.getParameter("cognome");
    String nome = request.getParameter("nome");
    String password = request.getParameter("password");
    String password2 = request.getParameter("password2");
    String data = request.getParameter("data");

    if (!password.equals(password2)) {
        response.sendRedirect("signup.jsp?messaggio=Le password non coincidono");
    } else {
        Utente user = new Utente(username, password, mail, nome, cognome, data);
        session.setAttribute("user", user);
        if (user != null) {
            if (conn.inserisciUtenza(user)) {
                out.write("Registrato con successo!");%>
<a href="riservato.jsp">Accedi alla tua area Personale</a>
<br>
<%
            } else {
                response.sendRedirect("signup.jsp?messaggio=errore in inserimento");
            }
        }
    }
%>



</body>

</html>