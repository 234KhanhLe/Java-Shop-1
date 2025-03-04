<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Manager</title>
        <link rel="icon" href="img/simple-house-logo.png"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
    </head>

    <script type="text/javascript">
        function doDeleteCate(id) {
            if (confirm("Are you sure to delete this category!?")) {
                window.location = "delete_category?id=" + id;
            }
        }
    </script>
    <script type="text/javascript">
        function doDeleteProd(id) {
            if (confirm("Are you sure to delete this product!?")) {
                window.location = "delete_product?id=" + id;
            }
        }
    </script>
    <body> 
        <c:if test="${sessionScope.msgCategory != null}">
            <script>
                alert('${sessionScope.msgCategory}');
            </script>
            <% session.removeAttribute("msgCategory"); %>
        </c:if>

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
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "manager" : "list"} " class="tm-nav-link active ">${a.role == 1 && a.id!=null ? "Manager" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "getorderbydate" : ""} " class="tm-nav-link  ">${a.role == 1 && a.id!=null ? "Statistic detail" : ""}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile"} " class="tm-nav-link">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>

                <div class="col-md-6" style="">
                    <a href="add_product" class="tm-register">
                        <i>Add Product</i>
                    </a>
                </div>
                <div class="tm-paging-links">
                    <nav>
                        <ul>
                            <a href="add_category.jsp"> <img src="img/add.png" height="25px" width="25px" alt="alt"/> </a>
                                <c:forEach items="${requestScope.categories}" var="c">

                                <li    class="tm-paging-item"><a style="padding: 10px 30px;
                                                                 display: flex;
                                                                 align-items: center;
                                                                 justify-content: center;
                                                                 text-decoration: none;
                                                                 color: #2F956D;
                                                                 background-color: transparent;" href="manager?cid=${c.id}" class="btn-link active">${c.name}</a></li>
                                <img src="img/delete.jpg" height="17px" width="17px"  href="#" onclick="doDeleteCate('${c.id}')"  alt="alt"/>
                                <a href="update_category?id=${c.id}"><img src="img/update.png" height="17px" width="17px"   alt="alt"/></a>
                                </c:forEach>
                        </ul>
                    </nav>
                </div>


                <!-- Gallery -->

                <div class="row tm-gallery">

                    <div id="tm-gallery-page-pizza" class="tm-gallery-page">

                        <c:forEach items="${requestScope.products}" var="p">

                            <article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item">
                                <figure>
                                    <img src="img/${p.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" />
                                    <figcaption>
                                        <h4 class="tm-gallery-title">${p.name}</h4>
                                        <p class="tm-gallery-description">${p.describe}</p>
                                        <p class="tm-gallery-price">${p.price}</p>
                                    </figcaption>
                                </figure>
                            </article>
                            <img src="img/delete.jpg" height="17px" width="17px"  href="#" onclick="doDeleteProd('${p.id}')"  alt="alt"/>
                            <a href="update_product?id=${p.id}"><img src="img/update.png" height="17px" width="17px"   alt="alt"/></a>
                            </c:forEach>                           
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