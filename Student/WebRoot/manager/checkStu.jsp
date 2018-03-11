<%@ page language="java" import="java.util.*,java.sql.*,vo.*,dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>查询所有学生</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf8">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
  </head>
  
  <body><div id="main" >
  		<div id="header"></div>
  		<jsp:include page="mainnav.jsp"></jsp:include>
  		<jsp:include page="left.jsp"></jsp:include>
  		
		<div  id="right">
		  <p>当前位置：>>学生信息管理>>按条件查询学生</p>
		  <div id="search">
		  <form action="manager/checkStu.jsp" method="post">
  			<table width="100%">
				
				<%
			    StudentDao sdao=new StudentDao();
			    ArrayList list=sdao.getAllStudents();
				%>	
					<tr>
						<th align="left" colspan="5">
							<b><font color="red">请输入查询统计条件：</font></b>
						</th>								
					</tr>
					<tr>
						<th align="left" >
							<b>学号</b>
						</th>
						<th align="left"  >
							<select name="stuno">
								<option value="">请选择学号</option>
								<%
								Student s=new Student();
								for(int i=0;i<list.size();i++){ 
									s=(Student)list.get(i);
									%>
									<option value="<%=s.getStuno()%>"><%=s.getStuno() %></option>
							
								<%} %>
							</select>
						</th>
						<th align="left"  >
							<b>姓名</b>
						</th>
						<th align="left" >
							<input name="stuname" type="text"/>
						</th>
						<th >
							<input type="submit" value="查询"/>
						</th>
					</tr>
				
					
					</table>
  		</form>
  		
  		</div>
		  <div id="stuinfo">
			  <table width="500px" rules="all" class="table_bg_white">
			  <caption>学生信息表</caption>
			  <tr><th>学号</th><th>姓名</th><th>性别</th><th>操作</th></tr>
			  	<jsp:useBean id="studao" class="dao.StudentDao"></jsp:useBean>
			   <jsp:useBean id="stu" class="vo.Student"></jsp:useBean>
			   <jsp:setProperty property="*" name="stu"/>
			    <%
			    String stuno=stu.getStuno();
			    String stuname=stu.getStuname();
			   if(stuname!=null){stuname=new String(stu.getStuname().getBytes("ISO-8859-1"),"UTF-8");}
			    String stusex=null;
				ArrayList al=studao.getAllStudentByMostCon(stuno, stuname);
				for(int i=0;i<al.size();i++){
			     	stu=(Student)al.get(i);
			     	stuno=stu.getStuno();
			     	stuname=stu.getStuname();
			     	stusex=stu.getStusex();
			    %>
			    <tr>
			    <td><%=stuno %></td>
			    <td><%=stuname %></td>
			    <td><%=stusex %></td>
			    <td><a href="manager/delStuAction.jsp?stuno=<%=stuno %>">删除</a>/<a href="manager/updateStu.jsp?stuno=<%=stuno %>">修改</a></td>
			    </tr>
			    <% }
			    %>    
    </table></div>
</html>
