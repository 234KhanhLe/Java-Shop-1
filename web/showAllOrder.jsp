<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.OrderDAO" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Order Detail</title>
        <link rel="icon" href="img/simple-house-logo.png"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
                                    <h1 class="tm-site-title">Hola Cafeteria</h1>
                                    <h6 class="tm-site-description">Silicone Sealant</h6>	
                                </div>
                            </div>
                            <nav class="col-md-8 col-12 tm-nav">
                                <ul class="tm-nav-ul">
                                    <c:set var="a" value="${sessionScope.account}"/>
                                    <li class="tm-nav-li"><a href="${a.role == 1 && a.id!=null ? "manager" : "home"} " class="tm-nav-link">${a.role == 1 && a.id!=null ? "Manager" : "Home"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "getorderbydate" : ""} " class="tm-nav-link  ">${a.role == 1 && a.id!=null ? "Statistic detail" : ""}</a></li>
                                    <li class="tm-nav-li"><a href="${a.role == 1 ? "revenue" : "cart"}" class="tm-nav-link active">${a.role == 1 && a.id!=null ? "Revenue statistics" : "Cart"}</a></li>
                                    <li class="tm-nav-li"><a href="${a.id == null ? "login.jsp" : "profile"} " class="tm-nav-link">Profile</a></li>
                                    <li class="tm-nav-li"><a href="logout" class="tm-nav-link">${a.id == null ? "" : "Log Out"}</a></li>
                                </ul>
                            </nav>	
                        </div>
                    </div>
                </div>
            </div>

            <main>
                <div class="col-md-4" style="margin-left: 50px">
                    <a href="revenue"  target="_parent" class="tm-register"  >
                        <i> <-Back </i>
                    </a>
                </div>
                <h2>ALL ORDER</h2>
                <c:forEach items="${requestScope.orderDAO.getAllOrderTagPaging(index == null?1:index)}" var="ot">
                    <div class="order-container">
                        <div class="orderTag">
                            <div>Order Id: ${ot.oId}</div>
                            <div>Name: ${ot.uName}</div>
                            <div>Phone Number: ${ot.uPhone}</div>
                            <div>Date: ${ot.date}</div>
                            <div>Total Money: ${ot.totalMoney}đ</div>
                        </div>
                        <div class="orderDetail">
                            <table border="1">
                                <tr>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                                <c:forEach items="${requestScope.orderDAO.getOrderLineByOId(ot.oId)}" var="ol">
                                    <tr>
                                        <td>${ol.pName}</td>
                                        <td>${ol.price}</td>
                                        <td>${ol.quantity}</td>
                                        <td>${ol.total}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </c:forEach>

                <div class="pagination">
                    <div class="page-link">
                        <a href="showAllOrder?index=${1}">Home</a>
                    </div>
                    <div class="page-link">
                        <a href="showAllOrder?index=${index - 1 > 1?index-1:1}">Pre</a>
                    </div>
                    <c:forEach begin="${index - 2 > 1? index - 2 : 1}" end="${index + 2 < endP? index + 2: endP}" var="i">
                        <div class="page-link ${i == index ? "page-active":""}">

                            <a href="showAllOrder?index=${i}">${i}</a>
                        </div>
                    </c:forEach>
                    <div class="page-link">

                        <a href="showAllOrder?index=${index+1 < endP?index+1:endP}">Next</a>
                    </div>
                    <div class="page-link">

                        <a href="showAllOrder?index=${endP}">End</a>
                    </div>
                </div>

                <style>

                    .orderTag div {
                        text-align: center;
                        padding: 8px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                    }

                    .orderTag div:first-child {
                        background: #319966;
                        color: white;
                    }

                    h2 {
                        font-size: 40px;
                        letter-spacing: 3px;
                        text-align: center;
                    }

                    .orderTag div {
                        font-size: 18px;
                    }

                    .order-container{
                        border-radius: 10px;
                        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
                        width: 90%;
                        margin:2rem auto;
                        padding: 2rem 0;
                    }
                    .orderTag {
                        display: flex;
                        align-items: center;
                        justify-content: space-around;
                        padding: 10px;
                    }

                    .orderTag div {
                        text-align: center;
                        font-weight: bold;
                        white-space: nowrap;
                    }
                    .orderDetail {
                        width: 90%;
                        margin: auto;
                        text-align: center;
                        margin-top: 2rem;

                    }

                    .orderDetail h2 {
                        font-size: 24px;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        font-weight: bold;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    th, td {
                        padding: 8px;
                    }

                    th {
                        background: #319966;
                        color: #ffffff;
                        font-weight: bold;
                    }

                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }

                    tr:hover {
                        background-color: #A7BEAE;
                    }

                    th, td {
                        border: 1px solid #ccc;
                    }

                    .page-link {
                        padding: 0.375rem 0.75rem;
                    }
                    .pagination {
                        display: flex;
                        padding-left: 0;
                        list-style: none;
                        justify-content: center;
                        margin: 4rem;
                    }
                    .page-link{
                        background: #F0F0F0;
                        padding: 4px 8px;
                        margin: 0 8px;
                        border: 2px solid black;
                        border-radius: 6px;
                    }
                    .page-link a {
                        text-decoration: none;
                        color: black;
                    }

                    .page-link:hover{
                        box-shadow: 0 2px 8px 0 rgba(0,0,0,0.3);
                        background-color: #A7BEAE;
                    }
                    .page-active {
                        background-color: #319966;
                    }
                    .page-active a{
                        color:white;
                    }
                    .page-item.disabled .page-link {

                        pointer-events: none;
                        color: #319966;
                        background-color: transparent;
                        border-color: #dee2e6;
                    }
                    .pagination-lg .page-item:first-child .page-link {
                        border-top-left-radius: 0.3rem;
                        border-bottom-left-radius: 0.3rem;
                    }
                    .pagination-lg .page-item:last-child .page-link {
                        border-top-right-radius: 0.3rem;
                        border-bottom-right-radius: 0.3rem;
                    }
                </style>

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
