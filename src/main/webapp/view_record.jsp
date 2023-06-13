<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: ritul
  Date: 05-06-2023
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>--%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <br>
    <title>Login-page</title>
    <style>
        table {
            border-width: 1px;
            border-color: aliceblue;
        }
        .widthTable {
            width:500px;
            border-width: 1px;
            border-color: aliceblue;
        }

        td {
            color: black;
            padding: 7px;
            margin: 0;
        }

        form {
            color: black;
            /*padding: 7px;*/
            margin: 0;
        }


        .deleteButtonStyle {
            margin: 0;
            padding: 0;
            border: none;
            background: none;
            cursor: pointer;
            color: red;
        }

        .editButtonStyle {
            margin: 0;
            padding: 0;
            border: none;
            background: none;
            cursor: pointer;
            color: green;
        }

        button {
            margin: 0;
            padding: 0;
            border: none;
            background: none;
            cursor: pointer;
            color: aliceblue;
        }

    </style>
</head>
<body bgcolor="#778899">
<table align="center">
    <tr bgcolor="green">
        <td>
            <a href="AddUser.jsp" class="btn btn-success">
                <button><i class="material-icons" style="font-size:20px" >add_box</i></button>
            </a>
        </td>
        <td>Add New User</td>
    </tr>
    <tr bgcolor="#ffd700">
        <td>
            <a href="index.jsp" class="btn btn-success">
                <button><i class="material-icons" style="font-size:20px">person</i></button>
            </a>
        </td>
        <td>Log in Again</td>
    </tr>
</table>
<br>

<table border="1" align="center" class="widthTable">
    <tr bgcolor="#7b68ee">
        <%--        <td>id</td>--%>
        <td>name</td>
        <td>password</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "Admin@123$");
            PreparedStatement ps = con.prepareStatement("select * from user");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
    %>
    <tr>
        <%--        <td><%=rs.getString("id")%>--%>
        <%--        </td>--%>
        <td><%=rs.getString("name")%>
        </td>
        <td><%=rs.getString("password")%>
        </td>
        <td style="vertical-align: middle;">
            <a href='Update.jsp?d=<%=rs.getString("id")%>'>
                <button style="font-size:24px;" class="editButtonStyle"><i class="material-icons">edit</i></button>
            </a>
        </td>
        <td style="text-align: center; vertical-align: middle;">
            <form action='delete?de=<%=rs.getString("id")%>' method="post">
                <button onclick="return myFunction()"  style="font-size: 24px;" class="deleteButtonStyle"><i class="material-icons">delete</i></button>
                <script>
                    function myFunction(){
                       return confirm("Are you sure you want to delete?");
                    }
                </script>
            </form>
        </td>
    </tr>
    <% }
    } catch (Exception ignored) {

    }
    %>
</table>
</body>
</html>