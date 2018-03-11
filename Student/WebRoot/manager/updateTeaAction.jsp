<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addStu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="style1.css">
	

  </head>
  
  <body>
	<jsp:useBean id="tdao" class="dao.TeacherDao"></jsp:useBean>
  	<jsp:useBean id="tea" class="vo.Teacher"></jsp:useBean>
    <jsp:setProperty property="*" name="tea"/>  
	<%
	tea.setTeaname(new String(tea.getTeaname().getBytes("ISO-8859-1"),"UTF-8"));
	tea.setTeasex(new String(tea.getTeasex().getBytes("ISO-8859-1"),"UTF-8"));	
	tea.setTitle(new String(tea.getTitle().getBytes("ISO-8859-1"), "UTF-8"));
	 %>
  	<%  int i=tdao.updateOneTeacher(tea);
  		if(i!=0){%>
  			<script type="text/javascript">
			    		alert("修改成功！");
			    		window.location.href="manager/queryAllTea.jsp";
			</script>

    	<%}else{%>
	   		<script type="text/javascript">
			    		alert("修改失败！");
			    		window.location.href="manager/updateTea.jsp";
			</script>	   
	  <%  }%>
  
  </body>
</html>
