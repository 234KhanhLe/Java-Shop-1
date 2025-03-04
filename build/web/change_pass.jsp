<%-- 
    Document   : index
    Created on : 14-Oct-2022, 21:47:53
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Account</title>
        <link rel="icon" href="img/simple-house-logo.png"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/templatemo-style.css" rel="stylesheet" />
    </head>
    <!--
    
    Simple House
    
    https://templatemo.com/tm-539-simple-house
    
    -->
    <body> 

        <div class="container">
            <!-- Top box -->
            <!-- Logo & Site Name -->
            <div class="placeholder">
                <div class="parallax-window" data-parallax="scroll" data-image-src="img/bm02-banner.jpg">
                    <div class="tm-header">
                        <div class="row tm-header-inner">
                            <div class="col-md-6 col-12">
                                <img src="img/simple-house-logo.png" alt="Logo" class="tm-site-logo" /> 
                                <div class="tm-site-text-box">
                                    <h1 class="tm-site-title">Apall</h1>
                                    <h6 class="tm-site-description">Silicone Sealant</h6>	
                                </div>
                            </div>

                            <nav class="col-md-8 col-12 tm-nav">
                                <ul class="tm-nav-ul">
                                    <c:set var="a" value="${sessionScope.account}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "" : "home"}" class="tm-nav-link active ">${a.role == 1 && a.id!=null ? "" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "manager" : "shop"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : "Shop"}</a></li>
                                        <c:set var="size" value="${sessionScope.size==null?0:sessionScope.size}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"} <span style="font-size: 12px">(${size})</span></a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile"} " class="tm-nav-link active">${a.id == null ? "Login":"Profile"}</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>
                <header class="row tm-welcome-section">
                    <c:set var="a" value="${sessionScope.account}"/>
                    <h2 class="col-12 text-center tm-section-title">User ${a.fullname}</h2>
                    <h3 style="color: red">${requestScope.ms}</h3>
                    <a href="profile" target="_parent" class="tm-register">
                        <i> <-Back </i>
                    </a>
                    <h2 class="col-12 text-center tm-section-title"></h2>
                    <form action="change_pass" method="post" >

                        <div class="form-group">
                            <input type="password" name="opass" class="form-control" placeholder="Old password" required="" />
                        </div>
                        <input type="hidden" name="user" value="${sessionScope.account.username}"/>
                        <div class="form-group">
                            <input type="password" name="pass" class="form-control" placeholder="New password" required="" />
                        </div>
                        <div class="form-group">
                            <input type="password" name="re_pass" class="form-control" placeholder="Re-enter password" required="" />
                        </div>
                        <input type="submit" class="tm-btn tm-btn-success tm-btn" value="Change">
                        <h5 style="color:red">${mess}</h5>
                    </form>
                    <h2 class="col-12 text-center tm-section-title"></h2>
                    <h2 class="col-12 text-center tm-section-title"></h2> 
                    <h2 class="col-12 text-center tm-section-title"></h2>  
                </header>
            </main>
            <div class="tm-container-inner tm-featured-image">
                <div class="row">
                    <div class="col-12">
                        <div class="placeholder-2">
                            <div class="parallax-window-2" data-parallax="scroll" data-image-src="img/bm02-banner.jpg"></div>		
                        </div>
                    </div>
                </div>
            </div>
                        <jsp:include page="footer.jsp" />





            <script src="js/jquery.min.js"></script>
            <script src="js/parallax.min.js"></script>
            <script>
                $(document).ready(function () {
                    // Handle click on paging links
                    $('.tm-paging-link').click(function (e) {
                        e.preventDefault();

                        var page = $(this).text().toLowerCase();
                        $('.tm-gallery-page').addClass('hidden');
                        $('#tm-gallery-page-' + page).removeClass('hidden');
                        $('.tm-paging-link').removeClass('active');
                        $(this).addClass("active");
                    });
                });
            </script>
    </body>
</html>
