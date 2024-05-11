<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>new event</title>
    <link href="style/login.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- partial:index.partial.html -->
<body class="align">
<video autoplay="" loop="" muted>
    <source src="images/spheres-balls-bouncing-together-animation.mp4" type="video/mp4" />
</video>
<div class="whiteboardlong">
    <div class="grid">

        <div class="form__field">
            <img src="images/quello_bello_cropped.svg" alt="Immagine di login" class="login__image">
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

        <form action="registra.jsp" method="POST" class="form login">

            <div class="form__field">
                <label for="evt__username"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#spaceship"></use></svg><span class="hidden">Username</span></label>
                <input id="evt__username" type="text" name="nome-evento" class="form__input" placeholder="Nome Evento" required>
            </div>

            <div class="form__field">
                <label for="evt__place"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#spaceship"></use></svg><span class="hidden">Username</span></label>
                <input id="evt__place" type="text" name="nome-evento" class="form__input" placeholder="Luogo Evento" required>
            </div>

            <div class="form__field">
                <label for="evt__address"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#spaceship"></use></svg><span class="hidden">Username</span></label>
                <input id="evt__address" type="text" name="nome-evento" class="form__input" placeholder="Indirizzo" required>
            </div>
1
            <div class="form__field">
                <label for="evt__description"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#spaceship"></use></svg><span class="hidden">Username</span></label>
                <input id="evt__description" type="text" name="nome-evento" class="form__input" placeholder="Descrizione Evento" required>
            </div>

            <div class="form__field">
                <label for="evt__city"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#spaceship"></use></svg><span class="hidden">Username</span></label>
                <input id="evt__city" type="text" name="nome-evento" class="form__input" placeholder="Citta" required>
            </div>

            <div class="form__field">
                <label for="evt__info"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#spaceship"></use></svg><span class="hidden">Username</span></label>
                <input id="evt__info" type="text" name="nome-evento" class="form__input" placeholder="Informazioni Evento" required>
            </div>

            <div class="form__field">
                <label for="evt__date"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#calendar"></use></svg><span class="hidden">Date of Birth</span></label>
                <input id="evt__date" type="date" name="Data" class="form__input" required>
            </div>

            <div class="form__field">
                <label for="evt__privacy">
                    <svg class="icon">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use>
                    </svg>
                    <span class="hidden">Privacy</span>
                </label>
                <div class="toggle-switch">
                    <input id="evt__privacy" type="checkbox" name="privacy" class="toggle-switch__checkbox">
                    <label class="toggle-switch__label" for="evt__privacy">
                        <span class="toggle-switch__inner"></span>
                        <span class="toggle-switch__switch"></span>
                    </label>
                </div>
            </div>

        </form>
    </div>
</div>


<svg xmlns="http://www.w3.org/2000/svg" class="icons"><symbol id="arrow-right" viewBox="0 0 1792 1792"><path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/></symbol>
    <symbol id="lock" viewBox="0 0 1792 1792"><path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/></symbol>
    <symbol id="user" viewBox="0 0 1792 1792"><path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/></symbol>
    <symbol id="email" viewBox="0 0 1792 1792"><path d="M1664 544v768q0 26-19 45t-45 19H192q-26 0-45-19t-19-45V544q0-26 19-45t45-19h1408q26 0 45 19t19 45z m0-384q0 26-19 45t-45 19H192q-26 0-45-19T128 160V32q0-26 19-45t45-19h1408q26 0 45 19t19 45v128z m-448 640l-640 512h1280l-640-512z"/></symbol>
    <symbol id="calendar" viewBox="0 0 1792 1792"><path d="M1792 384v1088q0 26-19 45t-45 19H64q-26 0-45-19t-19-45V384q0-26 19-45t45-19h256v-64q0-26 19-45t45-19t45 19t19 45v64h640v-64q0-26 19-45t45-19t45 19t19 45v64h256q26 0 45 19t19 45z m-1152-64v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m-512-192v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m-512-192v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z"/></symbol>
    <symbol id="monkey" viewBox="0 0 358 410"><path d="M330.6 243.5a36.2 36.2 0 0 1 9.3 0c1.7-3.8 2-10.4 .5-17.6-2.2-10.7-5.3-17.1-11.5-16.1s-6.5 8.7-4.2 19.4c1.3 6 3.5 11.1 6 14.3zM277.1 252c4.5 2 7.2 3.3 8.3 2.1 1.9-1.9-3.5-9.4-12.1-13.1a31.4 31.4 0 0 0 -30.6 3.7c-3 2.2-5.8 5.2-5.4 7.1 .9 3.7 10-2.7 22.6-3.5 7-.4 12.8 1.8 17.3 3.7zm-9 5.1c-9.1 1.4-15 6.5-13.5 10.1 .9 .3 1.2 .8 5.2-.8a37 37 0 0 1 18.7-2c2.9 .3 4.3 .5 4.9-.5 1.5-2.2-5.7-8-15.4-6.9zm54.2 17.1c3.4-6.9-10.9-13.9-14.3-7s10.9 13.9 14.3 7zm15.7-20.5c-7.7-.1-8 15.8-.3 15.9s8-15.8 .3-16zm-218.8 78.9c-1.3 .3-6 1.5-8.5-2.4-5.2-8 11.1-20.4 3-35.8-9.1-17.5-27.8-13.5-35.1-5.5-8.7 9.6-8.7 23.5-5 24.1 4.3 .6 4.1-6.5 7.4-11.6a12.8 12.8 0 0 1 17.9-3.7c11.6 7.6 1.4 17.8 2.3 28.6 1.4 16.7 18.4 16.4 21.6 9a2.1 2.1 0 0 0 -.2-2.3c0 .9 .7-1.3-3.4-.4zm299.7-17.1c-3.4-11.7-2.6-9.2-6.8-20.5 2.5-3.7 15.3-24-3.1-43.3-10.4-10.9-33.9-16.5-41.1-18.5-1.5-11.4 4.7-58.7-21.5-83 20.8-21.6 33.8-45.3 33.7-65.7-.1-39.2-48.2-51-107.4-26.5l-12.6 5.3c-.1-.1-22.7-22.3-23.1-22.6C169.5-18-41.8 216.8 25.8 273.9l14.8 12.5a72.5 72.5 0 0 0 -4.1 33.5c3.4 33.4 36 60.4 67.5 60.4 57.7 133.1 267.9 133.3 322.3 3 1.7-4.5 9.1-24.6 9.1-42.4s-10.1-25.3-16.5-25.3zm-316 48.2c-22.8-.6-47.5-21.2-49.9-45.5-6.2-61.3 74.3-75.3 84-12.3 4.5 29.6-4.7 58.5-34.1 57.8zM84.3 249.6C69.1 252.5 55.8 261.1 47.6 273c-4.9-4.1-14-12-15.6-15-13-24.9 14.2-73 33.3-100.2C112.4 90.6 186.2 39.7 220.4 48.9c5.6 1.6 23.9 22.9 23.9 22.9s-34.2 18.9-65.8 45.4c-42.7 32.9-74.9 80.6-94.2 132.4zM323.2 350.7s-35.7 5.3-69.5-7.1c6.2-20.2 27 6.1 96.4-13.8 15.3-4.4 35.4-13 51-25.4a102.9 102.9 0 0 1 7.1 24.3c3.7-.7 14.3-.5 11.4 18.1-3.3 19.9-11.7 36-25.9 50.8A106.9 106.9 0 0 1 362.6 421a132.5 132.5 0 0 1 -20.3 8.6c-53.5 17.5-108.3-1.7-126-43a66.3 66.3 0 0 1 -3.6-9.7c-7.5-27.2-1.1-59.8 18.8-80.4 1.2-1.3 2.5-2.9 2.5-4.8a8.5 8.5 0 0 0 -1.9-4.5c-7-10.1-31.2-27.4-26.3-60.8 3.5-24 24.5-40.9 44.1-39.9l5 .3c8.5 .5 15.9 1.6 22.9 1.9 11.7 .5 22.2-1.2 34.6-11.6 4.2-3.5 7.6-6.5 13.3-7.5a17.5 17.5 0 0 1 13.6 2.2c10 6.6 11.4 22.7 11.9 34.5 .3 6.7 1.1 23 1.4 27.6 .6 10.7 3.4 12.2 9.1 14 3.2 1.1 6.2 1.8 10.5 3.1 13.2 3.7 21 7.5 26 12.3a16.4 16.4 0 0 1 4.7 9.3c1.6 11.4-8.8 25.4-36.3 38.2-46.7 21.7-93.7 14.5-100.5 13.7-20.2-2.7-31.6 23.3-19.6 41.2 22.6 33.4 122.4 20 151.4-21.4 .7-1 .1-1.6-.7-1-41.8 28.6-97.1 38.2-128.5 26-4.8-1.9-14.7-6.4-15.9-16.7 43.6 13.5 71 .7 71 .7s2-2.8-.6-2.5zm-68.5-5.7zm-83.4-187.5c16.7-19.4 37.4-36.2 55.8-45.6a.7 .7 0 0 1 1 1c-1.5 2.7-4.3 8.3-5.2 12.7a.8 .8 0 0 0 1.2 .8c11.5-7.8 31.5-16.2 49-17.3a.8 .8 0 0 1 .5 1.4 41.9 41.9 0 0 0 -7.7 7.7 .8 .8 0 0 0 .6 1.2c12.3 .1 29.7 4.4 41 10.7 .8 .4 .2 1.9-.6 1.7-69.6-15.9-123.1 18.5-134.5 26.8a.8 .8 0 0 1 -1-1.1z"/></symbol>
    <symbol id="spaceship" viewBox="0 0 492 394"><path fill="#ffffff" d="M130 480c40.6 0 80.4-11 115.2-31.9L352 384l-224 0 0 96h2zM352 128L245.2 63.9C210.4 43 170.6 32 130 32h-2v96l224 0zM96 128l0-96H80C53.5 32 32 53.5 32 80v48h8c-22.1 0-40 17.9-40 40v16V328v16c0 22.1 17.9 40 40 40H32v48c0 26.5 21.5 48 48 48H96l0-96h8c26.2 0 49.4-12.6 64-32H456c69.3 0 135-22.7 179.2-81.6c6.4-8.5 6.4-20.3 0-28.8C591 182.7 525.3 160 456 160H168c-14.6-19.4-37.8-32-64-32l-8 0zM512 243.6v24.9c0 19.6-15.9 35.6-35.6 35.6c-2.5 0-4.4-2-4.4-4.4V212.4c0-2.5 2-4.4 4.4-4.4c19.6 0 35.6 15.9 35.6 35.6z"/></symbol>
</svg>
</body>
<!-- partial -->

</body>
</html>
