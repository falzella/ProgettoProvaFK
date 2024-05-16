<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.Evento"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>


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
    String media = request.getParameter("media");
    //String tipo = "privato";

    /*
    if (request.getParameter("media") != null) {
        out.write("media: " + request.getParameter("media") + request.getAttribute("media"));
    }
    */

    // Validazione dei campi
    if (nome == null || luogo == null || indirizzo == null || citta == null || data == null || ora == null || informazioniLuogo == null || descrizione == null || tipo == null) {
        response.sendRedirect("provacreaevento.jsp?messaggio=Complete all the fields below");
    } else {
        // Creazione di un nuovo oggetto evento
        Evento evento = new Evento(nome, luogo, indirizzo, citta, data, ora, informazioniLuogo, descrizione, tipo, id_host);

        // Salvataggio dell'evento nel database
        if (conn.inserisciEvento(evento)) {
            Evento eventoCreato = conn.getLastEventoHost(id_host);
            if(eventoCreato == null){
                response.sendRedirect("provacreaevento.jsp?messaggio=Errore durante la registrazione dell'evento");
            }else{
                if(tipo.equals("pubblico")){
                    response.sendRedirect("dettaglievento.jsp?IdEvento=" + eventoCreato.getId_evento() + "&messaggio=Evento registrato con successo!");
                }else{
                    response.sendRedirect("listaamiciinvitare.jsp?IdEvento=" + eventoCreato.getId_evento() + "&messaggio=Invita i tuoi amici!");
                }
            }
        } else {
            response.sendRedirect("provacreaevento.jsp?messaggio=Errore durante la registrazione dell'evento");
        }
    }
%>