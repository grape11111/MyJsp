<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">  
    <title>图书管理系统</title>  
    <link rel="stylesheet" type="text/css" href="Login.css"/>  
</head>  
<body>  
    <div id="login">  
        <h1>图书管理系统</h1>  
        <form action="LoginCh.jsp"  method="post">  
            <input class="input" type="text" required="required" placeholder="姓名/账号" name="name"></input>  
            <input class="input" type="password" required="required" placeholder="密码" name="pwd"></input>  
            <input type="radio" name="role" value="users" >用户 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="role" value="managers">管理员
            <button class="but" type="submit">登录</button>  
        </form>  
    </div>  
</body>  
</html>  
