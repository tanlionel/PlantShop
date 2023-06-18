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
        <c:if test="${sessionScope.fullname !=null}" >
            <header><%@include file="header_loginedUser.jsp" %></header>
            <h2 style="color: blue">Welcome  ${fullname} come back</h3>
                <c:if test="${requestScope.alert!=null}">
                <h2 style="color:red">${requestScope.alert}</h2>
            </c:if>
            <table class="table">
                <thead>
                <th>full name</th>
                <th>phone</th>
                <th>action</th>
                </thead>
                <form action="mainController">
                    <tbody>
                    <td><input type="text" name="fullname" value="${sessionScope.fullname}" /></td>
                    <td><input type="text" name="phone" value="${sessionScope.phone}" /></td>
                    <td><input type="hidden" name="email" value="${sessionScope.email}"/></td>
                    <td><input type="submit" name="action" value="changeProfile"/></td>
                    </tbody>
                </form>
            </table>
            <footer><%@include file="footer.jsp" %></footer>
            </c:if>
            <c:if test="${sessionScope.fullname == null}">
                <% response.sendRedirect("errorpage.jsp");%>
            </c:if>
</body>
</html>
