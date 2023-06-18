<%-- 
    Document   : login
    Created on : Mar 10, 2023, 7:37:28 PM
    Author     : NGUYEN TAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section>
            <!--            <form action="mainController" method="post" class="formlogin">
                            <table>
                                <tr><td>email</td><td><input type="text" name="txtemail"/></td></tr>
                                <tr><td>password</td><td><input type="password" name="txtpassword"/></td></tr>
                                <tr><td colspan="2"><input type="submit" value="login" name="action"></td></tr>
                            </table>
                        </form>-->
            <c:if test="${requestScope.alert !=null}">
                <div  class="alert alert-danger" role="alert">
                    <h3>Wrong User id or password</h3>
                </div>
            </c:if>
            <form action="mainController"    method="post">
                <font style="color: red;"><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font>
                <section class="vh-100 gradient-custom">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                <div class="card bg-dark text-white" style="border-radius: 1rem;">
                                    <div class="card-body p-5 text-center">
                                        <div class="mb-md-5 mt-md-4 pb-5">
                                            <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                            <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                            <div class="form-outline form-white mb-4">
                                                <input type="email" id="typeEmailX" class="form-control form-control-lg" name="txtemail"/>
                                                <label class="form-label" for="typeEmailX">Email</label>
                                            </div>
                                            <div class="form-outline form-white mb-4">
                                                <input type="password" id="typePasswordX" class="form-control form-control-lg" name="txtpassword" />
                                                <label class="form-label" for="typePasswordX">Password</label>
                                            </div>
                                            <td><input type="checkbox" value="savelogin" name="savelogin"/>Stayed signed in</td>
                                            <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>
                                            <button class="btn btn-outline-light btn-lg px-5" type="submit" value="login" name="action">Login</button>
                                            
                                        </div>
                                        <div>
                                            <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-white-50 fw-bold">Sign Up</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </form>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
