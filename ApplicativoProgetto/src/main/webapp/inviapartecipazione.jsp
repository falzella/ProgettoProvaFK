<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>

<%
    try{
        String idevento = request.getParameter("idEvento");
        if(conn.partecipaEventoPubblico(id_host, idevento)) {
            response.sendRedirect("dettaglievento.jsp?partecipazione=" + true + "&IdEvento=" + idevento);
        } else {
            response.sendRedirect("dettaglievento.jsp?partecipazione=" + false+ "&IdEvento=" + idevento);
        }
    } catch(Exception e) {

    }
%>