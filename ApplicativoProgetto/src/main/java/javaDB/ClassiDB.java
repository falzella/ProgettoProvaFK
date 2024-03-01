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
        this.cn = DriverManager.getConnection("jdbc:mysql://localhost/bellieventi", "root", "grandesql");

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




}