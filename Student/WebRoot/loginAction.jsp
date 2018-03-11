<%@ page language="java" import="java.util.*,vo.*,dao.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'loginAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <jsp:useBean id="man" class="vo.Manager"></jsp:useBean>
    <jsp:useBean id="tea" class="vo.Teacher"></jsp:useBean>
    <jsp:useBean id="mandao" class="dao.ManagerDao"></jsp:useBean>
    <jsp:useBean id="teadao" class="dao.TeacherDao"></jsp:useBean>
    <%String username=request.getParameter("username");
    String password=request.getParameter("password"); 
    String role=request.getParameter("role");
     if(role!=null&&role.equals("manager")){
    	man=mandao.getManagerByManname(username);
    	if(man!=null&&password.equals(man.getManpwd())){
    		//request.setAttribute("man",man);
    		session.setAttribute("man",man);
    	%>
    		<%-- 使用forward动作跳转，当前页面和目标页面共享request对象参数--%>
  			<jsp:forward page="manager/manEntry.jsp"></jsp:forward>
  			
	   <%  	}else{%>
	   		<%-- 使用forward动作跳转，同时传递参数msg--%>
	   			<jsp:forward page="login.jsp">
	   				<jsp:param name="msg" value="用户名或密码错误！"/>
	   			</jsp:forward>  
	  	<%  }
    }
    
    if(role!=null&&role.equals("teacher")){
    	tea=teadao.getTeacherByTname(username);
    	if(tea!=null&&password.equals(tea.getTeapwd())){
    		
    		session.setAttribute("tea",tea);
    	%>
    		<%-- 使用forward动作跳转，当前页面和目标页面共享request对象参数--%>
  			<jsp:forward page="teacher/teaEntry.jsp"></jsp:forward>
  			
	<% }else{%>
	<%-- 使用forward动作跳转，同时传递参数msg--%>
	   			<jsp:forward page="login.jsp">
	   				<jsp:param name="msg" value="用户名或密码错误！"/>
	   			</jsp:forward>  
	  	<%  }
	}
	  if(role!=null&&role.equals("student")){
	%>
	<jsp:forward page="login.jsp">
	   				<jsp:param name="msg" value="学生账户暂不支持登陆！"/>
	   			</jsp:forward> 
   <%} %>
  </body>
</html>
