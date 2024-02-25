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
        this.cn = DriverManager.getConnection("jdbc:mysql://localhost/verifica", "root", "grandesql");

        this.stmt = cn.createStatement();
    }

    /*sql = "SELECT * FROM dipendenti WHERE userid='" + username + "' AND pwd='" + password + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            return getDipendenteFromResultSet(rs);
        } else {
            return null;
        }
    }

    public Dipendente getDipendenteFromResultSet(ResultSet rs) throws SQLException {
        String username = rs.getString("userid");
        String password = rs.getString("pwd");
        String cognome = rs.getString("Cognome");
        String nome = rs.getString("Nome");

        return new Dipendente(username, password, cognome, nome);
    }*/




}