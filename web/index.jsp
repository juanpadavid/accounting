<%-- 
    Document   : index
    Created on : 4/03/2016, 09:25:09 AM
    Author     : Juan Pa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PUC</title>
    </head>
    <body>
        <h1>Plan Unico de Cuentas</h1>
        <sql:setDataSource
           var="connection" 
           driver="com.mysql.jdbc.Driver"
           url="jdbc:mysql://localhost/accounting"
           user="root" password="juanpa"/>
        <sql:query var="result" dataSource="${connection}">
            select number,name from accounts where number <=9
        </sql:query>
            <form action="ControllerServlet" method="POST">
                <select  name="cuenta">
            <option>Selecciona la clase</option>
                <c:forEach  var="values" items="${result.rows}">
                    <option value="${values.number}">${values.number} ${values.name}</option>
                </c:forEach>
                </select>
                <input  type="submit" value="Enviar" />
            </form>
        
    </body>
</html>
