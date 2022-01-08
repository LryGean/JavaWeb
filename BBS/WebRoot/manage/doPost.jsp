<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("GBK");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	ITopicDao topicDao = new TopicDaoImpl();
	User user = (User)session.getAttribute("user");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	if(user!=null){
		Topic topic = new Topic();
		topic.setTitle(title);
		topic.setContent(content);
		topic.setBoardId(boardId);
		topic.setUserId(user.getUserId());
		topicDao.addTopic(topic);
		response.sendRedirect("../list.jsp?page=1&boardId="+boardId);
	}else{
		response.sendRedirect("../login.jsp");
	}
%>
</html>
