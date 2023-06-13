package com.example.FormUsingServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DeleteRecord extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

       String did=request.getParameter("de");
       int dId=Integer.parseInt(did);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "Admin@123$");
            PreparedStatement ps1 = con.prepareStatement("delete from user where id=?");
            ps1.setInt(1,dId);
            ps1.executeUpdate();

            response.sendRedirect("view_record.jsp");

        } catch (Exception ignored) {

        }
    }
}
