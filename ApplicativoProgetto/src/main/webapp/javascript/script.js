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

function eseguiInvito(id_evento, esito) {
    window.location.href = 'eseguiinvito.jsp?id_evento=' + id_evento + '&esito=' + esito;
}

function inviaPartecipazione(id_evento) {
    window.location.href = 'inviapartecipazione.jsp?idEvento=' + id_evento;
}

window.onload = function() {
    var eventBlocks = document.querySelectorAll('.event-block');
    eventBlocks.forEach(function(block) {
        block.classList.add('slide-in-from-top');
    });

    var usrblocks = document.querySelectorAll('.ul-user-block');
    usrblocks.forEach(function(block) {
        block.classList.add('slide-in-from-top');
    });
};

/* setting della mode */

function switchMode() {
    var lightmodeCSS = document.getElementById("lightmodeCSS");
    var darkmodeCSS = document.getElementById("darkmodeCSS");

    if (lightmodeCSS.disabled) {
        lightmodeCSS.disabled = false;
        darkmodeCSS.disabled = true;
        document.cookie = "mode=light; expires=Fri, 31 Dec 9999 23:59:59 GMT";
    } else {
        lightmodeCSS.disabled = true;
        darkmodeCSS.disabled = false;
        document.cookie = "mode=dark; expires=Fri, 31 Dec 9999 23:59:59 GMT";
    }
}

// Check for mode cookie when the page loads
window.onload = function() {
    var modeCookie = getCookie("mode");
    if (modeCookie === "dark") {
        switchMode(); // Apply dark mode if the cookie is set to "dark"
    }
};

function getCookie(name) {
    var cookieArr = document.cookie.split("; ");
    for (var i = 0; i < cookieArr.length; i++) {
        var cookiePair = cookieArr[i].split("=");
        if (name === cookiePair[0]) {
            return decodeURIComponent(cookiePair[1]);
        }
    }
    return null;
}