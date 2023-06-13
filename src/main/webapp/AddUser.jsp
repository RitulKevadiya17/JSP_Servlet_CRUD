<%--
  Created by IntelliJ IDEA.
  User: ritul
  Date: 06-06-2023
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add-User-page</title>
    <style>
        .card {
            width: 450px;
            height: 300px;
            padding: 5px;
            background-image: linear-gradient(mediumslateblue, lightcoral);
        }
    </style>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


<%--<body style="background-image: url(image/111.jpg);background-size:cover;background-attachment:fixed">--%>
<body bgcolor="#778899">
<div class="container">
    <div class="row">
        <div class="col m6 offset-m3">
            <div class="card">
                <div class="card-content">
                    <h5 style="margin-top: 20px" class="center-align">Add Here</h5>
                    <div class="form center-align">

                        <form action="add" method="post" onsubmit="return myFun()">
                            <input type="text" name="add_user_name" placeholder="enter user name" id="nam1"
                                   autocomplete="off">
                            <input type="password" name="add_user_password" placeholder="enter user password" id="pass1"
                                   autocomplete="off">

                            <br><br>
                            <button type="submit" onclick="myFunction()" class="btn blue">Add</button>
                            <script type="text/javascript">

                                function myFun() {
                                    var emailCheck = document.getElementById("nam1").value;
                                    var emailPass = document.getElementById("pass1").value;
                                    var pattern = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
                                    var pattern1 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

                                    if (!pattern.test(emailCheck)) {
                                        alert("This is not a valid email address")
                                        return false;
                                    } else if (!pattern1.test(emailPass)) {
                                        alert("Enter Strong Password")
                                        return false;
                                    } else {
                                        alert("User Add Successfully !!!")
                                    }
                                }
                            </script>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
