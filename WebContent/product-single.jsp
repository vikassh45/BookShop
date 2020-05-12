<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<!DOCTYPE html>
<html lang="en">

<head>
<% 
String username=(String)session.getAttribute("username");
Integer count=(Integer)session.getAttribute("count");
%>
    <meta charset="UTF-8">
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#03a6f3">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/styles.css">
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
                        <div class="cart my-2 my-lg-0">
                            <span>
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                                <% if(count==null) {%>
                            <span class="quntity">0</span>
                            <%} %>
                             <% if(count!=null) {%>
                            <span class="quntity"><%=count %></span>
                            <%} %>
                            
                        </div>
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
            <span class="breadcrumb-item active">product-single</span>
        </div>
    </div>
    <section class="product-sec">
        <div class="container">
        
        
        
 <%
	int bookid=Integer.parseInt(request.getParameter("bid"));
    String u="root";
    String p="root";
    String url="jdbc:mysql://localhost:3306/bookshop";
    String sql="select name,price,author,description from book where bookid=?";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(url,u,p);
    PreparedStatement st=con.prepareStatement(sql);
    st.setInt(1, bookid);
    ResultSet rs=st.executeQuery();
      rs.next();
     String j="ImageLoader?bid=" +bookid;
     String c="Cart?bid=" +bookid;
     String buy="buynow.jsp?bid=" +bookid;
      String name=rs.getString("name");
      int price=rs.getInt("price");
      String author=rs.getString("author");
      String description=rs.getString("description");
      int discount=(2000-price);
      int discountpercent=discount/20;
    
    // String k="product-single.jsp?bid=" +rs.getInt("bookid");
    %>
 
        
        
        
        
            <h1><%=name %></h1>
            <div class="row">
                <div class="col-md-6 slider-sec">
                    <!-- main slider carousel -->
                    <div id="myCarousel" class="carousel slide">
                        <!-- main slider carousel items -->
                        <div class="carousel-inner">
                            <div class="active item carousel-item" data-slide-number="0">
                                <img src=<%=j%> width=350 height=550 class="img-fluid">
                            </div>
                            <div class="item carousel-item" data-slide-number="1">
                                <img src=<%=j%> width=350 height=550 class="img-fluid">
                            </div>
                            <div class="item carousel-item" data-slide-number="2">
                                <img src=<%=j%> width=350 height=550 class="img-fluid">
                            </div>
                        </div>
                        <!-- main slider carousel nav controls -->
                        <ul class="carousel-indicators list-inline">
                            <li class="list-inline-item active">
                                <a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#myCarousel">
                                <img src=<%=j%> class="img-fluid">
                            </a>
                            </li>
                            <li class="list-inline-item">
                                <a id="carousel-selector-1" data-slide-to="1" data-target="#myCarousel">
                                <img src=<%=j%> class="img-fluid">
                            </a>
                            </li>
                            <li class="list-inline-item">
                                <a id="carousel-selector-2" data-slide-to="2" data-target="#myCarousel">
                                <img src=<%=j%> class="img-fluid">
                            </a>
                            </li>
                        </ul>
                    </div>
                    <!--/main slider carousel-->
                </div>
                <div class="col-md-6 slider-content">
                    <p><%=description %> </p>
                    <ul>
                        <li>
                            <span class="name">Digital List Price</span><span class="clm">:</span>
                            <span class="price"><i class="fa fa-inr"></i>1000</span>
                        </li>
                        <li>
                            <span class="name">Print List Price</span><span class="clm">:</span>
                            <span class="price"><i class="fa fa-inr"></i>2000</span>
                        </li>
                        <li>
                            <span class="name">Our Price</span><span class="clm">:</span>
                            <span class="price final"><i class="fa fa-inr"></i><%=price %></span>
                        </li>
                        <li><span class="save-cost">Save <i class="fa fa-inr"></i><%=discount %> (<%=discountpercent%>%)</span></li>
                    </ul>
                    <div class="btn-sec">
                      <a href=<%=c %>><button class="btn"> Add To cart</button></a>
                       <a href=<%=buy%> ><button class="btn black">Buy Now</button></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="related-books">
        <div class="container">
            <h2>You may also like these book</h2>
            <div class="recomended-sec">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="item">
                            <img src="images/ex.jfif" alt="img">
                            <h3>The Exorcist</h3>
                            <h6><span class="price"><i class="fa fa-inr"></i>320</span> / <a href="#">Buy Now</a></h6>
                            <div class="hover">
                          <a href=product-single.jsp?bid=12>
                                <span><i class="fa fa-long-arrow-right" aria-hidden="true" ></i></span>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="item">
                            <img src="images/alchemist.jfif" alt="img">
                            <h3>The Alchemist</h3>
                            <h6><span class="price"></i><i class="fa fa-inr"></i>150</span> / <a href="#">Buy Now</a></h6>
                            <span class="sale">Sale !</span>
                            <div class="hover">
                            <a href=product-single.jsp?bid=9>
                                <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="item">
                            <img src="images/becoming.jfif" alt="img">
                            <h3>Becoming</h3>
                            <h6><span class="price"><i class="fa fa-inr"></i>360</span> / <a href="#">Buy Now</a></h6>
                            <div class="hover">
                            <a href=product-single.jsp?bid=7>
                                <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="item">
                            <img src="images/ca.jfif" alt="img">
                            <h3>Catch-22</h3>
                            <h6><span class="price">380</span> / <a href="#">Buy Now</a></h6>
                            <div class="hover">
                            
                                <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
        
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="address">
                        <h4>Our Address</h4>
                        <h6>The BookStore , 4th Store
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
                            <li><a href="faq.jsp">FAQ’s</a></li>
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
                        <h5>(C) 2020. All Rights Reserved. BookStore </h5>
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