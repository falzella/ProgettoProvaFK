package javaDB;

import java.sql.*;
import java.util.ArrayList;

public class ClassiDB {

    private Statement stmt;
    private Connection cn;

    public ClassiDB() throws ClassNotFoundException, SQLException {
        // caricamento driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // connessione database
        this.cn = DriverManager.getConnection("jdbc:mysql://localhost/bellieventi", "root", "");

        this.stmt = cn.createStatement();
    }

    public Utente checkUtenza(String username, String password) throws SQLException {
        String sql = "SELECT * FROM utenti WHERE Username='" + username + "' AND Password='" + password + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            return getUtenteFromResultSet(rs);
        } else {
            return null;
        }
    }

    // da sostituire le throws con try catch
    public Utente GetUtenteFromId(int id) throws SQLException {
        String sql = "SELECT * FROM utenti WHERE Id_Utente='" + id + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            return getUtenteFromResultSet(rs);
        } else {
            return null;
        }
    }

    public Utente getUtenteFromUsername(String username) throws SQLException {
        String sql = "SELECT * FROM utenti WHERE Username='" + username + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            return getUtenteFromResultSet(rs);
        } else {
            return null;
        }
    }

    public Utente getUtenteFromResultSet(ResultSet rs) throws SQLException {
        String id_utente = rs.getString("Id_Utente");
        String username = rs.getString("Username");
        String password = rs.getString("Password");
        String mail = rs.getString("Mail");
        String nome = rs.getString("Nome");
        String cognome = rs.getString("Cognome");
        String data_nascita = rs.getString("Data_Nascita");


        return new Utente(id_utente, username, password, mail, nome, cognome, data_nascita);
    }

    public boolean inserisciUtenza(Utente p) {
        try {
            String sql = "INSERT INTO utenti (Username, Password, Mail, Nome, Cognome, Data_Nascita) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, p.getUsername());
                preparedStatement.setString(2, p.getPassword());
                preparedStatement.setString(3, p.getMail());
                preparedStatement.setString(4, p.getNome());
                preparedStatement.setString(5, p.getCognome());
                preparedStatement.setString(6, p.getData_nascita());


                //p.setData_nascita(p.getData_nascita());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        setIdUtente(p);

        return true;
    }

    public boolean usernameEsistente(String username) {
        try {
            String sql = "SELECT COUNT(*) AS count FROM utenti WHERE Username = ?";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, username);

                ResultSet rs = preparedStatement.executeQuery();

                if (rs.next()) {
                    int count = rs.getInt("count");
                    return count > 0; // Restituisce true se lo username esiste già, altrimenti false
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // In caso di errore, assume che lo username non esista
    }

    public boolean emailEsistente(String email) {
        try {
            String sql = "SELECT COUNT(*) AS count FROM utenti WHERE Mail = ?";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, email);

                ResultSet rs = preparedStatement.executeQuery();

                if (rs.next()) {
                    int count = rs.getInt("count");
                    return count > 0; // Restituisce true se l'email esiste già, altrimenti false
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // In caso di errore, assume che l'email non esista
    }

    public void setIdUtente(Utente utente) {
        try {
            String sql = "SELECT Id_Utente FROM utenti WHERE Username = ?";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, utente.getUsername());

                ResultSet rs = preparedStatement.executeQuery();

                if (rs.next()) {
                    String id_utente = rs.getString("Id_Utente");
                    utente.setId_utente(id_utente);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean inserisciEvento(Evento evento) {
        try {
            String sql = "INSERT INTO eventi (Nome, Luogo, Indirizzo, Citta, Data, Ora, Informazioni_Luogo, Descrizione_Evento, Tipo, Id_Host) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, evento.getNome());
                preparedStatement.setString(2, evento.getLuogo());
                preparedStatement.setString(3, evento.getIndirizzo());
                preparedStatement.setString(4, evento.getCitta());
                preparedStatement.setString(5, evento.getData());
                preparedStatement.setString(6, evento.getOra());
                preparedStatement.setString(7, evento.getInformazioniLuogo());
                preparedStatement.setString(8, evento.getDescrizione());
                preparedStatement.setString(9, evento.getTipo());
                preparedStatement.setString(10, evento.getIdHost());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public Evento getEventoFromResultSet(ResultSet rs) throws SQLException {
        String id_evento = rs.getString("ID_Evento");
        String nome = rs.getString("Nome");
        String luogo = rs.getString("Luogo");
        String indirizzo = rs.getString("Indirizzo");
        String citta = rs.getString("Citta");
        String data = rs.getString("Data");
        String ora = rs.getString("Ora");
        String informazioniLuogo = rs.getString("Informazioni_Luogo");
        String descrizione = rs.getString("Descrizione_Evento");
        String tipo = rs.getString("Tipo");
        String idHost = rs.getString("ID_Host");

        return new Evento(id_evento, nome, luogo, indirizzo, citta, data, ora, informazioniLuogo, descrizione, tipo, idHost);
    }


    public Evento getEventoFromHost(String idEvento) throws SQLException {
        String sql = "SELECT * FROM eventi WHERE ID_Evento = ?";
        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, idEvento);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                return getEventoFromResultSet(rs);
            } else {
                return null;
            }
        }

    }

    public ArrayList<Evento> getEventList(String idHost) throws SQLException {
        ArrayList<Evento> eventiList = new ArrayList<>();
        String sql = "SELECT * FROM eventi WHERE ID_Host = ?";
        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, idHost);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Evento evento = getEventoFromResultSet(rs);
                eventiList.add(evento);
            }
        }

        return eventiList;
    }

    public ArrayList<EventoFeed> GetEventFeed(String IdHost) throws SQLException {
        ArrayList<EventoFeed> eventiList = new ArrayList<>();
        String sql = "SELECT * FROM eventi WHERE eventi.Tipo = 'pubblico' AND eventi.ID_Host <> ?";

        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, IdHost);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Evento evento = getEventoFromResultSet(rs);
                String host = GetUtenteFromId(Integer.parseInt(evento.getIdHost())).getUsername();
                EventoFeed eventoFeed = new EventoFeed(evento, host);
                eventiList.add(eventoFeed);
            }
        }
        return eventiList;
    }

    public ArrayList<Utente> GetFriendFeed(String IdHost) throws SQLException {
        ArrayList<Utente> utentiList = new ArrayList<>();
        String sql = "SELECT utenti.*\n" +
                "FROM amicizieutenti\n" +
                "JOIN utenti ON (amicizieutenti.Id_Utente1 = utenti.Id_Utente OR amicizieutenti.Id_Utente2 = utenti.Id_Utente)\n" +
                "WHERE (amicizieutenti.Id_Utente1 = ? OR amicizieutenti.Id_Utente2 = ?) AND utenti.Id_Utente <> ?;\n";

        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, IdHost);
            preparedStatement.setString(2, IdHost);
            preparedStatement.setString(3, IdHost);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Utente utente = getUtenteFromResultSet(rs);
                utentiList.add(utente);
            }
        }
        return utentiList;
    }

    public ArrayList<Utente> GetSuggestFeed(String IdHost) throws SQLException {
        ArrayList<Utente> utentiList = new ArrayList<>();
        String sql = "SELECT *\n" +
                "FROM utenti\n" +
                "WHERE Id_Utente NOT IN (\n" +
                "    SELECT Id_Utente1\n" +
                "    FROM amicizieutenti\n" +
                "    WHERE Id_Utente2 = ?\n" +
                "    UNION\n" +
                "    SELECT Id_Utente2\n" +
                "    FROM amicizieutenti\n" +
                "    WHERE Id_Utente1 = ?\n" +
                ") AND Id_Utente <> ?;\n";

        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, IdHost);
            preparedStatement.setString(2, IdHost);
            preparedStatement.setString(3 , IdHost);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Utente utente = getUtenteFromResultSet(rs);
                utentiList.add(utente);
            }
        }
        return utentiList;
    }


    public ArrayList<EventoFeed> getPartecipazioniList(String idHost) throws SQLException {
            ArrayList<EventoFeed> eventiList = new ArrayList<>();
            String sql = "SELECT * FROM partecipazioni WHERE ID_Utente = ?";
            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idHost);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    Evento evento = getEventoFromHost(rs.getString("ID_Evento"));
                    String host = GetUtenteFromId(Integer.parseInt(evento.getIdHost())).getUsername();
                    EventoFeed eventoFeed = new EventoFeed(evento, host);
                    eventiList.add(eventoFeed);
                }
            }
        return eventiList;
    }


    public boolean mandarichiesta(String idrichiesta, String idrichiesto) {
        try {
            String sql = "INSERT INTO richiesteamicizia (idRichiedente, idRicevente) VALUES (?, ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idrichiesta);
                preparedStatement.setString(2, idrichiesto);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public ArrayList<Utente> getRichieste(String IdHost) throws SQLException {
        ArrayList<Utente> utentiList = new ArrayList<>();
        String sql = "SELECT utenti.* FROM  utenti INNER JOIN richiesteamicizia ON utenti.Id_Utente = richiesteamicizia.IdRichiedente WHERE richiesteamicizia.IdRicevente = ?";

        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, IdHost);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Utente utente = getUtenteFromResultSet(rs);
                utentiList.add(utente);
            }
        }
        return utentiList;
    }

    public boolean checkAmicizia(String idUtente1, String idUtente2) {
        try {
            if(!idUtente1.equals(idUtente2)){
                String sql = "SELECT COUNT(*) AS count FROM amicizieutenti WHERE (Id_Utente1 = ? AND Id_Utente2 = ?) OR (Id_Utente1 = ? AND Id_Utente2 = ?)";

                try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                    preparedStatement.setString(1, idUtente1);
                    preparedStatement.setString(2, idUtente2);
                    preparedStatement.setString(3, idUtente2);
                    preparedStatement.setString(4, idUtente1);

                    ResultSet rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        int count = rs.getInt("count");
                        return count > 0;
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
        return true;
    }

    public boolean checkRichiesta(String idUtente1, String idUtente2) {
        try {
            String sql = "SELECT COUNT(*) AS count FROM richiesteamicizia WHERE (IDRichiedente = ? AND IDRicevente = ?) OR (IDRichiedente = ? AND IDRicevente = ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idUtente1);
                preparedStatement.setString(2, idUtente2);
                preparedStatement.setString(3, idUtente2);
                preparedStatement.setString(4, idUtente1);

                ResultSet rs = preparedStatement.executeQuery();

                if (rs.next()) {
                    int count = rs.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean eseguiRichiesta(String idrichiesta, String idrichiesto, String esito) {

        if(esito.equals("true")){

            try {
                String sql = "INSERT INTO amicizieutenti (Id_Utente1, Id_Utente2) VALUES (?, ?)";

                try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                    preparedStatement.setString(1,idrichiesto);
                    preparedStatement.setString(2, idrichiesta);

                    preparedStatement.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }

        }

        try {
            String sql = "DELETE FROM richiesteamicizia WHERE (IDRichiedente = ? AND IDRicevente = ?) OR (IDRichiedente = ? AND IDRicevente = ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idrichiesta);
                preparedStatement.setString(2, idrichiesto);
                preparedStatement.setString(3, idrichiesto);
                preparedStatement.setString(4, idrichiesta);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean partecipaEventoPubblico(String idPartecipante, String idEvento) {
        try {
            String sql = "INSERT INTO partecipazioni (ID_Utente, ID_Evento) VALUES (?, ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idPartecipante);
                preparedStatement.setString(2, idEvento);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public Boolean checkPartecipazione(String idutente, String idevento) throws SQLException {
        String sql = "SELECT * FROM partecipazioni WHERE ID_Utente='" + idutente + "' AND ID_Evento='" + idevento + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<Utente> getListaPartecipanti(String idEvento, String idHost) throws SQLException {
        ArrayList<Utente> utentiList = new ArrayList<>();
        String sql = "SELECT utenti.* FROM partecipazioni INNER JOIN utenti ON utenti.Id_Utente = partecipazioni.ID_Utente WHERE partecipazioni.ID_Evento = ? AND utenti.Id_Utente <> ?";
        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, idEvento);
            preparedStatement.setString(2, idHost);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Utente user = getUtenteFromResultSet(rs);
                utentiList.add(user);
            }
        }

        return utentiList;
    }

    public Evento getLastEventoHost(String id_host) {
        String sql = "SELECT * FROM eventi WHERE ID_Host ='" + id_host + "' AND ID_Evento= (SELECT MAX(ID_Evento) FROM eventi WHERE ID_Host ='" + id_host + "')";
        try {
            ResultSet rs = null;
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                return getEventoFromResultSet(rs);
            } else {
                return null;
            }
        } catch (SQLException e) {
            return null;
        }
    }

    public ArrayList<Evento> getInviti(String IdHost) throws SQLException {
        ArrayList<Evento> eventiList = new ArrayList<>();
        String sql = "SELECT eventi.* FROM  eventi INNER JOIN inviti ON eventi.ID_Evento = inviti.ID_Evento WHERE inviti.Id_Invitato = ?";

        try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
            preparedStatement.setString(1, IdHost);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Evento evento = getEventoFromResultSet(rs);
                eventiList.add(evento);
            }
        }
        return eventiList;
    }

    public boolean eseguiInvito(String idhost, String idevento, String esito) {

        if(esito.equals("true")){

            try {
                String sql = "INSERT INTO partecipazioni (Id_Utente, Id_Evento) VALUES (?, ?)";

                try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                    preparedStatement.setString(1,idhost);
                    preparedStatement.setString(2, idevento);

                    preparedStatement.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }

        }

        try {
            String sql = "DELETE FROM inviti WHERE (Id_Invitato = ? AND Id_Evento = ?)";

            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idhost);
                preparedStatement.setString(2, idevento);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


}