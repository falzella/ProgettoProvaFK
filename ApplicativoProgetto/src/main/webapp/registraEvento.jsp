<%--
    Document   : registrazione
    Created on : Oct 13, 2023, 11:21:50 AM
    Author     : falz
--%>

<%@page import="javaDB.Evento"%>
<%@page import="javaDB.Utente"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="java.io.*"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Registra Evento</title>
</head>
<body>

</body>
</html>

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
    //String tipo = "privato";




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