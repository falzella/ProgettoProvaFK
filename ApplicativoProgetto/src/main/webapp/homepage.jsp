<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            // Esegui il redirect a provacreaevento.jsp
                            window.location.href = 'provacreaevento.jsp';
                        }else{
                            if(element.textContent.trim() === "partecipazioni"){
                                // Esegui il redirect a partecipazionieventi.jsp
                                window.location.href = 'partecipazionieventi.jsp';
                            }

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
