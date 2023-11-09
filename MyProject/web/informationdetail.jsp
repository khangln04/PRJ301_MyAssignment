<%-- 
    Document   : informationdetail
    Created on : Nov 9, 2023, 6:27:30 AM
    Author     : fpt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: white;
                border-radius: 5px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
            }

            .info-item {
                margin-bottom: 10px;
            }

            .label {
                font-weight: bold;
                margin-right: 10px;
            }
            .student-img {
                max-width: 100%; /* Ảnh sẽ không vượt quá chiều rộng của phần tử cha */
                height: auto; /* Chiều cao sẽ tự động điều chỉnh để không làm biến dạng ảnh */
                display: block; /* Để tránh khoảng trắng dư thừa dưới ảnh */
                margin-top: 5px; /* Khoảng cách giữa nhãn và ảnh */
            }


        </style>
    </head>
    <body>
        <div class="container">
            <h1>Information of Student</h1>        
            <input type="hidden" name="sid" value="${param.id}"/>
            <div class="info-item">
                <span class="label">ID:</span> ${s.id}
            </div>
            <div class="info-item">
                <span class="label">Name:</span> ${s.name}
            </div>
            <div class="info-item">
                <span class="label">Image:</span> <img class="student-img" src="${s.img}" alt=""/>
            </div>

            <div class="info-item">
                <span class="label">Phone Number:</span> ${s.phoneNumber}
            </div>
            <div class="info-item">
                <span class="label">Address:</span> ${s.address}
            </div>
            <div class="info-item">
                <span class="label">Gmail:</span> ${s.gmail}
            </div>
        </div>
    </body>

</html>
