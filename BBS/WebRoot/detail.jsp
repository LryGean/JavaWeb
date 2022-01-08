<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	ITopicDao topicDao = new TopicDaoImpl();                        //�õ�����Dao��ʵ��
	IReplyDao replyDao = new ReplyDaoImpl();                        //�õ��ظ�Dao��ʵ��
	IUserDao userDao = new UserDaoImpl();                           //�õ��û�Dao��ʵ��
	IBoardDao boardDao =new BoardDaoImpl();                         //�õ����Dao��ʵ��
	int boardId = Integer.parseInt(request.getParameter("boardId"));//�õ����ID
	int topicId = Integer.parseInt(request.getParameter("topicId"));//�õ�����ID
	int p = Integer.parseInt(request.getParameter("page"));         //ȡ��ҳ��
	Board board = boardDao.findBoard(boardId);                      //ȡ�ð����Ϣ
	Topic topic = topicDao.findTopic(topicId);                      //ȡ��������Ϣ
	User topicUser = userDao.findUser(topic.getUserId());           //ȡ����������
	List listReply = replyDao.findListReply(p,topicId);             //ȡ�ø�����Ļظ��б�
	
	int prep = p;                                                  //��һҳ
	int nextp = p;                                                  //��һҳ
	if(listReply.size() == 20){
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
		<title>����</title>
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
		
		<!--      �û���Ϣ����¼��ע��      -->		
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
		
		<!--              ����              -->		
		<div class="two">
				<!-- &gt; : > -->
				&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>&gt;&gt;
				<B><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></B>
		</div>
		
		<!--     �ظ�������     -->		
		<div class="three">
			<button><a href="reply.jsp?boardId=<%=boardId %>&topicId=<%=topicId %>&title=<%=topic.getTitle() %>">�ظ�����</a></button>&nbsp;&nbsp;
			<button><a href="post.jsp?boardId=<%=boardId %>">������</a></button>
		</div>
		<br/>
		
		<!--     ��ҳ     -->		
		<div class="on">
				<table>
					<tr>
						<td align="left">
							<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId%>&topicId=<%=topicId %>">��һҳ</a>&nbsp;&nbsp;&nbsp;
						</td>
						<td align="left">
							<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId%>&topicId=<%=topicId %>">��һҳ</a>
						</td>
					</tr>
				</table>
		</div>
		
		<!--     ��ҳ����ı���     -->
		<div class="one">
			<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all">
				<tr bgcolor="#FF8C00">
					<td>��ҳ���⣺<%=topic.getTitle() %></td>
				</tr>
			</table>
		</div>
		
		<!--     ����    -->
		<form>
			<%
			if(p==1){
			%>
			<div class="four">
				<table width="100%" border="1" bordercolor="lightblue" cellpadding="0" cellspacing="0" rules="none">
					<tr>
						<th width="24%" align="center">
							<b><%=topicUser.getUserName() %></b><br/>
							<img src = "img/<%=topicUser.getHead() %>" width="55" height="65"/><br/>
							ע�᣺<%=topicUser.getRegTime()  %><br/>
						</th>
						<th>
							<H4 align="left"><%=topic.getTitle() %></H4>
							<div>
								<div align="left"><%=topic.getContent() %></div>
							</div>
							<div>
								<div align="left">
									����[<%=topic.getPublishTime() %>]&nbsp;����޸ģ�[<%=topic.getModifyTime() %>]
								</div>
							</div>
						</th>
					</tr>
				</table>
			</div>
			
			<!--    �ظ�        -->
			<%
			}
			
			for(int i=0;i<listReply.size();i++) {
					Reply reply = (Reply)listReply.get(i);                             //ѭ��ȡ�ûظ���Ϣ
					User replyUser = (User)userDao.findUser(reply.getUserId());        //ȡ�ûظ�������
			%>
			<div class="four">
				<table width="100%" border="1" bordercolor="lightblue" cellpadding="0" cellspacing="0" rules="none">
					<tr>
						<th width="24%" align="center">
							<b><%=replyUser.getUserName() %></b><br/>
							<img src = "img/<%=replyUser.getHead() %>" width="55" height="65"/><br/>
							ע�᣺<%=topicUser.getRegTime()  %><br/>
						</th>
						<th>
							<H4 align="left"><%=reply.getTitle() %></H4>
							<div>
								<div align="left"><%=reply.getContent() %></div>
							</div>
							<div>
								<div align="left">
									����[<%=reply.getPublishTime() %>]&nbsp;����޸ģ�[<%=topic.getModifyTime() %>]
									<a href="">[ɾ��]</a>
									<a href="">[�޸�]</a>
								</div>
							</div>
						</th>
					</tr>
				</table>
			</div>
			<% } %>
			<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId%>&topicId=<%=topicId %>">��һҳ</a>|<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId%>&topicId=<%=topicId %>">��һҳ</a><br>
		</form>	
		<!--     ����      -->
	</body>
</html>
