<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>


<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        id_host = "2";
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }

    ClassiDB db = new ClassiDB();
    ArrayList<EventoFeed> eventoList = null;
    try {
        eventoList = db.getPartecipazioniList(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    if(eventoList.isEmpty()){%>
Non hai creato nessun evento!
<%}else{%>


<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">
<header>
    <div class="hcenter-div">
        <div class="vcenter-div">
            <img src="images/quello_bello_cropped.svg" height="65px" class="img-round">
        </div>

        <div class="search-box">
            <input type="text" placeholder="search in KAMI!">
            <div class="search-icon">
                <i class="fas fa-search"></i>
            </div>
            <div class="cancel-icon">
                <i class="fas fa-times"></i>
            </div>
        </div>
    </div>
</header>

<div>
    <div class="sidebar">
        <div class="navigation-contents">
            <div class="navigation-element" onclick="RedirectTo('homepage.jsp')">homepage</div>
            <div class="navigation-element" onclick="RedirectTo('provacreaevento.jsp')">nuovo evento</div>
            <div class="navigation-element" onclick="RedirectTo('eventicreati.jsp')">i tuoi eventi</div>
            <div class="navigation-element" onclick="RedirectTo('partecipazionieventi.jsp')">partecipazioni</div>
            <div class="navigation-element" onclick="RedirectTo('richieste.jsp')">richieste amicizia</div>
        </div>
    </div>

    <div class="sidebar-right">
        <div class="navigation-contents">
            <div class="navigation-header">i tuoi amici</div>
            <%ArrayList<Utente> feedUser = null;
                try {
                    feedUser = db.GetFriendFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedUser) { %>
            <div class="navigation-element"><%=utente.getUsername()%></div>
            <%}%>
            <div class="navigation-header">consigliati</div>
            <%ArrayList<Utente> feedSuggest = null;
                try {
                    feedSuggest = db.GetSuggestFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedSuggest) { %>
            <div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
            <%}%>
        </div>
    </div>
</div>
<div class="homepage-flow">
    <a href="feedrefresh.jsp"></a>
    <%for (EventoFeed eventoFeed : eventoList) { %>
    <div class="event-block" onclick="redirectToDettaglio('<%= eventoFeed.GetEvento().getId_evento() %>')">
        <div class="evf-event-details">
            <div class="evf-profilepic">
                <%
                    String imagePath = "imagetree/profilepic/" + eventoFeed.GetEvento().getIdHost() + ".png"; // Percorso dell'immagine desiderata
                    java.io.File imgFile = new java.io.File(application.getRealPath("/") + imagePath);

                    if (imgFile.exists()) {
                %>
                <img src="<%= imagePath %>" alt="i" width="60" height="60">
                <%
                } else {
                %>
                <img src="profilepic/default.png" alt="i" width="60" height="60">
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