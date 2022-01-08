<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	ITopicDao topicDao = new TopicDaoImpl();                          //�õ�����Dao��ʵ��
	IReplyDao replyDao = new ReplyDaoImpl();                          //�õ��ظ�Dao��ʵ��
	IUserDao userDao = new UserDaoImpl();                             //�õ��û�Dao��ʵ��
	IBoardDao boardDao = new BoardDaoImpl();                          //�õ����Dao��ʵ��
	
	
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	int p = Integer.parseInt(request.getParameter("page"));                                                       //ҳ���ݹ̶�Ϊ1
	List listTopic = topicDao.findListTopic(p,boardId);              //ȡ�øð�������б�
	Board board = boardDao.findBoard(boardId);
	int prep = p;
	int nextp = p;
	if(listTopic.size() == 20){
		nextp = p+1;
	}
	if(p>1){
		prep = p-1;
	}
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>�����б�</title>
		<meta name="author" content="������">
		<!--<meta http-equiv="refresh" content="10;login.html">-->
		<link rel="stylesheet" type="text/css" href="css.css">
		<link rel="stylesheet" type="text/css" href="screen512to1024.css" media="screen and (min-width:512px) and (max-width:1024px)">
		<link rel="icon" type="image/x-icon" href="img/ͼ��.jpg">
		<style>
			.one{
				font-family: �����п�;
				font-size: 32px;
			}
			.two{
				font-family: �����п�;
				font-size: 32px;
			}
			.three{
				background-color: aliceblue;
				font-family: �����п�;
				font-size: 32px;
			}
			.on{
				font-family: �����п�;
				font-size: 28px;
			}
			.four{
				border-collapse: collapse;
				border: 1px solid lightblue;
				background-color: #FFFFFF ;
				border-color: aliceblue;
			}
			img{
				max-width: 100%;
			}
		</style>
	</head>
	<body>
		<br/>
		<br/>
		<br/>
		<br/>
		<br>
		<br>
		<br/>
		<br/>
		<br/>
		<div width="100%" height="1024px">&nbsp;</div>
		<!-- �û���Ϣ����¼��ע�� -->
		<div class="one">
			<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all">
				<tr bgcolor="#FF8C00">
					<%
						if(session.getAttribute("user")==null){
					%>
					<td width="8px">����δ</td>
					<td width="6px"><a href="login.jsp">��¼</a></td>
					<td width="6px"><a href="reg.jsp">ע��</a></td>
					<%
						}else{
							User loginUser = (User)session.getAttribute("user");
					%>
					 	���ã�<%=loginUser.getUserName() %>|<a href="doLogout.jsp">�ǳ�</a>
					<%
					 	}
					%>
					<td width="256px"></td>
				</tr>
			</table>
		</div>
		<br/>
		<!-- ���� -->
		<div class="two">
		<!-- ���� -->
			<!-- &gt; : > -->
			&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>&gt;&gt;
			<B><a href="list.jsp">JSP����</a></B>
		</div>
		<!-- �������� -->
		<br/>
		<div class="three">
			<button><a href="post.jsp?boardId=<%=boardId %>">������</a></button>
		</div>
		<br/>
		<!-- ��ҳ -->
		<div class="on">
				<table>
					<tr>
						<td align="left">
							<a href="index.jsp?page=<%=prep %>&boardId=<%=boardId%>">��һҳ</a>&nbsp;&nbsp;&nbsp;
						</td>
						<td align="left">
							<a href="reg.jsp?page=<%=nextp %>&boardId=<%=boardId%>">��һҳ</a>
						</td>
					</tr>
				</table>
		</div>
		<div class="four">
			<table width="100%" border="1" bordercolor="lightblue" cellpadding="0" cellspacing="0">
				<tr bgcolor="blanchedalmond">
					<th colspan="4" width="100%">&nbsp;</td>
				</tr>
				<tr height="128px">
					<th width="5%"></th>
					<!-- ��ͷ -->
					<th align="center" width="65%">����</th>
					<th align="center" width="15%">����</th>
					<th align="center" width="15%">�ظ�</th>
				</tr>
				<!-- �����б� -->
				<% 
					for(int i = 0;i<listTopic.size();i++) {
						Topic topic = (Topic)listTopic.get(i);          //ѭ��ȡ���������
						User user = userDao.findUser(topic.getUserId());//ȡ�ø�����ķ����û�
				%>
				<tr height="128px">
					<td width="5%" background="img/1.png"></td>
					<td align="center" width="65%">
						<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId%>&topicId=<%=topic.getTopicId() %>">
							<%= topic.getTitle() %>
						</a>		
					</td>
					<td align="center" width="15%">
						<%= user.getUserName() %>
					</td>
					<td align="center" width="15%">
						<%= replyDao.findCountReply(topic.getTopicId()) %>
					</td>
				</tr>
				<% 	}  %>
			</table>
		</div>
		
		<!-- ��ҳ -->
		<div class="two">
			<center>
				<table>
					<tr>
						<td align="center">
							<a href="list.jsp?page=<%=prep %>&boardId=<%=boardId%>">��һҳ</a>&nbsp;&nbsp;&nbsp;
						</td>
						<td align="center">
							<a href="list.jsp?page=<%=nextp %>&boardId=<%=boardId%>">��һҳ</a>
						</td>
					</tr>
				</table>
			</center>
		</div>
		<!--  ����  -->
	</body>
</html>

