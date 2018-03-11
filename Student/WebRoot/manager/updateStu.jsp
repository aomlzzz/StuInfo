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
    <title>更新学生信息</title>
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
  		<jsp:include page="left.jsp"></jsp:include>
		<div  id="right">
		  <p>当前位置：>>学生信息管理>><a href="manager/queryAllStu.jsp">返回</a></p>
		  <div id="stuinfo">
		  <form action="manager/updateStuAction.jsp" method="post">
			  <table width="500px" rules="all" class="table_bg_white">
			  <tr><th colspan="2" align="left">修改学生信息</th></tr>
			   <jsp:useBean id="studao" class="dao.StudentDao"></jsp:useBean>
			   <jsp:useBean id="stu" class="vo.Student"></jsp:useBean>
			    <%
			    String stuno=request.getParameter("stuno");
			    String stuname=null;
			    String stusex=null;
				stu=studao.getStudentByStuno(stuno);			
			     stuname=stu.getStuname();
			     stusex=stu.getStusex();
			    %>
			    <tr><td>学号</td>
			    	<td align="left"><input type="text" disabled="disabled" value="<%=stuno %>" name="stuno" size="40"/>
			    	<input type="hidden" value="<%=stuno %>" name="stuno" size="40"/>
			    	</td>
			    </tr>
			    <tr><td>姓名</td><td align="left"><input type="text" value="<%=stuname %>" name="stuname" size="40"/></td></tr>
			    <tr><td>性别</td><td align="left"><input type="text" value="<%=stusex %>" name="stusex"  size="40"/></td></tr>		
			    <% 
					studao.closeConnection();
			    %>  
			    <tr><td colspan="2"><input type="submit" value="修改" /><input type="reset" value="取消" /></td></tr>  
    </table>
    </form> </div></div></div>
    </body>
</html>
