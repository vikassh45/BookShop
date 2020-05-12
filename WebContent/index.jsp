<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<% 
String username=(String)session.getAttribute("username");
Integer count=(Integer)session.getAttribute("count");
%>

    <meta charset="ISO-8859-1">
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#03a6f3">
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
                            
                            
                            
                            
                            
                            
                            <%-- <% if(username=="null") %>
                            <%{ %>
                            <li class="navbar-item">
                                <a href="login.jsp" class="nav-link">Login</a>
                            </li><%} %>
                            <%if(username!=null)%>
                            <%{ %>
                            <li class="navbar-item">
                                <a  class="nav-link">Hello <%=username %></a>
                            </li>
                            <%} %> --%>
                        </ul>
                        <div class="cart my-2 my-lg-0">
                            <span>
                      <a href="cart.jsp" style="color:#000000;"><i class="fa fa-shopping-cart" aria-hidden="true" ></i></a>
                            </span>
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
    <section class="slider">
        <div class="container">
            <div id="owl-demo" class="owl-carousel owl-theme">
                <div class="item">
                    <div class="slide">
                        <img src="images/slide1.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.jsp" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide2.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.jsp" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide3.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.jsp" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide4.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.jsp" class="btn">shop books</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="recomended-sec">
        <div class="container">
            <div class="title">
                <h2>highly recommended books</h2>
                <hr>
            </div>
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
    </section>
    <section class="about-sec">
        <div class="about-img">
            <figure style="background:url(./images/about-img.jpg)no-repeat;"></figure>
        </div>
        <div class="about-content">
            <h2>About bookstore,</h2>
<p>When it comes to searching for books, there is only one place to turn to the BookStore. We are largest online book store in India. Having served some of the best in the industry for over 70 years we are your one stop solution for all your book needs.</p>
 <p>We have a veritable collection of books that span categories as diverse as you could possibly expect. From segments like accountancy, to parenting and pregnancy, to banking and finance, to even topics on yoga and meditation almost any category you seek you will find with us at The BookStore. In the rare case that you do not find the book you are looking for, you can always place a request in our feedback section.
 </p>           
            <div class="btn-sec">
                <a href="products.jsp" class="btn yellow">shop books</a>
                
            </div>
        </div>
    </section>
    <section class="features-sec">
        <div class="container">
            <ul>
                <li>
                    <span class="icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                    <h3>SAFE SHOPPING</h3>
                    <h5>Safe Shopping Guarantee</h5>
                    <h6>We accept all the major credit cards like MasterCard, VISA, Diners Club, Citibank, AMEX etc.</h6>
                </li>
                <li>
                    <span class="icon return"><i class="fa fa-reply-all" aria-hidden="true"></i></span>
                    <h3>30- DAY RETURN</h3>
                    <h5>Moneyback guarantee</h5>
                    <h6>All the books eligible for return within 30 days of delivery.You can avail replacement, if a damaged or defective item delivered to you.</h6>
                </li>
                <li>
                    <span class="icon chat"><i class="fa fa-comments" aria-hidden="true"></i></span>
                    <h3>24/7 SUPPORT</h3>
                    <h5>online Consultations</h5>
                    <h6>We provide you 24*7 Customer Support in case you need more information about our services or have a query to be addressed by our team.</h6>
                </li>
            </ul>
        </div>
    </section>
    <section class="offers-sec" style="background:url(images/offers.jpg)no-repeat;">
        <div class="cover"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="detail">
                        <h3>Top 50% OFF on Selected</h3>
                        <h6>We are now offering some good discount 
                    on selected books go and shop them</h6>
                        <a href="products.jsp" class="btn blue-btn">view all books</a>
                        <span class="icon-point percentage">
                            <img src="images/precentagae.png" alt="">
                        </span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail">
                        <h3>Shop <i class="fa fa-inr"></i>500 Above and Get Extra!</h3>
                        <h6>We are now offering some good discount 
                    on selected books go and shop them</h6>
                        <a href="products.jsp" class="btn blue-btn">view all books</a>
                        <span class="icon-point amount"><img src="images/amount.png" alt=""></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="testimonial-sec">
        <div class="container">
            <div id="testimonal" class="owl-carousel owl-theme">
                <div class="item">
                    <h3>BookStore is one of the largest book house in India. I give five star to the BookStore because it contain many best types of books. When you visit this store you will feel that you enter in the lap of books. </h3>
                    <div class="box-user">
                        <h4 class="author">Barack Obama</h4>
                        <span class="country">Ex President USA</span>
                    </div>
                </div>
                <div class="item">
                    <h3>BookStore is one of the largest book house in India. I give five star to the BookStore because it contain many best types of books. When you visit this store you will feel that you enter in the lap of books. </h3>
                    <div class="box-user">
                        <h4 class="author">Donald trump</h4>
                        <span class="country">President USA</span>
                    </div>
                </div>
                <div class="item">
                    <h3>BookStore is one of the largest book house in India. I give five star to the BookStore because it contain many best types of books. When you visit this store you will feel that you enter in the lap of books. </h3>
                    <div class="box-user">
                        <h4 class="author">Corona Virus</h4>
                        <span class="country">Born in China</span>
                    </div>
                </div>
                <div class="item">
                    <h3>BookStore is one of the largest book house in India. I give five star to the BookStore because it contain many best types of books. When you visit this store you will feel that you enter in the lap of books. </h3>
                    <div class="box-user">
                        <h4 class="author">MS Dhoni</h4>
                        <span class="country">Ex Indian Cricket team Captain</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="left-quote">
            <img src="images/left-quote.png" alt="quote">
        </div>
        <div class="right-quote">
            <img src="images/right-quote.png" alt="quote">
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