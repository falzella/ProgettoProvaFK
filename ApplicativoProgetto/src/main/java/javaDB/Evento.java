package javaDB;

public class Evento {
    private  String id_evento;
    private String nome;
    private String luogo;
    private String indirizzo;
    private String citta;
    private String data;
    private String ora;
    private String informazioniLuogo;
    private String descrizione;
    private String tipo;
    private String idHost;

    public Evento(String nome, String luogo, String indirizzo, String citta, String data, String ora, String informazioniLuogo, String descrizione, String tipo, String idHost) {
        this.id_evento = null;
        this.nome = nome;
        this.luogo = luogo;
        this.indirizzo = indirizzo;
        this.citta = citta;
        this.data = data;
        this.ora = ora;
        this.informazioniLuogo = informazioniLuogo;
        this.descrizione = descrizione;
        this.tipo = tipo;
        this.idHost = idHost;
    }

    public Evento(String id_evento, String nome, String luogo, String indirizzo, String citta, String data, String ora, String informazioniLuogo, String descrizione, String tipo, String idHost) {
        this.id_evento = id_evento;
        this.nome = nome;
        this.luogo = luogo;
        this.indirizzo = indirizzo;
        this.citta = citta;
        this.data = data;
        this.ora = ora;
        this.informazioniLuogo = informazioniLuogo;
        this.descrizione = descrizione;
        this.tipo = tipo;
        this.idHost = idHost;
    }

    // Metodi getter e setter per ciascun attributo

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLuogo() {
        return luogo;
    }

    public void setLuogo(String luogo) {
        this.luogo = luogo;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getOra() {
        return ora;
    }

    public void setOra(String ora) {
        this.ora = ora;
    }

    public String getInformazioniLuogo() {
        return informazioniLuogo;
    }

    public void setInformazioniLuogo(String informazioniLuogo) {
        this.informazioniLuogo = informazioniLuogo;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getIdHost() {
        return idHost;
    }

    public void setIdHost(String idHost) {
        this.idHost = idHost;
    }

    public String getId_evento() {
        return id_evento;
    }

    public void setId_evento(String id_evento) {
        this.id_evento = id_evento;
    }
}
