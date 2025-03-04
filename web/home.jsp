<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>

<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Apall</title>
        <link rel="icon" href="img/simple-house-logo.png"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />

    </head>

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
                                    <h6 class="tm-site-description">Silicone Sealant </h6>	
                                </div>
                            </div>

                            <nav class="col-md-8 col-12 tm-nav">
                                <ul class="tm-nav-ul">
                                    <c:set var="a" value="${sessionScope.account}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "" : "home"}" class="tm-nav-link active ">${a.role == 1 && a.id!=null ? "" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "manager" : "shop"} " class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Manager" : "Shop"}</a></li>
                                        <c:set var="size" value="${requestScope.size}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart"}" class="tm-nav-link ">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"} <span style="font-size: 12px">(${size})</span></a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile"} " class="tm-nav-link">${a.id == null ? "Login":"Profile"}</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>


                <h3></h3>
                <div class="tm-container-inner-2 tm-contact-section">
                    <div class="row">
                        <div class="col-md-4">
                            <form action="home" class="tm-contact-form" id="sortForm">
                                <div class="form-group">
                                    <div class=" tm-d-flex" >
                                        <select class="select" name="sortbyday" onchange="change()"> 
                                            <option value="today" ${oldChoice.equals("today")?"selected":""}>Today</option> 
                                            <option value="3dayslast" ${oldChoice.equals("3dayslast")?"selected":""}>Last 3 days</option>
                                            <option value="7dayslast" ${oldChoice.equals("7dayslast")?"selected":""}>Last 7 days</option>
                                            <option value="all" ${oldChoice.equals("all")?"selected":""}>All</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <c:if test="${requestScope.sortby!=null}">  
                    <h2 class="form-group" style="text-align: center">${requestScope.sortby}&nbsp;Feature Products</h2>
                    <div class="row tm-gallery">
                        <div style="justify-content:space-around;" id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.prodRevenue}" var="f">
                                <form action="buy" method="post" id="myform">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item card" >
                                        <figure><a cursor-p href="detail?id=${f.id}&?cid=${f.cid}">
                                                <img src="img/${f.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                            <figcaption class="card-body"> 
                                                <h4 class="tm-gallery-title name">${f.name}</h4>
                                                <div class="price-quantity"">
                                                    <div class="price">
                                                        <span class="tm-gallery-price product-price">${f.price} đ</span>
                                                    </div>
                                                    <div class="quantity">
                                                        <input type="number" name="num" id="qty${f.id}"  value="" class="form-control" placeholder="Quantity" required="" min="0" />
                                                        <input type="hidden" name="id" value="${f.id}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group tm-d-flex">
                                                    <div class="button-group">
                                                        <button type="button" class="btn btn-secondary" onclick="addToCart(${f.id})">
                                                            Add to cart <i class="fas fa-shopping-cart"></i> 
                                                        </button>
                                                        <input class="btn btn-primary" type="submit" value="Buy now!">
                                                    </div>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>

                    <h2 class="form-group" style="text-align: center">New Product</h2>
                    <div class="row tm-gallery">
                        <div style="justify-content:space-around;" id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.newp}" var="n">
                                <form action="buy" method="post" id="myform">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item card" >
                                        <figure><a cursor-p href="detail?id=${n.id}&?cid=${n.cid}">
                                                <img src="img/${n.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                            <figcaption class="card-body"> 
                                                <h4 class="tm-gallery-title name">${n.name}</h4>
                                                <div class="price-quantity"">
                                                    <div class="price">
                                                        <span class="tm-gallery-price product-price">${n.price} đ</span>
                                                    </div>
                                                    <div class="quantity">
                                                        <input type="number" name="num" id="qty${n.id}"  value="" class="form-control" placeholder="Quantity" required="" min="0" />
                                                        <input type="hidden" name="id" value="${n.id}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group tm-d-flex">
                                                    <div class="button-group">
                                                        <button type="button" class="btn btn-secondary" onclick="addToCart(${n.id})">
                                                            Add to cart <i class="fas fa-shopping-cart"></i> 
                                                        </button>
                                                        <input class="btn btn-primary" type="submit" value="Buy now!">
                                                    </div>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>
                    <h2 class="form-group" style="text-align: center">${requestScope.sortby}&nbsp;Most Sold</h2>
                    <div class="row tm-gallery">
                        <div style="justify-content:space-around;" id="tm-gallery-page-pizza" class="tm-gallery-page">
                            <c:forEach items="${requestScope.prodQuantity}" var="m">
                                <form action="buy" method="post" id="myform">
                                    <article class="col-lg-3 col-md-4 col-sm-6 col-3 tm-gallery-item card" >
                                        <figure><a cursor-p href="detail?id=${m.id}&?cid=${m.cid}">
                                                <img src="img/${m.image}" height="250px" width="250px" alt="Image" class=" tm-gallery-img" /></a>
                                            <figcaption class="card-body"> 
                                                <h4 class="tm-gallery-title name">${m.name}</h4>
                                                <div class="price-quantity"">
                                                    <div class="price">
                                                        <span class="tm-gallery-price product-price">${m.price} đ</span>
                                                    </div>
                                                    <div class="quantity">
                                                        <input type="number" name="num" value="" id="qty${m.id}" class="form-control" placeholder="Quantity" required="" min="0" />
                                                        <input type="hidden" name="id" value="${m.id}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group tm-d-flex">
                                                    <div class="button-group">
                                                        <button type="button" class="btn btn-secondary" onclick="addToCart(${m.id})">
                                                            Add to cart <i class="fas fa-shopping-cart"></i> 
                                                        </button>
                                                        <input class="btn btn-primary" type="submit" value="Buy now!">
                                                    </div>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </form>
                            </c:forEach>   
                        </div> 
                    </div>

                </c:if> 


                <style>
                    .tm-contact-link{
                        margin-right:16px;
                    }
                    .tm-contact-icon{
                        margin-right:8px;
                    }
                    .select{
                        padding: 12px 16px;
                        background-color: #f2f2f2;
                        border: 2px solid #333;
                        border-radius: 4px;
                        font-size: 16px;

                    }
                    .select:focus {
                        outline: none;
                        border-color: #007bff;
                    }
                    .select option {
                        padding: 12px 16px;
                    }
                    .select option:hover {
                        background: #f2f2f2;
                    }

                    .select option:focus {
                        background: #007bff;
                        color: #fff;
                    }

                    /*                    card-item*/
                    .card {
                        box-shadow: 0 8px 20px 0 rgba(0,0,0,0.4);
                        transition: 0.3s;
                        border-radius: 5px;
                        margin: 2rem;
                    }

                    .card:hover {
                        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
                    }

                    .card img {
                        border-radius: 5px 5px 0 0;
                        margin-bottom: 0px;
                        margin-top: 12px;
                    }

                    .card-body {
                        padding: 10px;
                        margin-top: 10px;
                        text-align: center;
                    }

                    .card-body h4 {
                        font-size: 1.2em;
                        font-weight: bold;
                    }

                    .btn {
                        border-radius: 12px;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                        padding: 10px 8px;
                        transition: background 0.3s ease;
                    }

                    .btn:hover {
                        background: #A7BEAE;
                    }

                    .btn:active {
                        background: #0062cc;
                        box-shadow: inset 0 3px 5px rgba(0,0,0,0.125);
                    }


                    .btn-primary {
                        background: #319966;
                        color: #fff;
                    }

                    .btn-secondary {
                        background: #F0F0F0;
                        color: black;
                    }
                    .button-group {
                        display: flex;
                        justify-content: space-between;
                        margin-top: 10px;
                    }

                    .button-group .btn {
                        width: 45%;
                    }

                    .price-quantity {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .product-price {
                        font-weight: bold;
                        margin: auto;
                    }
                    .price, .quantity {
                        flex: 1;
                    }
                    .quantity {
                        border: 1px solid #ccc;
                        border-radius: 4px;
                        padding: 8px;
                        margin: auto;
                    }
                    .price {
                        display: flex;
                        justify-content: center;
                    }
                    .quantity {
                        display: flex;
                        justify-content: center;
                    }
                </style>

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
                                                            function buy(id) {
                                                                document.f.action = "buy?id=" + id;
                                                                document.f.submit();
                                                                //                                                          document.getElementById('myform').submit();
                                                            }
                                                            function change() {
                                                                document.getElementById("sortForm").submit();

                                                            }
                                                            function getCookie(cname) {
                                                                var name = cname + "=";
                                                                var ca = document.cookie.split(';');
                                                                for (var i = 0; i < ca.length; i++) {
                                                                    var c = ca[i];
                                                                    while (c.charAt(0) === ' ')
                                                                        c = c.substring(1);
                                                                    if (c.indexOf(name) === 0)
                                                                        return c.substring(name.length, c.length);
                                                                }
                                                                return "";
                                                            }
                                                          function addToCart(id) {
//                                                            var id = document.querySelector("input[name='id']").value;
                                                                var qty = document.getElementById("qty" + id).value;
                                                                var cart = getCookie("cart");
                                                                qty = qty && parseInt(qty) || 0;
                                                                if (qty === null) {
                                                                    alert("Select quantity before Add to Cart");
                                                                } else if(qty===0){
                                                                    alert("Quantity must be greated than 0");
                                                                }
                                                                else if(qty>=1&&qty<=10){
                                                                    var newProduct = id + ":" + qty;
                                                                    if (cart === "") {
                                                                        cart = newProduct;
                                                                    } else {
                                                                        cart = cart + "-" + newProduct;
                                                                    }
                                                                    document.cookie = "cart=" + cart;
                                                                    window.window.alert("Add to cart successfully");
                                                                }
                                                                else if(qty>=11){
                                                                    alert("Quantity must be smaller than 11");
                                                                }
                                                            }
        </script>

    </body>
</html>
