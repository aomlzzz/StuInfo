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
    <title>更新课程信息</title>
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
  		<jsp:include page="cleft.jsp"></jsp:include>
		<div  id="right">
		  <p>当前位置：>>课程信息管理>><a href="manager/queryAllCou.jsp">返回</a></p>
		  <div id="stuinfo">
		  <form action="manager/updateCouAction.jsp" method="post">
			  <table width="500px" rules="all" class="table_bg_white">
			  <tr><th colspan="2" align="left">修改课程信息</th></tr>
			   <jsp:useBean id="coudao" class="dao.CourseDao"></jsp:useBean>
			   <jsp:useBean id="cou" class="vo.Course"></jsp:useBean>
			    <%
			    String couno=request.getParameter("couno");
				cou=coudao.getCourseByCouno(couno);	
			    %>
			    <tr><td>课程号</td>
			    	<td align="left"><input type="text" disabled="disabled" value="<%=cou.getCourseno() %>" name="courseno" size="40"/>
			    	<input type="hidden" value="<%=cou.getCourseno() %>" name="courseno" size="40"/>
			    	</td>
			    </tr>
			    <tr><td>课程名</td><td align="left"><input type="text" value="<%=cou.getCoursename() %>" name="coursename" size="40"/></td></tr>
			    <tr><td>学分</td><td align="left"><input type="text" value="<%=cou.getCredit() %>" name="credit"  size="40"/></td></tr>
			    <tr><td>任课老师编号</td><td align="left"><input type="text" value="<%=cou.getTeano() %>" name="teano" size="40"/></td></tr>		
			    <% 
					coudao.closeConnection();
			    %>  
			    <tr><td colspan="2"><input type="submit" value="修改" /><input type="reset" value="取消" /></td></tr>  
    </table>
    </form> </div></div></div>
    </body>
</html>
