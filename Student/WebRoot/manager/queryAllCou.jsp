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
    <title>查询所有课程</title>
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
  		<jsp:include page="cleft.jsp"></jsp:include>
  		
		<div  id="right">
		  <p>当前位置：>>课程信息管理>>查询所有课程</p>
		  <div id="stuinfo">
			  <table width="500px" rules="all" class="table_bg_white">
			  <caption>课程信息表</caption>
			  <tr><th>课程号</th><th>课程名</th><th>学分</th><th>任课老师编号</th><th>操作</th></tr>
			   <jsp:useBean id="coudao" class="dao.CourseDao"></jsp:useBean>  <%--产生业务操作对象studao --%>
			   <jsp:useBean id="cou" class="vo.Course"></jsp:useBean>		<%--产生学生对象stu --%>
			    <jsp:useBean id="pa" class="common.Page"></jsp:useBean>     <%--产生分页对象pa --%>
			    <% 
			    int curPage=1;
			    String p=request.getParameter("curPage");        //获取用户请求页码
			    if(p!=null&&!p.equals("")){
			    	curPage=Integer.parseInt(p);
			    } 
			    Map map=coudao.findAllCourse(curPage);
				ArrayList al=(ArrayList)map.get("list");
			    String couno=null;
			    String couname=null;
			    Float credit;
			    String teano=null;
				pa=(Page)map.get("pa");
				int pageCount=pa.getPageCount();
				for(int i=0;i<al.size();i++){
			     	cou=(Course)al.get(i);
			     	couno=cou.getCourseno();
			     	couname=cou.getCoursename();
			     	credit=cou.getCredit();
			     	teano=cou.getTeano();
			    %>
			    <tr>
			    <td><%=couno %></td>
			    <td><%=couname %></td>
			    <td><%=credit %></td>
			    <td><%=teano %></td>
			    <td><a href="manager/delCouAction.jsp?couno=<%=couno %>">删除</a>/<a href="manager/updateCou.jsp?couno=<%=couno %>">修改</a></td>
			    </tr>		   
			    <% }
			    coudao.closeConnection();%>  
			     <tr>
					<td align="center" colspan="12">
					<%if(pageCount!=0&&curPage!=1){%>
								<a href="manager/queryAllCou.jsp?curPage=1"/>首页</a>
								<a href="manager/queryAllCou.jsp?curPage=<%=curPage-1 %>"/>前一页</a>
					<%}%>
					<%if(pageCount==0||curPage==1){%>
								首页	 前一页
					<%}%>
					<%if(pageCount!=0&&curPage!=pageCount){%>
								<a href="manager/queryAllCou.jsp?curPage=<%=curPage+1 %>">下一页</a>
								<a href="manager/queryAllCou.jsp?curPage=<%=pageCount%>"/>尾页</a>
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
