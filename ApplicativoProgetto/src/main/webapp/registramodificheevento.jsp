<%@page import="javaDB.Evento"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@include file="getidevento.jsp"%>
<%
    String nome = request.getParameter("nome");
    String luogo = request.getParameter("luogo");
    String indirizzo = request.getParameter("indirizzo");
    String citta = request.getParameter("citta");
    String data = request.getParameter("data");
    String ora = request.getParameter("ora");
    String informazioniLuogo = request.getParameter("informazioni_luogo");
    String descrizione = request.getParameter("descrizione");
    String tipo = request.getParameter("tipo");

    if (nome == null || luogo == null || indirizzo == null || citta == null || data == null || ora == null || informazioniLuogo == null || descrizione == null || tipo == null) {
        response.sendRedirect("modificaevento.jsp?IdEvento=" + id_evento + "&messaggio=Compila prima tutti i campi");
    } else {
        Evento evento = new Evento(id_evento, nome, luogo, indirizzo, citta, data, ora, informazioniLuogo, descrizione, tipo, id_host);
        if (conn.modificaEvento(evento, id_evento)) {
            response.sendRedirect("modificaevento.jsp?IdEvento=" + id_evento + "&messaggio=Modifiche effettuate con successo!");
        } else {
            response.sendRedirect("modificaevento.jsp?IdEvento=" + id_evento + "&messaggio=Errore durante la modifica dell'evento");
        }
    }
%>
