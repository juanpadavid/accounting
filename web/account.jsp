<%-- 
    Document   : account
    Created on : 7/03/2016, 05:12:55 PM
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
        <title>PUC </title>
    </head>
    <body>
        <sql:setDataSource
           var="connection" 
           driver="com.mysql.jdbc.Driver"
           url="jdbc:mysql://localhost/accounting"
           user="root" password="juanpa"/>
        <sql:query var="result" dataSource="${connection}">
            select number,name from accounts where handler = ${param.cuenta}
        </sql:query>

        <h1>PUC - Plan Unico de Cuentas</h1>
       
        <select  name="grupo">
            <option>Selecciona el grupo</option>
                <c:forEach  var="values" items="${result.rows}">
                    <option value="${values.number}">${values.number} ${values.name}</option>
                </c:forEach>
                </select>
    </body>
</html>
