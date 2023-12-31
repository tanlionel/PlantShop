<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>

                        <c:if test="${sessionScope.fullname == null}">
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                            <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>

                        </c:if>
                        <c:if test="${sessionScope.fullname!=null}">
                            <li class="nav-item"><a class="nav-link" href="personalPage.jsp">Personal Page</a></li>
                            </c:if>
                            <c:if test="${sessionScope.role==1}">
                            <li class="nav-item"><a class="nav-link" href="AdminIndex.jsp">Admin page</a></li>
                            </c:if>
                    </ul>
                    <div style="display: flex">
                        <form action="mainController" method="post" class="d-flex" style="margin-right: 5px">
                            <input type="text" name="txtsearch" value="<%= request.getParameter("txtsearch") == null ? "" : request.getParameter("txtsearch")%>">
                            <select name="searchby">
                                <option value="byname">by name</option>
                                <option value="bycate">by category</option>
                                <option value="other">other</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form>
                        <form class="d-flex" style="margin-right: 5px">
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                <a href="mainController?action=viewcart" style="text-decoration: none">Cart</a>
                                <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </button>
                        </form>
                        <c:if test="${sessionScope.fullname!=null}">
                            <form class="d-flex" action="mainController">
                                <button class="btn btn-outline-dark" type="submit" value="logout" name="action">Log Out</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <img src="images/plant.jpg" width="1530px" height="400px" alt="alt"/>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
