<%  int x=5; %>
<%! int x=7;  %>
<%!
	int getX(){
		return x;
	}
%>
<% out.print("X1="+x); %>
<% out.print("X2="+getX());  %>