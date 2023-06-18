<%-- 
    Document   : viewPlant.jsp
    Created on : Mar 21, 2023, 2:47:57 PM
    Author     : NGUYEN TAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr><td rowspan="8"><img src="${plantObj.imgpath}"  width="300px" height="300px"/></td></tr>
            <tr><td>id: ${plantObj.id}</td></tr>
            <tr><td>price: ${plantObj.name}</td></tr>
            <tr><td>description: ${plantObj.description}</td></tr>
            <tr><td>status: ${plantObj.description}</td></tr>
            <tr><td>cate id: ${plantObj.cateid}</td></tr>
            <tr><td>category: ${plantObj.catename}</td></tr>
        </table>
    </body>
</html>
