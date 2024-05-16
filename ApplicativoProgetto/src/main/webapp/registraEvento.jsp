<%@page import="javaDB.Evento"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.http.Part"%>

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

                String mediaFileName = "";
                Part mediaPart = request.getPart("media");
                if (mediaPart != null && mediaPart.getSize() > 0) {
                    mediaFileName = Paths.get(mediaPart.getSubmittedFileName()).getFileName().toString();
                    // Salva il file sul server
                    String mediaUploadDirectory = request.getServletContext().getRealPath("/") + "imagetree/eventspic/" + eventoCreato.getIdHost();
                    File mediaUploadPath = new File(mediaUploadDirectory);
                    if (!mediaUploadPath.exists()) {
                        mediaUploadPath.mkdirs();
                    }
                    String mediaFilePath = mediaUploadDirectory + File.separator + "1.png"; // Rinomina il file come 1.png
                    mediaPart.write(mediaFilePath);
                }

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
