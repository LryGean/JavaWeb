<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	IBoardDao boardDao = new BoardDaoImpl();
	Map mapBoard = boardDao.findBoard();
	ITopicDao topicDao = new TopicDaoImpl();
	IUserDao userDao = new UserDaoImpl();
%>

<!DOCTYPE html PUBLIC " - //W3C//DTD XHTML 1.0 Transitional//EN" "http:www.w3.org/TR/xhtmll/DTD/xhtmll - transitional.dtd">
<htmlxmlns = "http://www.w3.org/1999/xhtml">
	<head>
		<title>my��̳</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			h1{
				text-align: center;
				position: absolute;   /*����λ��*/
				left:50%;
				color: darkorange;
			}
			img{
				position: absolute;   /*����λ��*/
			    left:50%;
			    margin-left: -181px;
				}
			table{
				border-collapse: collapse;
			}
			table th{
				font-family: �����п�;
				font-size: 32px;
			}
			table td,th{
				border: 1px solid lightblue;
			}
			table{
				background-color: #FFFFFF ;
			}
		</style>
	</head>
	<body>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		<div width="100%" height="1024px">&nbsp;</div>
		<div class="one">
			<!--cellspacing:�����뵥Ԫ��߽�֮��ľ��룬cellspacing�����Ʊ���е�����Ԫ��֮��ľ���-->
			<!--frame:���Ʊ������Χ�������߿�Ŀɼ��ԣ�rules���Ʊ���ڲ��߿�Ŀɼ���-->
			<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all" >
				<tr bgcolor="#FF8C00">
					<%
						if(session.getAttribute("user")==null){
					%>
					<td align="center" width="8px">����δ</td>
					<td align="center" width="6px"><a href="login.jsp" target="_blank">��¼</a></td>
					<td align="center" width="6px"><a href="reg.jsp" target="_blank">ע��</a></td>
					<%
						}else{
							User loginUser = (User)session.getAttribute("user");
					%>
					 	���ã�<%=loginUser.getUserName() %>|<a href="doLogout.jsp">ע��</a>
					<%
					 	}
					%>
					<td width="256px"></td>
				</tr>
			</table>
		</div>
		<div id="apDiv1">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<th colspan="2" align="left">��̳</th>
					<th width="64px" align="center">����</th>
					<th width="1024px" colspan="4" align="center">��󷢱�</th>
				</tr>
				<!--����� ��ѭ�����������-->
				<%
					List listMainBoard = (List)mapBoard.get(0);
					for(int i=0;i<listMainBoard.size();i++){
						Board mainBoard = ((Board)listMainBoard.get(i));    //ѭ���������
				%>
					<tr class="tr3">
						<td colspan="4"><%= mainBoard.getBoardName() %></td>
					</tr>
					<!--�Ӱ��-->
					<% List listSonBoard = (List)mapBoard.get(new Integer(mainBoard.getBoardId()));
						for(int j=0;j<listSonBoard.size();j++){
							Board sonBoard = (Board)listSonBoard.get(j);
							Topic topic = new Topic();
							User user = new User();
							int boardId = sonBoard.getBoardId();
							List listTopic = topicDao.findListTopic(1,boardId);
							
							if(listTopic != null && listTopic.size()>0){
								topic = (Topic)listTopic.get(0);
								user = userDao.findUser(topic.getUserId());
							}
					%>
					<TR class="tr3">
						<TD width = "5%">&nbsp;</TD>
						<TH align="left">
							<img src="img/board1.gif" width="95" height="55">
							<A href="list.jsp?page=1&boardId=<%=sonBoard.getBoardId() %>"><%=sonBoard.getBoardName() %></A>
						</TH>
						<TD align="center"><%=topicDao.findCountTopic(sonBoard.getBoardId()) %></TD>
						<TH>
							<SPAN>
								<A href="detail.jsp"><%=topic.getTitle() %></A>
							</SPAN>
							<BR/>
							<SPAN><%= user.getUserName() %></SPAN>
							<SPAN class="gray">[<%= topic.getPublishTime() %>]</SPAN>
						</TH>
					</TR>
						<!-- �Ӱ����� -->
						<% } %>
					<!-- �������� -->
					<%
					}
					%>
			</table>
		</div>
	</body>
</html>
