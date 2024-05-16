<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>

<%
    try{
        String idevento = request.getParameter("idEvento");
        String idinvitato = request.getParameter("idInvitato");
        if(conn.mandaInvito(idinvitato, idevento)) {
            response.sendRedirect("listaamiciinvitare.jsp?invita=" + true + "&IdEvento=" + idevento + "&IdEvento=" + idevento);
        } else {
            response.sendRedirect("listaamiciinvitare.jsp?invita=" + false+ "&IdEvento=" + idevento + "&IdEvento=" + idevento);
        }
    } catch(Exception e) {

    }

%>
