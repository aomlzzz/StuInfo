<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf8");
String path=request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>登陆页面</title> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/style1.css">
	<script type="text/javascript">
    	function validate(){
    		if(loginform.username.value==""){
    			alert("用户名不能为空!");
    			return false;
    		}
    		if(loginform.password.value==""){
    			alert("密码不能为空!");
    			return false;
    		}
    		loginform.submit();
    	
    	}
    </script>
  </head>
  <body>
	<div id="loginmain">
		<div id="login">
    		<form action="loginAction.jsp" name="loginform" method="post">
			    <table class="table_border_green">		    	
			    	<tr> <!-- 表格第一行 -->
			    		<td>用户名:</td>
			    		<td><input type="text" name="username" size="15"></td>
			    	</tr>	
			    	<tr> <!-- 表格第二行 -->
			    		<td>密码:</td>
			    		<td><input type="password" name="password" size="16"></td>
			    	</tr>		    	
			    	<tr> <!-- 表格第三行，提供一组单选纽控件，供用户选择管理员、教师、学生三种角色 -->
			    		<td colspan="2">
			    			<input type="radio" name="role" value="manager" checked>管理员</input>
			    			<input type="radio" name="role" value="teacher" >教师</input>
			    			<input type="radio" name="role" value="student" >学生</input>
			    		</td>		    		
			    	</tr>			    	
			    	<tr> <!-- 表格第四行 -->
			    		<td><input type="button"  value="登录" onClick="validate()"/></td>
			    		<td align="center"><input type="reset" name="cancle" value="取消"/></td>
			    	</tr>		    	
			    	<tr> <!-- 表格第五行 -->
			    		<td colspan="2" align="center" class="td_font_red">
			    			<% String msg=(String)request.getParameter("msg");
			    			if(msg!=null){out.println(msg);}
			    			%>			    			
			    		</td>		    		
			    	</tr> 
			    	<tr> <!-- 表格第六行 -->
			    		<td colspan="2" align="center" >
			    			<font size="1">*教师和学生使用工号或学号登录	</font>
			    		</td>		    		
			    	</tr>   	
			    </table>
  		</form></div></div>	</body></html>
