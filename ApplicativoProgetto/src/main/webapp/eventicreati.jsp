<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@page import="javaDB.Evento"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>


<%
    ArrayList<Evento> eventoList = null;
    try {
        eventoList = conn.getEventList(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    if(eventoList.isEmpty()){
    response.sendRedirect("homepage.jsp?messaggio=Non hai creato nessun evento");
    } else{%>


<html>
<head>
    <title>eventicreati</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">

<div class="homepage-flow">
    <%for (Evento evento : eventoList) { %>
    <div class="event-block" onclick="redirectToDettaglio('<%= evento.getId_evento() %>')">
        <div class="evf-event-details">
            <div class="ue-event-identity-ex">
                <div class="evf-name">
                    <% if(evento.getTipo().equals("privato")){%>
                    <img src="images/icons/event-private.png" height="20px" width="20px">
                    <%}else{%>
                    <img src="images/icons/event.png" height="20px" width="20px">
                    <%}%>
                    <%=evento.getNome()%>
                </div>
                <div class="evf-host">
                    <% if(evento.getTipo().equals("privato")){%>
                    <img src="images/icons/private.png" height="20px" width="20px">
                    privato
                    <%}else{%>
                    <img src="images/icons/public.png" height="20px" width="20px">
                    pubblico
                    <%}%>
                </div>
            </div>
            <div class="ue-event-location">
                <div class="evf-location-detail">
                    <img src="images/icons/calendar.png" height="15px" width="15px">
                    <%=evento.getData()%>
                </div>
                <div class="evf-location-detail">
                    <img src="images/icons/clock.png" height="15px" width="15px">
                    <%=evento.getOra()%>
                </div>
                <div class="ue-location-detail-pin">
                    <img src="images/icons/location-pin.png" height="15px" width="15px">
                    <%=evento.getLuogo()%>
                </div>
            </div>
            <div class="evf-description"><%=evento.getDescrizione()%></div>
        </div>
        <div class="evf-photobox">
            <%
            String eventFolderPath ="imagetree/eventspic/" + evento.getId_evento();
            java.io.File eventFolder = new java.io.File(application.getRealPath("/") + eventFolderPath);

            if (!eventFolder.exists()) {
        %>
            <img src="imagetree/eventspic/default.png" alt="i">
            <%} else {
            String EventimagePath = eventFolderPath + "/1.png"; // Percorso dell'immagine desiderata
            java.io.File EventimgFile = new java.io.File(application.getRealPath("/") + EventimagePath);

            if (EventimgFile.exists()) {
            %>

            <img src="<%= EventimagePath %>">

            <%
            } else {
                // Se il file specifico non esiste, mostra un'immagine predefinita
            %>
            <img src="imagetree/eventspic/default.png" alt="i">
            <%
                    }
                }
            %>


        </div>
    </div>
    <%}%>
</div>
</body>
</html>
<%}%>