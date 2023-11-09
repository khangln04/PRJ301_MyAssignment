<%-- 
    Document   : home
    Created on : Nov 8, 2023, 12:32:22 PM
    Author     : fpt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT University</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #6b90da;
                color: white;
                padding: 10px;
                text-align: center;
            }

            .logo-container img {
                max-width: 60%;
                height: auto;
            }

            nav {
                background-color: #6b90da;
                color: white;
                text-align: center;
                padding: 10px 0;
            }

            nav ul {
                list-style: none;
                padding: 0;
            }

            nav ul li {
                display: inline;
                margin-right: 20px;
            }

            nav ul li a {
                text-decoration: none;
                color: white;
                font-weight: bold;
            }

            .content {
                text-align: center;
                padding: 20px;
            }

            .image-section img {
                max-width: 100%;
                height: auto;
            }

        </style>
    </head>
    <body>
        <header>
            <div class="logo-container">
                <img src="img/Logo_Dai_hoc_FPT.png" alt="FPT University Logo" />
            </div>
        </header>
        <nav>
            <ul>
                <li><a href="timetable?id=1">Timetable</a></li>
                <li>Check Attendance</li>
                <li>List Student Attendance</li>
            </ul>
        </nav>
        <section class="content">
            <div class="image-section">
                <img src="img/university_fpt.png" alt="" />
            </div>
        </section>
    </body>

</html>
