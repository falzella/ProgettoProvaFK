<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="java.util.ArrayList"%>

<%
    String message = request.getParameter("messaggio");
    if(!(message == null || message.isEmpty())){
        out.println("<script>alert('"+message+"');</script>");
    }
%>


<%
    ArrayList<EventoFeed> feed = conn.GetEventFeed(id_host);
%>

<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">
    <div class="homepage-flow">
        <%for (EventoFeed eventoFeed : feed) { %>
            <div class="event-block visible" onclick="redirectToDettaglio('<%= eventoFeed.GetEvento().getId_evento() %>')">
                <div class="evf-event-details">
                    <div class="evf-profilepic-space">
                        <div class="evf-profilepic" onclick=RedirectToDettagliUtente('<%=eventoFeed.GetHost()%>')>
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
                    </div>

                    <div class="evf-event-identity">
                        <div class="evf-host">
                            <img src="images/icons/crown.png" height="20px" width="20px">
                            <%=eventoFeed.GetHost()%>
                        </div>
                        <div class="evf-name">
                            <% if(eventoFeed.GetEvento().getTipo().equals("privato")){%>
                            <img src="images/icons/event-private.png" height="20px" width="20px">
                            <%}else{%>
                            <img src="images/icons/event.png" height="20px" width="20px">
                            <%}%>
                            <%=eventoFeed.GetEvento().getNome()%>
                        </div>
                    </div>
                    <div class="evf-event-location">
                        <div class="evf-location-detail">
                            <img src="images/icons/calendar.png" height="15px" width="15px">
                            <%=eventoFeed.GetEvento().getData()%>
                        </div>
                        <div class="evf-location-detail">
                            <img src="images/icons/clock.png" height="15px" width="15px">
                            <%=eventoFeed.GetEvento().getOra()%>
                        </div>
                        <div class="evf-location-detail-pin">
                            <img src="images/icons/location-pin.png" height="15px" width="15px">
                            <%=eventoFeed.GetEvento().getLuogo()%>
                        </div>
                    </div>
                    <div class="evf-description"><%=eventoFeed.GetEvento().getDescrizione()%></div>
                </div>
                <div class="evf-photobox">img</div>
            </div>
        <%}%>
    </div>
</body>
</html>