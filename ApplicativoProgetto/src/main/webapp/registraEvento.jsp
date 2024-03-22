<%--
    Document   : registrazione
    Created on : Oct 13, 2023, 11:21:50 AM
    Author     : falz
--%>

<%@page import="javaDB.Evento"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="java.io.*"%>
<%@include file="connessione.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
    //String tipo = request.getParameter("tipo");
    String tipo = "privato";
    String id_host = "";

    if(session.getAttribute("idUtente")==null){
        id_host = "2";
    }else{
            id_host = session.getAttribute("idUtente").toString();
    }



    // Validazione dei campi
    if (nome == null || luogo == null || indirizzo == null || citta == null || data == null || ora == null || informazioniLuogo == null || descrizione == null || tipo == null) {
        response.sendRedirect("provacreaevento.jsp?messaggio=Complete all the fields below");
    } else {
        // Creazione di un nuovo oggetto evento
        Evento evento = new Evento(nome, luogo, indirizzo, citta, data, ora, informazioniLuogo, descrizione, tipo, id_host);

        // Salvataggio dell'evento nel database
        if (conn.inserisciEvento(evento)) {
            out.write("Evento registrato con successo!");
        } else {
            response.sendRedirect("provacreaevento.jsp?messaggio=Errore durante la registrazione dell'evento");
        }
    }
%>