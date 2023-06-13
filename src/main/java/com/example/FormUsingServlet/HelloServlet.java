
package com.example.FormUsingServlet;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class HelloServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name1 = request.getParameter("user_name");
        String password1 = request.getParameter("user_password");


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "Admin@123$");
            PreparedStatement ps1 = con.prepareStatement("select * from user where name=?");
            ps1.setString(1, name1);
            ResultSet rs = ps1.executeQuery();

            String checkpassword = null;
            while (rs.next()) {
                String checkname = rs.getString(2);
                checkpassword = rs.getString(3);
            }
            if (password1.equals(checkpassword)) {

                PreparedStatement ps = con.prepareStatement("insert into user(name,password) values (?,?);");
                // Uncomment the following lines to insert the user into the database
//                ps.setString(1, name1);
//                ps.setString(2, password1);z
//                ps.executeUpdate();

                RequestDispatcher rd = request.getRequestDispatcher("view_record.jsp");
                rd.forward(request, response);
            } else {
                String validation = (String) request.getSession().getAttribute("validation");
                if (validation != null) {
//                        request.getSession().setAttribute("validation",null);
                    request.getSession().removeAttribute("validation");
                    request.getSession().setAttribute("error", "true");
                }
                response.sendRedirect("index.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3> Invalid user name or password</h3>");
            out.println("<a href=index.jsp>Try Again !!!</a>");

        }
    }
}
