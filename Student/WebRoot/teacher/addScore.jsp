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
  		<jsp:include page="left1.jsp"></jsp:include>
  		
		<div  id="right">
		  <p>当前位置：>>成绩信息维护>>成绩录入</p>
		  <div id="search">
		  <form action="teacher/addScore2.jsp" method="post">
  			<table width="100%">
				
				<%Teacher tea=(Teacher)session.getAttribute("tea");
				if(tea!=null){String teano=tea.getTeano();
				CourseDao cdao=new CourseDao();
			    ArrayList list=cdao.getCourseByTeano(teano);
			   
				%>	
					
					<tr>
						<th align="left" >
							<b>任课课程</b>
						</th>
						<th align="left"  >
							<select name="courseno">
								<option value="">请选择课程</option>
								<%
								Course cou=new Course();
								for(int i=0;i<list.size();i++){ 
									cou=(Course)list.get(i);
									%>
									<option value="<%=cou.getCourseno()%>"><%=cou.getCourseno()%><%=cou.getCoursename()%></option>
							
								<%} }%>
							</select>
							<input type="submit" value="查询"/>
						</th>

					</tr>
				
					
					</table>
  		</form>
  		
  		</div>
  		</div>
  		</div>
  		</body>

    
    

</html>
