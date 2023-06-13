<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.lang.module.ResolutionException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: ritul
  Date: 07-06-2023
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update-Page</title>
    <style>
        .card {
            width: 450px;
            height: 300px;
            padding: 5px;
            background-image: linear-gradient(mediumslateblue,lightcoral);
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
                    <h5 style="margin-top: 20px" class="center-align">Update Here</h5>
                    <div class="form center-align">


                        <% try {
                            String id = request.getParameter("d");
                            int i = Integer.parseInt(id);

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "Admin@123$");
                            PrintWriter pw = response.getWriter();
                            PreparedStatement ps = con.prepareStatement("select * from user where id=?");
                            ps.setInt(1, i);
                            ResultSet rs = ps.executeQuery();
                        %>
                        <div>
                            <form action="update" method="post">

                                <%
                                    while (rs.next()) {
                                %>
                                <%String name = rs.getString("name");%>

                                <%int id1 = rs.getInt("id");%>
                                <%String password = rs.getString("password");%>
                                <div><input type="hidden" class="form-control" name="user_id" value="<%=id1%>"/>
                                </div>
                                <div><input type="text" class="form-control" name="user_name" value="<%=name%>"/>
                                </div>
                                <div><input type="password" class="form-control" name="user_password"
                                            value="<%=password%>"/></div><br>

                                <%
                                    }
                                %>


                                <button onclick="return myFunction()" type="submit" class="btn blue">Update</button>
                                <script>
                                    function myFunction(){
                                         return confirm("Are you sure you want to update?");
                                    }
                                </script>
                            </form>
                        </div>

                        <%
                            } catch (Exception e) {

                            }
                        %>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
