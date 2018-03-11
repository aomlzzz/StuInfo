<%@ page language="java" import="java.util.*,vo.*,dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkScore.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="main" >
  		<div id="header"></div>
  		<jsp:include page="mainnav.jsp"></jsp:include>
  		<jsp:include page="left1.jsp"></jsp:include>
  		
		<div  id="right">
		  <p>当前位置：>>成绩信息维护>>查询成绩</p>
		  <div id="search">
		  <form action="teacher/checkScore.jsp" method="post">
  			<table width="100%">
				
				<%String courseno=request.getParameter("courseno");
				Teacher tea=(Teacher)session.getAttribute("tea");
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
									if(courseno.equals(cou.getCourseno())){
									%>
									<option value="<%=cou.getCourseno()%>" selected><%=cou.getCourseno()%><%=cou.getCoursename()%></option>
							
								<%}else{ %>
								
									<option value="<%=cou.getCourseno()%>" ><%=cou.getCourseno()%><%=cou.getCoursename()%></option>
								
								<%} }}%>
							</select>
							<input type="submit" value="查询"/>
						</th>

					</tr>
				
					
					</table>
  		</form>
  		
  		</div>
  		
  		<div id="scoreinfo">
			  <table width="500px" rules="all" class="table_bg_white">
			  <caption>成绩查询结果</caption>
			  <tr><th>学号</th><th>姓名</th><th>成绩</th></tr>
			   <jsp:useBean id="scodao" class="dao.ScoreDao"></jsp:useBean>  <%--产生业务操作对象scodao --%>
			   <jsp:useBean id="sco" class="vo.Score"></jsp:useBean>		<%--产生成绩对象sco --%>
			  
			    <% 
				
				ArrayList al=(ArrayList)scodao.getScoreByCourseno(courseno);
			    String stuno=null;
			    String stuname=null;
			    float score=0;
				for(int i=0;i<al.size();i++){
			     	sco=(Score)al.get(i);
			     	stuno=sco.getStuno();
			     	stuname=sco.getStuname();
			     	score=sco.getScore();
			    %>
			    <tr>
			    <td><%=stuno %></td>
			    <td><%=stuname %></td>
			    <td><%=score %></td>
			   
			    </tr>		   
			    <% }
			    scodao.closeConnection();%>  
  		
  		</div>
  		</div>
  </body>
</html>
