<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">

</head>
<body class="homepage-body">

<%
    // Recupera il parametro messaggio dalla richiesta
    String messaggio = request.getParameter("messaggio");
    if (messaggio != null && !messaggio.isEmpty()) {
%>

<script>
    // Funzione per mostrare la notifica
    function mostraNotifica() {
        // Crea un nuovo oggetto di notifica
        var notification = new Notification("Notifica", {
            body: "<%= messaggio %>",
            icon: "icon.png" // Opzionale: inserisci un'icona per la notifica
        });

        // Chiudi la notifica dopo 5 secondi
        setTimeout(notification.close.bind(notification), 5000);
    }

    // Controlla se il browser supporta le notifiche
    if (Notification.permission !== "granted") {
        Notification.requestPermission();
    } else {
        mostraNotifica(); // Mostra la notifica se le autorizzazioni sono già state concesse
    }
</script>
<%
    }
%>



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
        <div class="event-block">
            NEW EVENT
        </div>
        <div class="event-block">
            NEW EVENT
        </div>
        <div class="event-block">
            NEW EVENT
        </div>
    </div>
</body>
</html>
