<%@ page language="java" pageEncoding="GBK" import="java.util.*,entity.*,dao.*,dao.impl.*,java.lang.*" contentType="text/html; charset=utf-8" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>123</title>
    <meta http-equiv = "content-type" content = "text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body style = "text-align:center">
	    <% 
	    	String uname = request.getParameter("username");
	    	String upass = request.getParameter("password");
	    	if(uname.equals("Gean") && upass.equals("123"))
	    	{
	    %>
	    		<jsp:forward page = "success.jsp" />
	    <%
	      	} 
	    	else
	    	{  
	    %>
	    		<jsp:forward page = "login.jsp" />
	    <%  }  %>
  </body>
</html>
