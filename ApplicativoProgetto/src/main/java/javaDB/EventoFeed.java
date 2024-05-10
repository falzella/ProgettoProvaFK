package javaDB;

public class EventoFeed {
    private Evento evento = null;
    private String host;

    public EventoFeed(Evento evento, String host) {
        this.evento = evento;
        this.host = host;
    }

    public Evento GetEvento(){
        return evento;
    }

    public String GetHost(){
        return host;
    }
}
