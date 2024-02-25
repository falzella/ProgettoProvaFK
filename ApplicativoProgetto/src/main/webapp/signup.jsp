<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Signup</title>
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
            Register for KAMI!
        </div>

        <form action="registration.jsp" method="POST" class="form login">

            <div class="form__field">
                <label for="signup__username"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg><span class="hidden">Username</span></label>
                <input id="signup__username" type="text" name="username" class="form__input" placeholder="Username" required>
            </div>

            <div class="form__field">
                <label for="signup__email"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#email"></use></svg><span class="hidden">Email</span></label>
                <input id="signup__email" type="email" name="email" class="form__input" placeholder="Email" required>
            </div>

            <div class="form__field">
                <label for="signup__firstname"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg><span class="hidden">First Name</span></label>
                <input id="signup__firstname" type="text" name="firstname" class="form__input" placeholder="First Name" required>
            </div>

            <div class="form__field">
                <label for="signup__lastname"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg><span class="hidden">Last Name</span></label>
                <input id="signup__lastname" type="text" name="lastname" class="form__input" placeholder="Last Name" required>
            </div>

            <div class="form__field">
                <label for="signup__birthdate"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#calendar"></use></svg><span class="hidden">Date of Birth</span></label>
                <input id="signup__birthdate" type="date" name="birthdate" class="form__input" required>
            </div>

            <div class="form__field">
                <label for="signup__password"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use></svg><span class="hidden">Password</span></label>
                <input id="signup__password" type="password" name="password" class="form__input" placeholder="Password" required>
            </div>

            <div class="form__field">
                <label for="signup__confirm_password"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use></svg><span class="hidden">Confirm Password</span></label>
                <input id="signup__confirm_password" type="password" name="confirm_password" class="form__input" placeholder="Confirm Password" required>
            </div>

            <div class="form__field">
                <input type="submit" value="Sign Up">
            </div>

        </form>

        <p class="text--center">Already a member? <a href="login.jsp">Sign in</a> <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/images/icons.svg#arrow-right"></use></svg></p>

    </div>
</div>

<svg xmlns="http://www.w3.org/2000/svg" class="icons"><symbol id="arrow-right" viewBox="0 0 1792 1792"><path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/></symbol><symbol id="lock" viewBox="0 0 1792 1792"><path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/></symbol><symbol id="user" viewBox="0 0 1792 1792"><path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/></symbol><symbol id="email" viewBox="0 0 1792 1792"><path d="M1664 544v768q0 26-19 45t-45 19H192q-26 0-45-19t-19-45V544q0-26 19-45t45-19h1408q26 0 45 19t19 45z m0-384q0 26-19 45t-45 19H192q-26 0-45-19T128 160V32q0-26 19-45t45-19h1408q26 0 45 19t19 45v128z m-448 640l-640 512h1280l-640-512z"/></symbol><symbol id="calendar" viewBox="0 0 1792 1792"><path d="M1792 384v1088q0 26-19 45t-45 19H64q-26 0-45-19t-19-45V384q0-26 19-45t45-19h256v-64q0-26 19-45t45-19t45 19t19 45v64h640v-64q0-26 19-45t45-19t45 19t19 45v64h256q26 0 45 19t19 45z m-1152-64v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m-512-192v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m-512-192v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z m512 0v-128h128v128q0 27-19 45.5t-45 18.5t-45-18.5t-19-45.5z"/></symbol></svg>

</body>
<!-- partial -->

</body>
</html>
