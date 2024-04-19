<%--
    Document   : accesso
    Created on : Oct 6, 2023, 11:13:10 AM
    Author     : falz
    Scopo      : Pagina che verifica accesso di un utente con utlizzo db
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.io.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@include file="./connessione.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>JSP Page</title>
</head>
<body>
<h1>Convalida Utente</h1>
<%

    Utente user = (Utente)session.getAttribute("Utente");
    if(user==null){

        String username = request.getParameter("username");
        String psw = request.getParameter("password");
        String nome = "";
        String cognome = "";

        if (username != null && psw != null && !username.isEmpty() && !psw.isEmpty()) {
            Utente p =  conn.checkUtenza(username, psw);
            if ( p != null) {
                session.setAttribute("user", p);
                response.sendRedirect("homepage.jsp");
            } else {
                response.sendRedirect("login.jsp?messaggio=Credenziali errate");
            }
        }else {
            //Controllo credenziali vuote
            response.sendRedirect("login.jsp?messaggio=Non hai inserito credenziali");
        }
    }else{
        response.sendRedirect("login.jsp?messaggio=Accesso non autorizzato");
    }

%>

</body>
</html>
