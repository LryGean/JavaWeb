<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,java.lang.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��֤ע��</title>
    
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
    	String uname = request.getParameter("username");
    	String upass = request.getParameter("password");
    	String mbox = request.getParameter("mailbox");
    	String tel = request.getParameter("tel");
    	int gender = Integer.parseInt(request.getParameter("gender"));
    	String[] hobby = request.getParameterValues("hobby");
    	String city = request.getParameter("city");
    	
    	IUserDao userDao = new UserDaoImpl();
    	User user = new User();
    	//����
    	user.setUserName(uname);
    	//����
    	user.setUserPass(upass);
    	//����
    	user.setMailbox(mbox);
    	//�ֻ���
    	user.setTel(tel);
    	//�Ա�
    	user.setGender(gender);
    	
    	int num = userDao.addUser(user);
    	if(num==1) {
    		response.sendRedirect("../index.jsp");
    	}else {
    		response.sendRedirect("../reg.jsp");
    		out.println("ע��ʧ�ܣ�������Ϣ��д�Ƿ���ȷ��");
    	}
    %>
  </body>
</html>