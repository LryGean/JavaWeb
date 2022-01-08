<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<HTML>	
	<BODY>
   		<% int x=5;  %>
		<%! private int m(int a){ return a+1;} %>
 		<% x=3;%>
  		x=<%=x%>,<%=m(x)%>
   </BODY>
</HTML>
