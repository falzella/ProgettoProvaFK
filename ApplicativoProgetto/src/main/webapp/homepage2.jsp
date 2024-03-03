<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="style/homepage.css" rel="stylesheet" type="text/css">

    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

    <title>Dashboard Sidebar Menu</title>
</head>
<body>
<%-- Sidebar Toggle Logic --%>
<nav class="sidebar <% if (request.getAttribute("sidebarClass") == "close") { %>close<% } %>">
    <header>
        <div class="image-text">
                <span class="image">
                    <img src="logo.png" alt="">
                </span>

            <div class="text logo-text">
                <span class="name">Codinglab</span>
                <span class="profession">Web developer</span>
            </div>
        </div>

        <i class='bx bx-chevron-right toggle'></i>
    </header>

    <div class="menu-bar">
        <div class="menu">

            <li class="search-box">
                <i class='bx bx-search icon'></i>
                <input type="text" placeholder="Search...">
            </li>

            <ul class="menu-links">
                <li class="nav-link">
                    <a href="#">
                        <i class='bx bx-home-alt icon' ></i>
                        <span class="text nav-text">Dashboard</span>
                    </a>
                </li>

            </ul>
        </div>

        <div class="bottom-content">
            <li class="">
                <a href="#">
                    <i class='bx bx-log-out icon' ></i>
                    <span class="text nav-text">Logout</span>
                </a>
            </li>

            <li class="mode">
                <div class="sun-moon">
                    <i class='bx bx-moon icon moon'></i>
                    <i class='bx bx-sun icon sun'></i>
                </div>
                <span class="mode-text text">Dark mode</span>

                <div class="toggle-switch" onclick="toggleDarkMode()">  <span class="switch"></span>
                </div>
            </li>

        </div>
    </div>

</nav>

<section class="home">
    <div class="text">Dashboard Sidebar</div>
</section>

<%-- Script Logic Using Inline JavaScript --%>
<script>
    function toggleDarkMode() {
        const body = document.querySelector('body');
        body.classList.toggle("dark");

        if (body.classList.contains("dark")) {
            document.querySelector(".mode-text").innerText = "Light mode";
        } else {
            document.querySelector(".mode-text").innerText = "Dark mode";
        }

        // Update sidebar class attribute based on state (optional)
        <%
        String sidebarClass = "close";
        if (body.classList.contains("dark")) {
            sidebarClass = ""; // Remove close class if dark mode is on
        }
        request.setAttribute("sidebarClass", sidebarClass);
        %>
    }
</script>

</body>
</html>
