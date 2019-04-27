<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeleteUsers.jsp' starting page</title>
    
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
  			 String uno = new String((request.getParameter("uno")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 
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
           
                   
            String sql="Delete From Users Where Uno='"+uno+"';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();  
       
            conn.close();
            ps.close();
            out.print("<script type='text/javascript'>alert('删除成功!');window.location.href='Jsp/Mangers/Users_mangerment.jsp';</script>");
	     }catch (SQLException e) {
	          e.printStackTrace();
	     }
	 
   %>
  </body>
</html>