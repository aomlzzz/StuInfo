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
	<jsp:useBean id="sdao" class="dao.StudentDao"></jsp:useBean>
  	<jsp:useBean id="stu" class="vo.Student"></jsp:useBean>
    <jsp:setProperty property="*" name="stu"/>  
	<%
	stu.setStuname(new String(stu.getStuname().getBytes("ISO-8859-1"),"UTF-8"));
	stu.setStusex(new String(stu.getStusex().getBytes("ISO-8859-1"),"UTF-8"));	
	 %>
  	<%  int i=sdao.updateOneStudent(stu);
  		if(i!=0){%>
  			<script type="text/javascript">
			    		alert("修改成功！");
			    		window.location.href="manager/queryAllStu.jsp";
			</script>

    	}else{%>
	   		<script type="text/javascript">
			    		alert("修改失败！");
			    		window.location.href="manager/updateStu.jsp";
			</script>	   
	  <%  }%>
  
  </body>
</html>
