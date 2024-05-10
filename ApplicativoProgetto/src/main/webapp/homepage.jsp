<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.Evento"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
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
                    // Verifica se il testo dell'elemento cliccato è "i tuoi eventi"
                    if (element.textContent.trim() === "i tuoi eventi") {
                        // Esegui il redirect a eventicreati.jsp
                        window.location.href = 'eventicreati.jsp';
                    }else{
                        if (element.textContent.trim() === "nuovo evento") {
                            // Esegui il redirect a eventicreati.jsp
                            window.location.href = 'provacreaevento.jsp';
                        }
                    }
                });
            });
        };
    </script>


    <div>
        <div class="sidebar">
            <div class="navigation-contents">
                <div class="navigation-element">nuovo evento</div>
                <div class="navigation-element">i tuoi eventi</div>
                <div class="navigation-element">partecipazioni</div>
                <div class="navigation-element">Export</div>
            </div>
        </div>

        <div class="sidebar-right">
            <div class="navigation-contents">
                <div class="navigation-element">Overview</div>
                <div class="navigation-element">Reports</div>
                <div class="navigation-element">Analytics</div>
                <div class="navigation-element">Export</div>
            </div>
        </div>
    </div>
    <div class="homepage-flow">
        <a href="feedrefresh.jsp"></a>

        <%
            String id_host = "";
            if(session.getAttribute("user")==null){
                id_host = "3";
            }else{
                Utente user = (Utente) session.getAttribute("user");
                id_host = user.getId_utente();
            }

            ClassiDB db = new ClassiDB();
            ArrayList<EventoFeed> feed = db.GetEventFeed(id_host);
        %>
        <%for (EventoFeed eventoFeed : feed) { %>
        <div class="event-block">
            Nome: <%=eventoFeed.GetEvento().getNome()%><br>
            Luogo: <%=eventoFeed.GetEvento().getLuogo()%><br>
            Indirizzo: <%=eventoFeed.GetEvento().getIndirizzo()%><br>
            Città: <%=eventoFeed.GetEvento().getCitta()%><br>
            Data: <%=eventoFeed.GetEvento().getData()%><br>
            Ora: <%=eventoFeed.GetEvento().getOra()%><br>
            Informazioni sul luogo: <%=eventoFeed.GetEvento().getInformazioniLuogo()%><br>
            Descrizione: <%=eventoFeed.GetEvento().getDescrizione()%><br>
            Tipo: <%=eventoFeed.GetEvento().getTipo()%><br>
            ID Host: <%=eventoFeed.GetEvento().getIdHost()%><br>
            Nome Host: <%=eventoFeed.GetHost()%><br>
        </div>
        <div class="event-block">
            Nome: <%=eventoFeed.GetEvento().getNome()%><br> 
            Luogo: <%=eventoFeed.GetEvento().getLuogo()%><br>
            Indirizzo: <%=eventoFeed.GetEvento().getIndirizzo()%><br>
            Città: <%=eventoFeed.GetEvento().getCitta()%><br>
            Data: <%=eventoFeed.GetEvento().getData()%><br>
            Ora: <%=eventoFeed.GetEvento().getOra()%><br>
            Informazioni sul luogo: <%=eventoFeed.GetEvento().getInformazioniLuogo()%><br>
            Descrizione: <%=eventoFeed.GetEvento().getDescrizione()%><br>
            Tipo: <%=eventoFeed.GetEvento().getTipo()%><br>
            ID Host: <%=eventoFeed.GetEvento().getIdHost()%><br>
            Nome Host: <%=eventoFeed.GetHost()%><br>
        </div>
        <%}%>
    </div>
</body>
</html>
