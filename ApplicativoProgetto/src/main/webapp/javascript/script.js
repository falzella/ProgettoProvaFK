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

function redirectToListaPartecipazione(eventoId) {
    window.location.href = 'listapartecipanti.jsp?IdEvento=' + eventoId;
}

function RedirectToDettagliUtente(username){
    window.location.href = 'dettagliutente.jsp?UserFriend=' + username;
}

function inviaRichiesta(id_friend) {
    window.location.href = 'inviarichiesta.jsp?id_friend=' + id_friend;
}

function eseguiRichiesta(id_friend, esito) {
    window.location.href = 'eseguirichiesta.jsp?id_friend=' + id_friend + '&esito=' + esito;
}

function inviaPartecipazione(id_evento) {
    window.location.href = 'inviapartecipazione.jsp?idEvento=' + id_evento;
}

window.onload = function() {
    var eventBlocks = document.querySelectorAll('.event-block');
    eventBlocks.forEach(function(block) {
        block.classList.add('slide-in-from-top');
    });
};
