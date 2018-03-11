<%@ page language="java" import="java.util.*,java.sql.*,vo.*,common.*,dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>查询所有教师</title>
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
  		<jsp:include page="tleft.jsp"></jsp:include>
  		
		<div  id="right">
		  <p>当前位置：>>教师信息管理>>查询所有教师</p>
		  <%-- <div id="search">
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
									<option value="<%=s.getStuno()%>"><%=s.getStuno()%></option>
							
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
  		
  		</div> --%>
		  <div id="stuinfo">
			  <table width="500px" rules="all" class="table_bg_white">
			  <caption>教师信息表</caption>
			  <tr><th>职工号</th><th>姓名</th><th>性别</th><th>职称</th><th>操作</th></tr>
			   <jsp:useBean id="teadao" class="dao.TeacherDao"></jsp:useBean>  <%--产生业务操作对象studao --%>
			   <jsp:useBean id="tea" class="vo.Teacher"></jsp:useBean>		<%--产生学生对象stu --%>
			    <jsp:useBean id="pa" class="common.Page"></jsp:useBean>     <%--产生分页对象pa --%>
			    <% 
			    int curPage=1;
			    String p=request.getParameter("curPage");        //获取用户请求页码
			    if(p!=null&&!p.equals("")){
			    	curPage=Integer.parseInt(p);
			    } 
			    Map map=teadao.findAllTeacher(curPage);
				ArrayList al=(ArrayList)map.get("list");
			    String teano=null;
			    String teaname=null;
			    String teasex=null;
			    String teatitle=null;
				pa=(Page)map.get("pa");
				int pageCount=pa.getPageCount();
				for(int i=0;i<al.size();i++){
			     	tea=(Teacher)al.get(i);
			     	teano=tea.getTeano();
			     	teaname=tea.getTeaname();
			     	teasex=tea.getTeasex();
			     	teatitle=tea.getTitle();
			    %>
			    <tr>
			    <td><%=teano %></td>
			    <td><%=teaname %></td>
			    <td><%=teasex %></td>
			    <td><%=teatitle %></td>
			    <td><a href="manager/delTeaAction.jsp?teano=<%=teano %>">删除</a>/<a href="manager/updateTea.jsp?teano=<%=teano %>">修改</a></td>
			    </tr>		   
			    <% }
			    teadao.closeConnection();%>  
			     <tr>
					<td align="center" colspan="12">
					<%if(pageCount!=0&&curPage!=1){%>
								<a href="manager/queryAllTea.jsp?curPage=1"/>首页</a>
								<a href="manager/queryAllTea.jsp?curPage=<%=curPage-1 %>"/>前一页</a>
					<%}%>
					<%if(pageCount==0||curPage==1){%>
								首页	 前一页
					<%}%>
					<%if(pageCount!=0&&curPage!=pageCount){%>
								<a href="manager/queryAllTea.jsp?curPage=<%=curPage+1 %>">下一页</a>
								<a href="manager/queryAllTea.jsp?curPage=<%=pageCount%>"/>尾页</a>
					<%}%>
					<%if(pageCount==0||curPage==pageCount){%>
								下一页 尾页
					<%}%>	
							&nbsp;
							第<%=curPage %>页/共<%=pageCount%>页
							&nbsp;
				    </td>
				</tr>  
    		</table>
    		</div>

    
    

</html>
