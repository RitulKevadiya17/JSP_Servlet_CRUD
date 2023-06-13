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

public class UpdateRecord extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String upid= request.getParameter("user_id");
        String upname = request.getParameter("user_name");
        String uppassword = request.getParameter("user_password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "Admin@123$");
            PreparedStatement ps1 = con.prepareStatement("update user set name=?,password=? where id=?");
            ps1.setString(1,upname);
            ps1.setString(2,uppassword);
            ps1.setString(3,upid);
            ps1.executeUpdate();
//            RequestDispatcher rd=request.getRequestDispatcher("view_record.jsp");
//            rd.forward(request,response);
            response.sendRedirect("view_record.jsp");

        } catch (Exception ignored) {

        }
    }
}
