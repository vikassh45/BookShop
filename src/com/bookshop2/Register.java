package com.bookshop2;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  String fname=request.getParameter("fname");
		  String lname=request.getParameter("lname");
		  String uname=request.getParameter("uname");
		  String pass=request.getParameter("pass");
		  String mail=request.getParameter("mail");
		  String username="root";
		  String password="root";
		  String url="jdbc:mysql://localhost:3306/bookshop";
		  String sql="INSERT INTO login (fname, lname, uname,pass,mail) VALUES (?,?,?,?,?)";
		  
		  
		  response.setContentType("text/html");

		  
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con=DriverManager.getConnection(url,username,password);
			 PreparedStatement st= con.prepareStatement(sql);
			   st.setString(1, fname);
			   st.setString(2, lname);
			   st.setString(3, uname);
			   st.setString(4, pass);
			   st.setString(5, mail);
			  
			   st.executeUpdate();
			 
			   //Create table login(fname varchar(20),lname varchar(20),uname varchar(20),pass varchar(20),mail varchar(20));
			   response.sendRedirect("login.jsp");
		 
		 } catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		
	}

}
