<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除学生</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf8">
	<link rel="stylesheet" type="text/css" href="style1.css">
	

  </head>
  
  <body>
	  <jsp:useBean id="tdao" class="dao.TeacherDao"></jsp:useBean>
  <jsp:useBean id="tea" class="vo.Teacher"></jsp:useBean>
    <%String teano=request.getParameter("teano");
    if(teano!=null&&!teano.equals("")){
    	int i=tdao.deleteTeacherByTeano(teano);
    	if(i!=0){
    		
     %>
     	<script type="text/javascript">
     		alert("删除成功!");
     		window.location.href="manager/queryAllTea.jsp";
     	
     	</script>
     <%}else{%>
     	<script type="text/javascript">
     		alert("删除失败!");
     		window.location.href="manager/queryAllTea.jsp";
     	
     	</script>
     <%} }%>
  </body>
</html>
