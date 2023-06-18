<%-- 
    Document   : OrderDetail
    Created on : Mar 20, 2023, 4:03:42 PM
    Author     : NGUYEN TAN
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="sample.dto.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<link rel="stylesheet" href="mycss.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:if test="${sessionScope.name !=null}" >
        <header><%@include file="header_loginedUser.jsp" %></header>
        <h2 style="color: blue">Welcome  ${name} come back</h3>
            <section><!--load all orders-->
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
                        <td><img src="<%= tmp.getImgPath()%>" class="plantimg"/><br/><%= tmp.getPrice()%></td>
                        <td><%= tmp.getQuantity()%></td>
                        <% money = money + tmp.getPrice() * tmp.getQuantity();%>
                    </tr>
                </table>
                <%
                }%>
                <h3>Total money: <%= money%></h3>
                <%
                } else {
                %><p>You don't have any order</p><%
                        }
                    }
                %>
            </section>
        <a href="personalPage.jsp">View all orders</a>
            <footer><%@include file="footer.jsp" %></footer>
    </c:if>
</body>
</html>
