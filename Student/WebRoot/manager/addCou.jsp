<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程信息添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style1.css">
	

  </head>
  
  <body>
 
	  <div id="main" >
  		<div id="header"></div>
  		 <jsp:include page="mainnav.jsp"></jsp:include>
    	<jsp:include page="cleft.jsp"></jsp:include>
		   <div  id="right">
			<p>当前位置：>>课程信息管理>>添加课程</p>
		    <div id="addstu">
		  <form action="manager/validate.jsp" method="post">
		  	<input type="hidden" name="u" value="cou"/>
		  	<table width="250px" >
		  		<tr>
		  			<td>课程号：</td>
		  			<td><input type="text" name="courseno" /></td>
		  		</tr>
		  		<tr>
		  			<td>课程名：</td>
		  			<td><input type="text" name="coursename" /></td>
		  		</tr>
		  		<tr>
		  			<td>学分：</td>
		  			<td><input type="text" name="credit" /></td>
		  		</tr>
		  		<tr>
		  			<td>任课老师编号：</td>
		  			<td><input type="text" name="teano" /></td>
		  		</tr>
		  		<tr>
		  			<td><input type="submit" value="添加"/></td>
		  			<td><input type="reset" value="取消" /></td>
		  		</tr>
		  	</table>
		  	</form>
		  </div>
		</div>
  </div>
  </body>
</html>
