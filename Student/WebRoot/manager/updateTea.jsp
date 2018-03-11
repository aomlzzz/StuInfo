<%@ page language="java" import="java.util.*,java.sql.*,vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>更新教师信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
  </head>
  
  <body><div id="main" >
  		<div id="header"></div>
  		<jsp:include page="mainnav.jsp"></jsp:include>
  		<jsp:include page="tleft.jsp"></jsp:include>
		<div  id="right">
		  <p>当前位置：>>教师信息管理>><a href="manager/queryAllTea.jsp">返回</a></p>
		  <div id="stuinfo">
		  <form action="manager/updateTeaAction.jsp" method="post">
			  <table width="500px" rules="all" class="table_bg_white">
			  <tr><th colspan="2" align="left">修改教师信息</th></tr>
			   <jsp:useBean id="teadao" class="dao.TeacherDao"></jsp:useBean>
			   <jsp:useBean id="tea" class="vo.Teacher"></jsp:useBean>
			    <%
			    String teano=request.getParameter("teano");
				tea=teadao.getTeacherByTeano(teano);			
			    %>
			    <tr><td>职工号</td>
			    	<td align="left"><input type="text" disabled="disabled" value="<%=teano %>" name="teano" size="40"/>
			    	<input type="hidden" value="<%=teano %>" name="teano" size="40"/>
			    	</td>
			    </tr>
			    <tr><td>姓名</td><td align="left"><input type="text" value="<%=tea.getTeaname() %>" name="teaname" size="40"/></td></tr>
			    <tr><td>性别</td><td align="left"><input type="text" value="<%=tea.getTeasex() %>" name="teasex"  size="40"/></td></tr>
			    <tr><td>职称</td><td align="left"><input type="text" value="<%=tea.getTitle() %>" name="title" size="40"/></td></tr>		
			    <tr><td>密码</td><td align="left"><input type="password" value="<%=tea.getTeapwd() %>" name="teapwd" size="40"/></td></tr>
			    <% 
					teadao.closeConnection();
			    %>  
			    <tr><td colspan="2"><input type="submit" value="修改" /><input type="reset" value="取消" /></td></tr>  
    </table>
    </form> </div></div></div>
    </body>
</html>
