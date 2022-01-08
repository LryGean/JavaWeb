<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,java.lang.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ÑéÖ¤µÇÂ¼</title>
    
    <meta http-equiv = "content-type" content = "text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <% 
    	request.setCharacterEncoding("utf-8");
    	String uName = request.getParameter("username");
    	String uPass = request.getParameter("password");
    	IUserDao userDao = new UserDaoImpl();
    	User user = userDao.findUser(uName);
    	if(user!=null && user.getUserPass().equals(uPass)){
    		//µÇÂ½³É¹¦
    		session.setAttribute("user",user);
    		response.sendRedirect("../index.jsp");
    		
    	}else{
    		//µÇÂ½Ê§°Ü
    		response.sendRedirect("login.jsp?error=fail");
    	}
    %>
  </body>
</html>
