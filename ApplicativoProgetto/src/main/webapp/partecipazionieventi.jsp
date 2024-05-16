<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>


<%
    ArrayList<EventoFeed> eventoList = null;
    try {
        eventoList = conn.getPartecipazioniList(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    if(eventoList.isEmpty()){
        response.sendRedirect("homepage.jsp?messaggio=Non hai ancora partecipato a nessun evento");
}else{%>


<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">

<div class="homepage-flow">
    <a href="feedrefresh.jsp"></a>
    <%for (EventoFeed eventoFeed : eventoList) { %>
    <div class="event-block" onclick="redirectToDettaglio('<%= eventoFeed.GetEvento().getId_evento() %>')">
        <div class="evf-event-details">
            <div class="evf-profilepic">
                <%
                    String imagePath = "imagetree/profilepic/" + conn.getUtenteFromUsername(eventoFeed.GetHost()).getId_utente() + ".png"; // Percorso dell'immagine desiderata
                    java.io.File imgFile = new java.io.File(application.getRealPath("/") + imagePath);

                    if (imgFile.exists()) {
                %>
                <img src="<%= imagePath %>" alt="i">
                <%
                } else {
                %>
                <img src="imagetree/profilepic/default.png" alt="i">
                <%
                    }
                %>
            </div>
            <div class="evf-event-identity">
                <div class="evf-host"><%=eventoFeed.GetHost()%></div>
                <div class="evf-name"><%=eventoFeed.GetEvento().getNome()%></div>
            </div>
            <div class="evf-description"><%=eventoFeed.GetEvento().getDescrizione()%></div>
        </div>
        <div class="evf-photobox">img</div>
    </div>
    <%}%>
</div>
</body>
</html>
<%}%>