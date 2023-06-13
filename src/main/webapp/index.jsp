<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<%--<body style="background-image: url(image/111.jpg);background-size:cover;background-attachment:fixed">--%>
<body bgcolor="#778899">
<div class="container">
    <div class="row">
        <div class="col m6 offset-m3"><br>
            <div class="card">
                <div class="card-content">
                    <h5 style="margin-top: 20px" class="center-align">Login Here</h5>
                    <div class="form center-align">
                        <form name="form1" action="loginpage" method="post" id="form1">
                            <input type="text" name="user_name" placeholder="enter user name" id="nam" autocomplete="off">
                            <input type="password" name="user_password" placeholder="enter user password"
                                   id="pass" autocomplete="off"><br><br>

                            <button type="submit" onclick="myFunction()"  class="btn blue">Submit</button>
                            <script>

                                function myFunction() {

                                    <%request.getSession().setAttribute("validation","true");%>
                                }
                            </script>
                            <script>
                                document.addEventListener("DOMContentLoaded", function (event) {
                                    checkCredential();
                                });

                                function checkCredential() {

                                    <% String error = (String) request.getSession().getAttribute("error");%>
                                    var a =
                                    <%=error%>
                                    <%--                                <%request.getSession().setAttribute("error",null);%>--%>
                                    <%request.getSession().removeAttribute("error");%>
                                    if (a != null) {
                                        alert("Please Enter Valid Username or Password !!!")
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