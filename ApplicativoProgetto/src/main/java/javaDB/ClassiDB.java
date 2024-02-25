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




}