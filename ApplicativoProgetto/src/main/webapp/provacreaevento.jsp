<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>
<html lang="en">
<head>
    <title>Registra Evento</title>
    <link href="style/creaEvento.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- partial:index.partial.html -->
<body class="align body-creaevento">
<div class="whiteboardlong-horizontal">
    <div class="grid-kami">
        <div class="form__field">
            <img src="images/quello_bello_cropped.svg" alt="KAMI" class="login__image">
        </div>

        <div class="center-text">
            <%
                String message = request.getParameter("messaggio");
                if(message == null || message.isEmpty()) {
                    message = "Complete all the fields below";
                }
                out.write(message);
            %>
        </div>
    </div>
    <form action="registraEvento.jsp" method="POST" class="form login">
        <div class="grid-split-container">
            <div class="grid-split">

                <div class="form__field">
                    <label for="evento__nome">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg>
                        <span class="hidden">Nome</span>
                    </label>
                    <input id="evento__nome" type="text" name="nome" class="form__input" placeholder="Nome" required>
                </div>

                <div class="form__field">
                    <label for="evento__luogo">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg>
                        <span class="hidden">Luogo</span>
                    </label>
                    <input id="evento__luogo" type="text" name="luogo" class="form__input" placeholder="Luogo" required>
                </div>

                <div class="form__field">
                    <label for="evento__indirizzo">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg>
                        <span class="hidden">Indirizzo</span>
                    </label>
                    <input id="evento__indirizzo" type="text" name="indirizzo" class="form__input" placeholder="Indirizzo" required>
                </div>

                <div class="form__field">
                    <label for="evento__citta">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg>
                        <span class="hidden">Città</span>
                    </label>
                    <input id="evento__citta" type="text" name="citta" class="form__input" placeholder="Città" required>
                </div>



                <div class="form__field">
                    <label for="evento__tipo_checkbox">
                        <svg class="icon">
                            <use xlink:href="#lock"></use>
                        </svg>
                        <span class="hidden">Tipo</span>
                    </label>
                    <br>
                    <input id="evento__tipo_checkbox" type="checkbox" name="tipo" value="pubblico">
                    <label for="evento__tipo_checkbox" id="checkbox__label"></label><br>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        var checkbox = document.getElementById("evento__tipo_checkbox");
                        var checkboxLabel = document.getElementById("checkbox__label");

                        checkbox.addEventListener("change", function() {
                            checkboxLabel.textContent = this.checked ? "Pubblico" : "Privato";
                        });

                        // Inizializza lo stato iniziale della checkbox
                        checkboxLabel.textContent = checkbox.checked ? "Pubblico" : "Privato";

                        // Aggiungi un listener per l'invio del modulo
                        document.querySelector('.form').addEventListener('submit', function() {
                            // Assegna il valore corretto al checkbox prima di inviare il modulo
                            checkbox.value = checkbox.checked ? "pubblico" : "privato";
                        });
                    });
                </script>

                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        var checkbox = document.getElementById("evento__tipo_checkbox");

                        // Aggiungi un listener per l'invio del modulo
                        document.querySelector('.form').addEventListener('submit', function(event) {
                            // Verifica se la checkbox è selezionata
                            if (!checkbox.checked) {
                                // Se la checkbox non è selezionata, imposta il valore di "tipo" a "privato"
                                var hiddenInput = document.createElement('input');
                                hiddenInput.type = 'hidden';
                                hiddenInput.name = 'tipo';
                                hiddenInput.value = 'privato';
                                this.appendChild(hiddenInput);
                            }
                        });
                    });
                </script>
            </div>

            <div class="grid-split">
                <div class="form__field">
                    <label for="evento__data">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#calendar"></use></svg>
                        <span class="hidden">Data</span>
                    </label>
                    <input id="evento__data" type="date" name="data" class="form__input" required>
                </div>

                <div class="form__field">
                    <label for="evento__ora">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#calendar"></use></svg>
                        <span class="hidden">Ora</span>
                    </label>
                    <input id="evento__ora" type="time" value="00:00" name="ora" class="form__input" required>
                </div>

                <div class="form__field">
                    <label for="evento__informazioni_luogo">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg>
                        <span class="hidden">Informazioni Luogo</span>
                    </label>
                    <textarea id="evento__informazioni_luogo" name="informazioni_luogo" class="form__input text-area" placeholder="Informazioni Luogo" required></textarea>
                </div>

                <div class="form__field">
                    <label for="evento__descrizione">
                        <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg>
                        <span class="hidden">Descrizione</span>
                    </label>
                    <textarea id="evento__descrizione" name="descrizione" class="form__input text-area" placeholder="Descrizione" required></textarea>
                </div>
            </div>
        </div>

        <div class="grid-button">
            <div class="form__field creaevento-btn">
                <input type="submit" value="CREA EVENTO">
            </div>
        </div>

        <p class="text--center"><a href="homepage.jsp">annulla</a> creazione<svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/images/icons.svg#arrow-right"></use></svg></p>
    </form>
</div>

<svg xmlns="http://www.w3.org/2000/svg" class="icons"><symbol id="arrow-right" viewBox="0 0 1792 1792"><path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/></symbol>
    <symbol id="lock" viewBox="0 0 1792 1792"><path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/></symbol>
    <symbol id="user" viewBox="0 0 1792 1792"><path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/></symbol>
    <symbol id="email" viewBox="0 0 1792 1792"><path d="M1664 544v768q0 26-19 45t-45 19H192q-26 0-45-19t-19-45V544q0-26 19-45t45-19h1408q26 0 45 19t19 45z m0-384q0 26-19 45t-45 19H192q-26 0-45-19T128 160V32q0-26 19-45t45-19h1408q26 0 45 19t19 45v128z m-448 640l-640 512h1280l-640-512z"/></symbol><symbol id="calendar" viewBox="0 0 1792 1792"><path d="M1792 384v1088q0 26-19 45t-45 19H64q-26 0-45-19t-19-45V384q0-26 19-45t45-19h256v-64q0-26 19-45t45-19t45 19t19 45v64h640v-64q0-26 19-45t45-19t45 19t19 45v64h256q26 0 45 19t19 45z m-1152-64v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m-512-192v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m-512-192v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z"/></symbol></svg>
