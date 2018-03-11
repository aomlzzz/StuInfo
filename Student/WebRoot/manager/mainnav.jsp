<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addStu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/style1.css">
	

  </head>
  
  <body>
   		<div id="mainnav">
	  		<table width="766px" cellpadding="0px" cellspacing="0px">
	  			<tr>
	  			 <td width="30%">   <!-- 增加一列 -->
						  <%Manager man=(Manager)session.getAttribute("man");
						  if(man!=null){
						  out.println("管理员["+man.getManname()+"],欢迎你！");
						  }else{%>
						  <script type="text/javascript">
						  alert("请先登录！");
						  window.location.href="login.jsp";
						  </script>
						  <% } %>
					  </td>
	  				<td width="15%" class="td_border"><a href="manager/queryAllStu.jsp">学生信息维护</a></td>
	  				<td width="15%" class="td_border"><a href="manager/queryAllTea.jsp">教师信息维护</a></td>
	  				<td width="15%" class="td_border"><a href="manager/queryAllCou.jsp">课程信息维护</a></td>
	  				<td width="15%" ><a href="logout.jsp">退出</a></td>
	  			</tr>
	  		</table>
	  
	  </div>
  </body>
</html>
