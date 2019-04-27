<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Feilong_登录成功</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
* {
    box-sizing: border-box;
}
body {
    margin: 0;
}
.header {
    background-color: #2196F3;
    color: white;
    text-align: center;
    padding: 15px;
}

.topmenu {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #777;
}
.topmenu li {
    float: center;
    display: inline-block;
}
.topmenu li h2 {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

.column {
    float: left;
    padding: 15px;
}
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}
.sidemenu {
    width: 25%;
}
.content {
    width: 75%;
}
.sidemenu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
.sidemenu li a {
    margin-bottom: 4px;
    display: block;
    padding: 8px;
    background-color: #eee;
    text-decoration: none;
    color: #666;
}
.sidemenu li a:hover {
    background-color: #555;
    color: white;
}
.sidemenu li a.active {
    background-color: #008CBA;
    color: white;
}
</style>
  </head>
  <body>
    <center>
    <ul class="topmenu">
  <li style="color:white;float:center"><h2>图书管理系统</h2></li>
  <li style="color:white;float:left"><%
     String name = new String(request.getParameter("username").getBytes("8859_1"));
     out.println("欢迎你:   " + name);
    %></li>
</ul>

<div class="clearfix">
  <div class="column sidemenu">
    <ul>
      <li><a href="success.jsp"  target="_self" class="active">首页</a></li>
      <li><a href="#abcd" >用户管理</a></li>
      <li><a href="#food">图书管理</a></li>
      <li><a href="#abcd" >借阅管理</a></li>
    </ul>
  </div>

  <div class="column content">
    <div class="header">
      <h1>The City</h1>
    </div>
    <h1>Chania</h1>
    <p>Chania is the capital of the Chania region on the island of Crete. The city can be divided in two parts, the old town and the modern city.</p>
    <p>You will learn more about responsive web pages in a later chapter.</p>
   <a href="index.jsp">退出登陆</a>
  </div>
</div>

    
    </center>
  </body>
</html>
