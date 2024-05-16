<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="javaDB.Utente"%>


<%
    String username = request.getParameter("username");
    String mail = request.getParameter("email");
    String cognome = request.getParameter("cognome");
    String nome = request.getParameter("nome");
    String password = request.getParameter("password");
    String data = request.getParameter("data");

    if (conn.emailEsistenteModifica(mail, id_host)) {
        response.sendRedirect("modificautente.jsp?UserFriend=" + username + "&messaggio=Email gia' in uso");
    } else {
        Utente user = new Utente(id_host, username, password, mail, nome, cognome, data);
        session.setAttribute("user", user);
        if (user != null) {
            if (conn.modificaUtenza(user)) {
                response.sendRedirect("modificautente.jsp?UserFriend=" + username + "&modifiche effettuate");
            } else {
                response.sendRedirect("modificautente.jsp?UserFriend=" + username + "&messaggio=errore in inserimento");
            }
        }
    }
%>