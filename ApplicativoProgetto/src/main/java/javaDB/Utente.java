package javaDB;

public class Utente {

    private String username;
    private String password;
    private String cognome;
    private String nome;
    private String id_utente;
    private String data_nascita;
    private String mail;




    public Utente(String id_utente, String username, String password, String mail, String nome, String cognome, String data_nascita) {
        super();
        this.id_utente = id_utente;
        this.username = username;
        this.password = password;
        this.mail = mail;
        this.nome = nome;
        this.cognome = cognome;
        this.data_nascita = data_nascita;
    }

    public String getId_utente() {
        return id_utente;
    }

    public void setId_utente(String id_utente) {
        this.id_utente = id_utente;
    }

    public String getData_nascita() {
        return data_nascita;
    }

    public void setData_nascita(String data_nascita) {
        this.data_nascita = data_nascita;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }



    public String getPassword() {
        return password;
    }



    public void setPassword(String password) {
        this.password = password;
    }



    public String getCognome() {
        return cognome;
    }



    public void setCognome(String cognome) {
        this.cognome = cognome;
    }



    public String getNome() {
        return nome;
    }



    public void setNome(String nome) {
        this.nome = nome;
    }





}
