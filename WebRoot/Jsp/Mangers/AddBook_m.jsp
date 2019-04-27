<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddBook_m.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">


  </head>
  
  <body>
  <center>
    <form action="Jsp/Book/AddBook.jsp"  method="get"  class="am-form-inline" role="form" >
    <fieldset>
    <legend>图书信息:</legend>
    <!-- <div class="am-checkbox">
    <label>
      <input type="checkbox"> 图书编号
    </label>
  </div>-->
    
  <div class="am-form-group">
    图书编号：<input type="text" class="am-form-field" placeholder="图书编号"  name="bno">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    书 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" class="am-form-field" placeholder="书名"  name="bname">
  </div>
<br/>
<br/>
<div class="am-form-group">
    作 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：<input type="text" class="am-form-field" placeholder="作者"  name="bauthor">
  </div>
<br/>
<br/>
<div class="am-form-group">
    出 &nbsp;版 &nbsp;社：<input type="text" class="am-form-field" placeholder="出版社"   name="bpublication">
  </div>
<br/>
<br/>
<div class="am-form-group">
    出版日期：<input type="date" class="am-form-field" placeholder="出版日期"  name="bdate">
  </div>
<br/>
<br/>
<div class="am-form-group">
    价 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<input type="text" class="am-form-field" placeholder="价格"  name="bprice">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    馆 &nbsp;藏 &nbsp;地：<input type="text" class="am-form-field" placeholder="馆藏地"  name="baddress">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    副本数量：<input type="text" class="am-form-field" placeholder="副本数量"  name="bcopy">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    可借数量：<input type="text" class="am-form-field" placeholder="可借数量"  name="bcount">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    图书分类号：<input type="text" class="am-form-field" placeholder="图书分类号"  name="cno">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    <button class="but" type="submit">确定</button>  
  </div>


  <fieldset>
</form>
</center>
  </body>
</html>
