<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>

<%
    try{
        String id_friend = request.getParameter("id_friend");
        if(conn.mandarichiesta(id_host, id_friend)) {
            response.sendRedirect("dettagliutente.jsp?friendReq=" + true + "&UserFriend=" + conn.GetUtenteFromId(Integer.parseInt(id_friend)).getUsername());
        } else {
            response.sendRedirect("dettagliutente.jsp?friendReq=" + false + "&UserFriend=" + conn.GetUtenteFromId(Integer.parseInt(id_friend)).getUsername());
        }
    } catch(Exception e) {

    }

%>