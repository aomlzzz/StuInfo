<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'validate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <%if(request.getParameter("u").equals("stu")) {%>
  <jsp:useBean id="sdao" class="dao.StudentDao"></jsp:useBean>
  <jsp:useBean id="stu" class="vo.Student"></jsp:useBean>
    <%
    String stuno=request.getParameter("stuno");
    if(stuno!=null&&!stuno.equals("")){
    	stu=sdao.getStudentByStuno(stuno);
    	if(stu==null){
    		
     %>
     	<jsp:forward page="addStuAction.jsp"></jsp:forward>
     <%}else{%>
     	<script type="text/javascript">
     		alert("student is already existing!");
     		window.location.href="manager/addStu.jsp";
     	
     	</script>
     <%} } } else if(request.getParameter("u").equals("tea")){%>
      <jsp:useBean id="tdao" class="dao.TeacherDao"></jsp:useBean>
  <jsp:useBean id="tea" class="vo.Teacher"></jsp:useBean>
     <%
    String teano=request.getParameter("teano");
    if(teano!=null&&!teano.equals("")){
    	tea=tdao.getTeacherByTeano(teano);
    	if(tea==null){
    		
     %>
     	<jsp:forward page="addTeaAction.jsp"></jsp:forward>
     <%}else{%>
     	<script type="text/javascript">
     		alert("teacher is already existing!");
     		window.location.href="manager/addTea.jsp";
     	
     	</script>
     <%} } } else{ %>
     <jsp:useBean id="cdao" class="dao.CourseDao"></jsp:useBean>
  <jsp:useBean id="cou" class="vo.Course"></jsp:useBean>
    <%
    String couno=request.getParameter("courseno");
    if(couno!=null&&!couno.equals("")){
    	cou=cdao.getCourseByCouno(couno);
    	if(cou==null){	
     %>
     	<jsp:forward page="addCouAction.jsp"></jsp:forward>
     <%}else{%>
     	<script type="text/javascript">
     		alert("course is already existing!");
     		window.location.href="manager/addCou.jsp";
     	
     	</script>
     <%} } } %>
  </body>
</html>
