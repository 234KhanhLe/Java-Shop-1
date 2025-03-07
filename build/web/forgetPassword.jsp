

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Forget Password</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <!-- Top box -->
            <!-- Logo & Site Name -->
            <div class="placeholder">
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
                                        <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "" : "home"}" class="tm-nav-link  ">${a.role == 1 && a.id!=null ? "" : "Home"}</a></li>
                                        <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "manager" : "shop"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : "Shop"}</a></li>
                                            <c:set var="size" value="${sessionScope.size==null?0:sessionScope.size}"/>
                                        <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"} <span style="font-size: 12px">(${size})</span></a></li>
                                        <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile"} " class="tm-nav-link active">Login</a></li>
                                        <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                    </ul>
                                </nav>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <main>
                <header style="margin:60px auto 20px auto" class="row tm-welcome-section">
                    <h2 class="col-12 text-center tm-section-title"> Forget Password </h2>                   
                </header>

                <div class="tm-container-inner-2 tm-contact-section">
                    <div class="row">
                        <div style="margin:auto" class="col-md-6">
                            <form action="forgetPassword" method="post" > 
                                <h3 style="color: red">${requestScope.mess}</h3>
                                <div class="form-group"> 
                                    <input type="text" name="user" class="form-control" placeholder="Username" required="" /> 
                                </div> 
                                <div class="form-group"> 
                                    <input type="text" name="email" class="form-control" placeholder="Email" required="" /> 
                                </div> 
                                <input type="submit" class="tm-btn tm-btn-success tm-btn" value="Send Email"> 
                            </form>

                            <h3 > </h3>

                            <h3 > </h3>
                            <a href="login.jsp" class="tm-register">
                                <i>Already had account?</i>
                            </a>

                        </div>

                        <div class="tm-container-inner-2 tm-map-section">

                            <div class="row">
                                <div class="col-6">
                                    <div class="tm-map">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59584.16344816163!2d105.55262083359368!3d21.03227725056066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1665770215510!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </main>
            <div class="tm-container-inner tm-featured-image">
                <div class="row">
                    <div class="col-12">
                        <div class="placeholder-2">
                            <div class="parallax-window-2" data-parallax="scroll" data-image-src="img/simple-house-01.jpg"></div>		
                        </div>
                    </div>
                </div>
            </div>
                        <jsp:include page="footer.jsp" />


        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
            $(document).ready(function () {
                var acc = document.getElementsByClassName("accordion");
                var i;

                for (i = 0; i < acc.length; i++) {
                    acc[i].addEventListener("click", function () {
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.maxHeight) {
                            panel.style.maxHeight = null;
                        } else {
                            panel.style.maxHeight = panel.scrollHeight + "px";
                        }
                    });
                }
            });
        </script>



    </body>
</html>
