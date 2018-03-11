<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程信息添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="style1.css">
	

  </head>
  
  <body>
	<jsp:useBean id="cdao" class="dao.CourseDao"></jsp:useBean>
  	<jsp:useBean id="cou" class="vo.Course"></jsp:useBean>
    <jsp:setProperty property="*" name="cou"/>  
	<%
	cou.setCoursename(new String(cou.getCoursename().getBytes("ISO-8859-1"),"UTF-8"));
	 %>
      
  	<%  int i=cdao.insertOneCourse(cou);
  		if(i!=0){%>
  			<script type="text/javascript">
			    		alert("添加success！");
			    		window.location.href="manager/queryAllCou.jsp";
			</script>

    	<%}else{ %>
	   		<script type="text/javascript">
			    		alert("添加失败！");
			    		window.location.href="manager/addCou.jsp";
			</script>	   
	  <%  }%>
  
  </body>
</html>
