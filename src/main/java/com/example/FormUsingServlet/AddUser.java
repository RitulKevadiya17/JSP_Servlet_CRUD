package com.example.FormUsingServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class AddUser extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("alert('success');");
        String addname = request.getParameter("add_user_name");
        String addpassword = request.getParameter("add_user_password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "Admin@123$");
            PreparedStatement ps1 = con.prepareStatement("insert into user(name,password) values (?,?);");
            ps1.setString(1,addname);
            ps1.setString(2,addpassword);
            ps1.executeUpdate();
            RequestDispatcher rd=request.getRequestDispatcher("view_record.jsp");
            rd.forward(request,response);

        } catch (Exception e) {

        }
    }
}