<%-- 
    Document   : index
    Created on : Mar 20, 2023, 2:11:38 PM
    Author     : NGUYEN TAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section>
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] tmp = {"out of stock", "available"};
                if (keyword == null && searchby == null) {
                    list = PlantDAO.getPlans("", "");
                } else {
                    list = PlantDAO.getPlans(keyword, searchby);
                }
            %>
            <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <%if (list != null && !list.isEmpty())
                            for (Plant res : list) {
                        %>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top img-demo"  src="<%= res.getImgpath()%>" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%= res.getName()%></h5>
                                        <!-- Product price-->
                                        Product ID: <%= res.getId()%><br/>
                                        Price : <%= res.getPrice()%><br/>
                                        Status : <%= tmp[res.getStatus()]%><br/>
                                        Category : <%= res.getCatename()%><br/>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="mainController?action=addtocart&pid=<%=res.getId()%>">add to cart</a></div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </section>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
