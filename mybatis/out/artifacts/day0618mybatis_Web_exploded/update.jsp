<%--
  Created by IntelliJ IDEA.
  User: 89770
  Date: 2022/6/19
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="${pageContext.request.contextPath}/"/>
</head>
<body>
<form action="EmployeeServlet/update" method="post">
    <input type="hidden" name="id" value="${employee.id}">
    姓名: <input type="text" name="name" value="${employee.name}"> <br>
    年龄: <input type="number" name="age" value="${employee.age}"> <br>
    <input type="submit" value="提交"> <br>
</form>
</body>
</html>