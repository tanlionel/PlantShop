    <%-- 
    Document   : personalPage
    Created on : Mar 10, 2023, 7:29:25 PM
    Author     : NGUYEN TAN
--%>

<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/mycss.css"/>
    </head>
    <body>

        <c:if test="${fullname !=null}" >
            <header><%@include file="header_loginedUser.jsp" %></header>
            <h2 style="color: blue">Welcome  ${sessionScope.fullname} come back</h3>
                From<input type="date" name="datefrom" value="<%=request.getParameter("datefrom")%>"/>
                To<input type="date" name="dateto" value="<%= request.getParameter("dateto")%>"/>
                <input type="submit" name="action" value="searchOrderBydate"/>
            </form>
                <section><!--load all orders-->
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
                        <%
                            ArrayList<Order> list = (ArrayList<Order>) OrderDAO.getOrder((String) session.getAttribute("email"));
                            String[] status = {"", "processing", "completed", "  canceled"};
                            if (list != null && !list.isEmpty()) {
                                for (Order tmp : list) {
                        %>
                        <tbody>
                            <tr>
                                <th scope="row"><%= tmp.getOrderID()%></th>
                                <td><%= tmp.getOrderDate()%></td>
                                <td><%= tmp.getShipDate()%></td>
                                <td><%= status[tmp.getStatus()]%>
                                    <br/><% if (tmp.getStatus() == 1)%><a href="cancelOrder?orderid=<%=tmp.getOrderID()%>">cancel order</a></td>
                                <td><a href="OrderDetail.jsp?orderid=<%= tmp.getOrderID()%>">detail</a></td>
                            </tr>
                        </tbody>
                        <%
                          }
                      }
                      else{%><p>You don't have any order</p><%} 
                        %>
                    </table>
                </section>
                <footer><%@include file="footer.jsp" %></footer>
                </c:if>
                <c:if test="${sessionScope.fullname == null}">
                    <% response.sendRedirect("errorpage.jsp");%>
                </c:if>
            </body>
            </html>
