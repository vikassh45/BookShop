<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
    
<!DOCTYPE html>
<html lang="en">
<%String username=(String)session.getAttribute("username");
if(username==null)
{response.sendRedirect("login.jsp");}
else {
%>
<head>

    <meta charset="UTF-8">
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#03a6f3">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/styles.css">
           <% 
           int d=0;
%>
</head>

<body>
    <header>
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-3"><a href="#" class="web-url">www.bookstore.com</a></div>
                    <div class="col-md-6">
                        <h5>Free Shipping Over $99 + 3 Free Samples With Every Order</h5></div>
                    <div class="col-md-3">
                        <span class="ph-number">Call : 800 1234 5678</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-menu">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="logo"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="navbar-item active">
                                <a href="index.jsp" class="nav-link">Home</a>
                            </li>
                            <li class="navbar-item">
                                <a href="products.jsp" class="nav-link">Shop</a>
                            </li>
                            <li class="navbar-item">
                                <a href="about.jsp" class="nav-link">About</a>
                            </li>
                            <li class="navbar-item">
                                <a href="faq.jsp" class="nav-link">FAQ</a>
                            </li>
                                            <%  if(username==null) { %>
         <li class="navbar-item">
                                <a href="login.jsp" class="nav-link">Login</a>
                            </li>
      <% } else { %>
          <li class="navbar-item">
                                <a  class="nav-link">Hello <%=username %></a>
                            </li>
                            <li class="navbar-item">
                                <a href="Logout" class="nav-link">Logout</a>
                            </li>
      <% } %>
                        </ul>
                        
                        <form class="form-inline my-2 my-lg-0" action="search.jsp">
                            <input class="form-control mr-sm-2" name="search" type="search" placeholder="Search here..." aria-label="Search">
                            <span class="fa fa-search"></span>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <div class="breadcrumb">
        <div class="container">
            <a class="breadcrumb-item" href="index.jsp">Home</a>
            <span class="breadcrumb-item active">Cart</span>
        </div>
    </div>
    <section class="static about-sec">
        <div class="container">
            <h1>My Cart</h1>
            
      <div class="recomended-sec">
                <div class="row">      
            
             <%
         	int bookid=Integer.parseInt(request.getParameter("bid"));
    String u="root";
    String p="root";
    String url="jdbc:mysql://localhost:3306/bookshop";
    String sql="select name,price from book where bookid=?";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(url,u,p);
    PreparedStatement st=con.prepareStatement(sql);
    st.setInt(1, bookid);
    ResultSet rs=st.executeQuery();
    int amount=0;
    while(rs.next())
    	
    {   
    	String j="ImageLoader?bid=" +bookid;
     String k="product-single.jsp?bid=" +bookid;
     
     amount=amount+rs.getInt("price");
    %>
 
 
                    <div class="col-lg-3 col-md-6">
                        <div class="item">
                            <img src=<%=j%> width=150 height=225 alt="img">
                            <h5><%=rs.getString("name") %></h5>
                            <h6><span class="price"><i class="fa fa-inr"></i><%=rs.getInt("price") %></span></h6>
                            <div class="hover">
                                <a href=<%=k%>>
                            <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </a>
                            
                            </div>
                            
                        </div>
                    </div>
  <%
}
%>
                </div>
            </div> 
            <%if(amount!=0){ %>
            <%if(amount<500) d=50; %>
            <hr> <h3>Total Price :  <i class="fa fa-inr"></i>   <%=  amount %></h3>
                   <h3>Delivery fee:  <i class="fa fa-inr"></i>   <%=  d %></h3><hr>
                   <h4>Total Amount:  <i class="fa fa-inr"></i>   <%=amount+d %></h4><br>
                   <div class="btn-sec">
                     <a href="final.jsp"> <button class="btn">Confirm Order</button></a>
                        
                    </div>
                   <%} else{%>
                   <h3 align="center">Your Cart Is Empty</h3>
                   
                   <%} %>
                   
            
            
            
            
            
        </div>
        
    </section>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="address">
                        <h4>Our Address</h4>
                        <h6>The BookStore, 4th Store
                        Beside that building, India</h6>
                        <h6>Call : 800 1234 5678</h6>
                        <h6>Email : info@bookstore.com</h6>
                    </div>
                    <div class="timing">
                        <h4>Timing</h4>
                             <h6>Open 24*7</h6>
                        <h6>365 days a year</h6>
                        <h6>into your service</h6>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="navigation">
                        <h4>Navigation</h4>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="about.jsp">About Us</a></li>
                            <li><a href="privacy-policy.jsp">Privacy Policy</a></li>
                            <li><a href="terms-conditions.jsp">Terms</a></li>
                            <li><a href="products.jsp">Products</a></li>
                        </ul>
                    </div>
                    <div class="navigation">
                        <h4>Help</h4>
                        <ul>
                            <li><a href="shipping.jsp">Shipping & Returns</a></li>
                            <li><a href="privacy-policy.jsp">Privacy</a></li>
                            <li><a href="faq.jsp">FAQs</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form">
                        <h3>Quick Contact us</h3>
                        <h6>We are now offering some good discount 
                            on selected books go and shop them</h6>
                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <input placeholder="Name" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" placeholder="Email" required>
                                </div>
                                <div class="col-md-12">
                                    <textarea placeholder="Messege"></textarea>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn black">Alright, Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>(C) 2020. All Rights Reserved. BookStore</h5>
                    </div>
                    <div class="col-md-6">
                        <div class="share align-middle">
                            <span class="fb"><i class="fa fa-facebook-official"></i></span>
                            <span class="instagram"><i class="fa fa-instagram"></i></span>
                            <span class="twitter"><i class="fa fa-twitter"></i></span>
                            <span class="pinterest"><i class="fa fa-pinterest"></i></span>
                            <span class="google"><i class="fa fa-google-plus"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>
<%}%>