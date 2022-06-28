<%--
  Created by IntelliJ IDEA.
  User: 89770
  Date: 2022/6/19
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="${pageContext.request.contextPath}/"/>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="5">
    <tr>
        <th>序号</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${list}" var="e">
        <tr>
            <td>${e.id}</td>
            <td>${e.name}</td>
            <td>${e.age}</td>
            <td>
                <a href="EmployeeServlet/findById?id=${e.id}">修改</a>
                <a href="EmployeeServlet/delById?id=${e.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
