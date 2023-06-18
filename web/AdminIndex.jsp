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
                </section>
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
