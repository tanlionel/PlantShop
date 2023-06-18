<%-- 
    Document   : viewCart
    Created on : Mar 20, 2023, 6:18:24 PM
    Author     : NGUYEN TAN
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View cart</title>
        <<link rel="stylesheet" href="css/mycss.css"/>
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
            <c:if test="${sessionScope.fullname!=null}">
            <h2>Welcome ${sessionScope.fullname} come back</h2>
            <h4><a href="personalPage.jsp">Personal Page</a></h4>
            <font style="color: red;"><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font>
            <c:if test="${sessionScope.CART !=null}">
                <c:if test="${not empty sessionScope.CART}">
                    <% int totalmoney = 0;%>
                    <table class="table">
                        <tr>
                            <td>Product id</td>
                            <td>quantity</td>
                            <td>price</td>
                            <td>image</td>
                            <td>action</td>
                        </tr>
                        <%
                            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("CART");
                            if (cart != null) {
                                Set<String> pids = cart.keySet();
                                for (String pid : pids) {
                                    int quantity = cart.get(pid);
                                    Plant plant = PlantDAO.getPlant(Integer.parseInt(pid));
                                    totalmoney += plant.getPrice();
                        %>
                        <form action="mainController" method="post">
                            <tr><td><input type="hidden" value="<%=pid%>" name="pid"><a href="getPlantServlet?pid=<%=pid%>"><%=pid%></a></td>
                                <td><input type="number" value="<%=quantity%>" name="quantity" /></td>
                                <td><%= plant.getPrice()%></td>
                                <td><img src="<%= plant.getImgpath()%>" width="200px" height="200px"/></td>
                                <td><input type="submit" value="update" name="action"><input type="submit" value="delete" name="action"></td>
                            </tr>
                        </form>
                        <%}
                            }%>
                        <h4 style="margin-top: 30px">Total money <%= totalmoney%></h4>
                        <h4>Order date: <%= java.time.LocalDateTime.now()%></h4>
                        <h4>Ship date: N/A</h4>
                    </table>
                </c:if>
            </c:if>
                <c:if test="${sessionScope.CART !=null}">
                <section>
                    <form action="mainController" method="post" style="text-align: center; margin-bottom: 40px">
                        <input type="submit" value="saveOrder" name="action" class="submitorder"/>
                    </form>
                </section>
            </c:if>
            <c:if test="${empty sessionScope.CART}">
                    <h3 style="color: red">Your cart is empty</h3>
                </c:if>
        </c:if>
                <c:if test="${sessionScope.fullname==null}">
                    <h2 style="color:red">You need log in to shopping</h2>
                </c:if>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
