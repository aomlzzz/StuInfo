<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addStu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="style1.css">
	

  </head>
  
  <body>
	<jsp:useBean id="scodao" class="dao.ScoreDao"></jsp:useBean>
  	<jsp:useBean id="sco" class="vo.Score"></jsp:useBean>
    
	<%
	String[] stuno=request.getParameterValues("stuno");
	String courseno=request.getParameter("courseno");
	String[] score=request.getParameterValues("score");
	if(stuno!=null&&courseno!=null&&score!=null){
		int i=scodao.addScores(courseno, stuno, score);
	 %>
      
  	<%  
  		if(i!=0){%>
  			<script type="text/javascript">
			    		alert("成绩录入成功！");
			    		window.location.href="queryScore.jsp";
			</script>

    	<% }else{%>
	   		<script type="text/javascript">
			    		alert("成绩录入失败！");
			    		window.location.href="queryScore.jsp";
			</script>	   
	  <%  }}%>
  
  </body>
</html>
