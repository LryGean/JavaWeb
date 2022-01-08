<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	request.setCharacterEncoding("GBK");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	int topicId = Integer.parseInt(request.getParameter("topicId"));
	User user = (User)session.getAttribute("user");
	IReplyDao replyDao = new ReplyDaoImpl();
	if(user!=null){
		Reply Reply = new Reply();
		Reply.setTitle(title);
		Reply.setContent(content);
		Reply.setTopicId(topicId);
		Reply.setUserId(user.getUserId());
		replyDao.addReply(Reply);
		response.sendRedirect("../detail.jsp?page=1&boardId=" + boardId + "&topicId=" + topicId);
		return;
	}else{
		response.sendRedirect("../login.jsp");
	}
%>

</html>
