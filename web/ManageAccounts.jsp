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
                <form action="mainController" method="post" style="margin-left: 50px">
                    <input type="text" name="txtSearch"/>
                    <input type="submit" value="searchAccount" name="action"/>
                </form>
                <h1></h1>
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>status</th>
                        <th>phone</th>
                        <th>role</th>
                        <th>action</th>
                    </tr>
                    <c:forEach var="tmp" items="${requestScope.accountList}">
                    <tr>
                        <td><c:out value="${tmp.getAccID()}"></c:out></td>
                        <td><c:out value="${tmp.getEmail()}"></c:out></td>
                        <td><c:out value="${tmp.getFullname()}"></c:out></td>
                        <td><c:choose>
                                <c:when test="${tmp.getStatus() eq 1}">active</c:when>
                                <c:otherwise>inActive</c:otherwise>
                            </c:choose></td>
                        <td><c:out value="${tmp.getPhone()}"></c:out></td>
                        <td><c:choose>
                                <c:when test="${tmp.getRole() eq 1}">Admin</c:when>
                                <c:otherwise>user</c:otherwise></c:choose></td>
                                <td>
                            <c:if test="${tmp.getRole() eq 0}"> 
                                <c:url var="mylink" value="mainController">
                                    <c:param name="email" value="${tmp.getEmail()}"></c:param>
                                    <c:param name="status" value="${tmp.getStatus()}"></c:param>
                                    <c:param name="action" value="updateStatusAccount"></c:param>
                                </c:url>
                                <a href="${mylink}">Block/UnBlock</a>
                            </c:if>
                        </td>
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
