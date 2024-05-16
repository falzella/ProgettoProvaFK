<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@page import="javaDB.Utente"%>


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
    } else if (conn.emailEsistente(mail)) {
        response.sendRedirect("signup.jsp?messaggio=Email gia' in uso");
    } else if (conn.usernameEsistente(username)) {
        response.sendRedirect("signup.jsp?messaggio=Username gia' in uso");
    } else {
        Utente user = new Utente(username, password, mail, nome, cognome, data);
        session.setAttribute("user", user);
        if (user != null) {
            if (conn.inserisciUtenza(user)) {
                response.sendRedirect("homepage.jsp");
            } else {
                response.sendRedirect("signup.jsp?messaggio=errore in inserimento");
            }
        }
    }
%>