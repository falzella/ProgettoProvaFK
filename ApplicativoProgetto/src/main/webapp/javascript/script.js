
/* Dettagli Evento */
function PartecitaDisiscriviEvento(id) {

}

function Modifica(id) {

}

/* Redirects */
function RedirectTo(path) {
    window.location.href = path;
}

function redirectToDettaglio(eventoId) {
    window.location.href = 'dettaglievento.jsp?IdEvento=' + eventoId;
}

function RedirectToDettagliUtente(username){
    window.location.href = 'dettagliutente.jsp?UserFriend=' + username;
}

function inviaRichiesta(id_host, id_friend) {
    // Esegui qui la logica per inviare la richiesta di amicizia tramite AJAX
    $.ajax({
        url: 'ClassiDB', // Endpoint sul server che gestisce la richiesta di amicizia
        method: 'POST',
        data: {
            id_host: id_host,
            id_friend: id_friend
        },
        success: function(response) {
            alert("Richiesta di amicizia inviata!");
        },
        error: function() {
            alert("Errore durante la richiesta!");
        }
    });
}
