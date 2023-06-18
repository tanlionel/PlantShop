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
        <title>Admin index</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <c:if test="${sessionScope.role==1}">
            <c:import url="header_loginedAdmin.jsp"></c:import>
                <section>
                    <img src="images/background.jpg" width="100%" height="300px"/>
                </section><br/><br/>
                <h1></h1>
                <table class="table">
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Ship Date</th>
                        <th>status</th>
                        <th>Acc ID</th>
                        <th>Action</th>
                    </tr>
                <c:forEach items="${requestScope.orderList}" var="tmp">
                    <tr>
                        <td>${tmp.getOrderID()}</td>
                        <td>${tmp.getOrderDate()}</td>
                        <td><c:choose>
                                <c:when test="${tmp.getShipDate()==null}">N/A</c:when>
                                <c:otherwise>${tmp.getShipDate()}</c:otherwise>
                        </c:choose></td>
                        <td><c:choose>
                                <c:when test="${tmp.getStatus() eq 1}">Processing</c:when>
                                <c:when test="${tmp.getStatus() eq 2}">Completed</c:when>
                                <c:when test="${tmp.getStatus() eq 3}">Canceled</c:when>
                        </c:choose></td>
                        <td>${tmp.getAccID()}</td>
                        <td><c:if test="${tmp.getStatus() eq 1}" >
                                <c:url var="mylink" value="mainController">
                                    <c:param name="orderid" value="${tmp.getOrderID()}" ></c:param>
                                    <c:param name="action" value="deleteOrder" ></c:param>
                                </c:url>
                                <a href="${mylink}" style="color: red">Delete Order</a>
                                 <c:url var="detail" value="viewOrderDetailAdmin.jsp">
                                    <c:param name="orderid" value="${tmp.getOrderID()}" ></c:param>
                                    <c:param name="action" value="viewOrderDetail" ></c:param>
                                </c:url>
                                <a href="${detail}" style="margin-left: 20px">View order detail</a>
                        </c:if> </td>
                    </tr>
                </c:forEach>
            </table>
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
