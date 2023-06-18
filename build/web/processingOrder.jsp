<%-- 
    Document   : completedOrder
    Created on : Mar 15, 2023, 9:13:25 PM
    Author     : NGUYEN TAN
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            ArrayList<Order> list = (ArrayList<Order>) OrderDAO.getProcessingOrder(email);
            if (name == null) {
        %>
        <p><font color="red">you must login to view completed Order page</font> </p>
        <p></p><%
        }
        else {
        %>
        <header><%@include file="header_loginedUser.jsp" %></header>
        <section>
            <h3>Welcome <%= name%> comback</h3>
        </section>
        <section><!--load all orders-->
            <%
                String[] status = {"", "processing", "completed", "  canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order tmp : list) {
            %>
            <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Order ID</th>
                            <th scope="col">Order Date</th>
                            <th scope="col">Ship Date</th>
                            <th scope="col">Order's status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><%= tmp.getOrderID()%></th>
                            <td><%= tmp.getOrderDate()%></td>
                            <td><%= tmp.getShipDate()%></td>
                            <td><%= status[tmp.getStatus()]%>
                                <br/><% if (tmp.getStatus() == 1)%><a href="#">cancel order</a></td>
                            <td><a href="OrderDetail.jsp?orderid=<%= tmp.getOrderID()%>">detail</a></td>
                        </tr>
                    </tbody>
                </table>
            <%
                    }
                }
                else{%><p>You don't have any processing order</p><%} 
            %>

        </section>
        <footer><%@include file="footer.jsp" %></footer>
            <%}%>
    </body>
</html>
