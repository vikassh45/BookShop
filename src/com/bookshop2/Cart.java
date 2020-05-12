package com.bookshop2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String usname= (String)session.getAttribute("username");
		if(usname==null)
		{
			response.sendRedirect("login.jsp");
		}
		else {
		int bookid=Integer.parseInt(request.getParameter("bid"));
		String username="root";
		String password="root";
		String sql="Select name,price from book where bookid=?";
		String sql1="insert into cart value(?,?,?)";
		String sql2="select count(bookid) from cart";
		String url="jdbc:mysql://localhost:3306/bookshop";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st= con.prepareStatement(sql);
			st.setInt(1, bookid);
			ResultSet rs=st.executeQuery();
			rs.next();
			String name=rs.getString(1);
			String p=rs.getString(2);
			int price=Integer.parseInt(p);
			PreparedStatement st1= con.prepareStatement(sql1);
			st1.setInt(1,bookid);
			st1.setString(2, name);
			st1.setInt(3, price);
			st1.executeUpdate();
			PreparedStatement st2= con.prepareStatement(sql2);
			ResultSet rs2=st2.executeQuery();
			rs2.next();
			int count=rs2.getInt(1);
			
			session.setAttribute("count", count);
			response.sendRedirect("products.jsp");
	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}}
