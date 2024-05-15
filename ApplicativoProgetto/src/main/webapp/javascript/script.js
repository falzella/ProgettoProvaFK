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

    var mode = getCookie("mode");
    var lightmodeCSS = document.getElementById("lightmodeCSS");
    var darkmodeCSS = document.getElementById("darkmodeCSS");

    if (mode === "dark") {
        lightmodeCSS.disabled = true;
        darkmodeCSS.disabled = false;
    } else {
        lightmodeCSS.disabled = false;
        darkmodeCSS.disabled = true;
    }
};

/* setting della mode */

function switchMode() {
    var lightmodeCSS = document.getElementById("lightmodeCSS");
    var darkmodeCSS = document.getElementById("darkmodeCSS");

    if (lightmodeCSS.disabled) {
        lightmodeCSS.disabled = false;
        darkmodeCSS.disabled = true;
    } else {
        lightmodeCSS.disabled = true;
        darkmodeCSS.disabled = false;
    }
    document.cookie = "mode=" + (lightmodeCSS.disabled ? "light" : "dark");
}

function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}