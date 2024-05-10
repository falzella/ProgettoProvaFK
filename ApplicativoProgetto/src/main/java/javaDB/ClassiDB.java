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

    public ArrayList<Evento> GetEventFeed(String IdHost) throws SQLException {
        ArrayList<Evento> eventiList = new ArrayList<>();
        String sql = "SELECT * FROM eventi WHERE eventi.Tipo = 'pubblico' AND eventi.ID_Host <> ?";

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

    public ArrayList<Evento> getPartecipazioniList(String idHost) throws SQLException {
            ArrayList<Evento> eventiList = new ArrayList<>();
            String sql = "SELECT * FROM partecipazioni WHERE ID_Utente = ?";
            try (PreparedStatement preparedStatement = cn.prepareStatement(sql)) {
                preparedStatement.setString(1, idHost);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    Evento evento = getEventoFromHost(rs.getString("ID_Evento"));
                    eventiList.add(evento);
                }
            }
        return eventiList;
    }

}