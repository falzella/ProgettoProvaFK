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


<script>
    window.onload = function() {
        // Ottieni tutti gli elementi di navigazione
        var navigationElements = document.querySelectorAll('.navigation-element');

        // Aggiungi un evento di click a ciascun elemento di navigazione
        navigationElements.forEach(function(element) {
            element.addEventListener('click', function() {
                if(element.textContent.trim() === "homepage"){
                    // Esegui il redirect a homepage.jsp
                    window.location.href = 'homepage.jsp';
                }else {
                    // Verifica se il testo dell'elemento cliccato è "i tuoi eventi"
                    if (element.textContent.trim() === "i tuoi eventi") {
                        // Esegui il redirect a eventicreati.jsp
                        window.location.href = 'eventicreati.jsp';
                    } else {
                        if (element.textContent.trim() === "nuovo evento") {
                            // Esegui il redirect a provacreaevento.jsp
                            window.location.href = 'provacreaevento.jsp';
                        } else {
                            if (element.textContent.trim() === "Export") {
                                // Esegui il redirect a export.jsp
                                window.location.href = 'homepage.jsp';
                            } else {
                                // Mostro dettagli utente
                                window.location.href = 'dettagliutente.jsp?UserFriend=' + element.textContent.trim();
                            }
                        }
                    }
                }
            });
        });
    };
</script>

<script>
    function redirectToDettaglio(eventoId) {
        window.location.href = 'dettaglievento.jsp?IdEvento=' + eventoId;
    }
</script>

<div>
    <div class="sidebar">
        <div class="navigation-contents">
            <div class="navigation-element">homepage</div>
            <div class="navigation-element">nuovo evento</div>
            <div class="navigation-element">i tuoi eventi</div>
            <div class="navigation-element">Export</div>
        </div>
    </div>

    <div class="sidebar-right">
        <div class="navigation-contents">
            <%ArrayList<Utente> feedUser = null;
                try {
                    feedUser = db.GetFriendFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedUser) { %>
            <div class="navigation-element"><%=utente.getUsername()%></div>
            <%}%>
        </div>
    </div>
</div>
<div class="homepage-flow">
    <a href="feedrefresh.jsp"></a>
    <%for (EventoFeed eventoFeed : eventoList) { %>
    <div class="event-block" onclick="redirectToDettaglio('<%= eventoFeed.GetEvento().getId_evento() %>')">
        <div class="evf-event-details">
            <div class="evf-profilepic">pic</div>
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