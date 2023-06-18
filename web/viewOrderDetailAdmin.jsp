<%-- 
    Document   : index
    Created on : Mar 20, 2023, 2:11:38 PM
    Author     : NGUYEN TAN
--%>

<%@page import="sample.dto.OrderDetail"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin index</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="mycss.css" rel="stylesheet" />
    </head>
    <body>
        <c:if test="${sessionScope.role==1}">
            <c:import url="header_loginedAdmin.jsp"></c:import>
                <section>
                    <img src="images/background.jpg" width="100%" height="300px"/>
                </section><br/><br/>
                <h1></h1>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int OrderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(OrderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail tmp : list) {
            %>
            <table class="order">
                <tr><td>Order ID</td><td>Plant ID</td><td>Plant Name</td><td>Image</td><td>quantity</td></tr>
                <tr>
                    <td><%= tmp.getOrderID()%></td>
                    <td><%= tmp.getPlantID()%></td>
                    <td><%= tmp.getPlantName()%></td>
                    <td><img src="<%= tmp.getImgPath()%>" class="plantimg" width="300px" height="300px"/><br/><%= tmp.getPrice()%></td>
                    <td><%= tmp.getQuantity()%></td>
                    <% money = money + tmp.getPrice() * tmp.getQuantity();%>
                </tr>
            </table>
            <%
                }%>
            <h3>Total money: <%= money%></h3>
            <%
                    }
                }
            %>
        </section>
        <br/><br/>
        <c:import url="footer.jsp"></c:import>
    </c:if>
    <c:if test="${sessionScope.role!=1}">
        <%
            response.sendRedirect("errorpage.jsp");
        %>
    </c:if>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
