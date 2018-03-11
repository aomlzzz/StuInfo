<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <link href="<%=basePath %>css/style1.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  	
    <div id="menu">
    	<div id="mleft"></div> <!-- mleft结束 -->
    	<div id="mright">
    	<ul><li>教师信息管理</li>
    		<li>
    			<ul>
    				<li>>><a href="manager/queryAllTea.jsp">教师信息查询</a></li>
    				<li>>><a href="manager/addTea.jsp">教师信息添加</a></li>
    			</ul>
    		</li>
    		
    	</ul>
		</div> <!-- mright结束 -->
    </div> <!-- menu结束 -->
  </body>
</html>
