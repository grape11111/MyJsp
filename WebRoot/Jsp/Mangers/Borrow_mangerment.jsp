<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Borrow_mangerment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">


  </head>
  
  <body>
  
  <center>
  <div class="am-form-group">
   <a href='Jsp/Mangers/BorrowMessage.jsp'><button class='btn btn-primary'>查询所有借阅信息</button></a>
  </div>
    <form action="Jsp/Mangers/AlterBorrow.jsp"  method="get"  class="am-form-inline" role="form" >
    <fieldset>
    <legend>借阅信息登记</legend>
      
  <div class="am-form-group">
   &nbsp; 索&nbsp;书&nbsp;号：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="am-form-field" placeholder="索书号"  name="cbno">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    借阅者卡号：<input type="text" class="am-form-field" placeholder="借阅者卡号"  name="uno">
  </div>

<br/>
<br/>
<div class="am-form-group">
    借阅日期：&nbsp;<input type="date" class="am-form-field" placeholder="借阅日期"  name="borrowdate">
  </div>
<br/>
<br/>

  <div class="am-form-group">
    <button  class='btn btn-primary' type="submit">确定</button>  
  </div>
  <br/>
  <br/>

  <fieldset>
</form>
</center>
  </body>
</html>
