<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AlterBook_m.jsp' starting page</title>
    
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
 
  <%
             String bno = new String((request.getParameter("bno")).getBytes("ISO-8859-1"),"UTF-8"); 
             String mno= (String)session.getAttribute("Mno");
             
             String Bno = ""; 
  			 String Bname = ""; 
  			 String Bauthor = ""; 
  			 String Bpublication = ""; 
  			 String Bdate = "";
  			 String Bprice = ""; 
  			 String Baddress = ""; 
  			 int Bcopy = 0; 
  			 int Bcount = 0; 
  			 String Cno = ""; 

  			 String driverClass ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
             String url= "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Library";
            try{
             Class.forName(driverClass);//加载驱动 
             }catch (ClassNotFoundException e) {
             e.printStackTrace();
             }
           
             try{
            String name = "Grape";
            String password = "2549107521";
            Connection conn = DriverManager.getConnection(url,name,password);//得到连接               
            String sql="select * from Book WHERE Bno='"+bno+"';" ;
            Statement stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery(sql);
if(rs.next()){
              Bno = rs.getString(1); 
  			  /*Bname = rs.getString(2); 
  			  Bauthor = rs.getString(3); 
  			  Bpublication = rs.getString(4); 
  			  Bdate = rs.getString(5);
  			  Bprice = rs.getString(6); 
  			  Baddress = rs.getString(7); 
  			  Bcopy = rs.getInt(8); 
  			  Bcount = rs.getInt(9); 
  			  Cno = rs.getString(10);  */
%>
           
   
  
  <center>
    <form action="Jsp/Book/AlterBook.jsp"  method="get"  class="am-form-inline" role="form" >
    <fieldset>
    <legend>图书信息:</legend>
    <!-- <div class="am-checkbox">
    <label>
      <input type="checkbox"> 图书编号
    </label>
  </div>-->
  
  <div class="am-form-group">
    图书编号：<input type="text" class="am-form-field" value="<%=rs.getString(1) %>" name="bno"  disabled>
  </div>
    <br/>
    <br/>
  <div class="am-form-group">
    书 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" class="am-form-field" value="<%=rs.getString(2) %>" name="bname">
  </div>
<br/>
<br/>
<div class="am-form-group">
    作 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：<input type="text" class="am-form-field" value="<%=rs.getString(3) %>"  name="bauthor">
  </div>
<br/>
<br/>
<div class="am-form-group">
    出 &nbsp;版 &nbsp;社：<input type="text" class="am-form-field" value="<%=rs.getString(4) %>"   name="bpublication">
  </div>
<br/>
<br/>
<div class="am-form-group">
 出版日期：<input type="date" class="am-form-field" value="<%=rs.getString(5) %>"  name="bdate">
  </div>
<br/>
<br/>
<div class="am-form-group">
    价 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<input type="text" class="am-form-field" value="<%=rs.getString(6) %>"  name="bprice">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    馆 &nbsp;藏 &nbsp;地：<input type="text" class="am-form-field" value="<%=rs.getString(7) %>"  name="baddress">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    副本数量：<input type="text" class="am-form-field" value="<%=rs.getString(8) %>"  name="bcopy">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    可借数量：<input type="text" class="am-form-field" value="<%=rs.getString(9) %>"  name="bcount">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    图书分类号：<input type="text" class="am-form-field" value="<%=rs.getString(10) %>"  name="cno">
  </div>
<br/>
<br/>
  <div class="am-form-group">
    <button class="but" type="submit">确定</button>  
  </div>

  <fieldset>
</form>
</center>
     <% 
     		}
            conn.commit();
            conn.close();
            rs.close();
	     }catch (SQLException e) {
	          e.printStackTrace();
	     }
	     session.setAttribute("bno",Bno);
   %>
  </body>
</html>
