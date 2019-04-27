<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddBook.jsp' starting page</title>
    
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
             String mno= (String)session.getAttribute("Mno");
  			 String bno = new String((request.getParameter("bno")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String bname = new String((request.getParameter("bname")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String bauthor = new String((request.getParameter("bauthor")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String bpublication = new String((request.getParameter("bpublication")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String bdate = new String((request.getParameter("bdate")).getBytes("ISO-8859-1"),"UTF-8");
  			 String bprice = new String((request.getParameter("bprice")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String baddress = new String((request.getParameter("baddress")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 int bcopy = Integer.parseInt(request.getParameter("bcopy")); 
  			 int bcount = Integer.parseInt(request.getParameter("bcount")); 
  			 String cno = new String((request.getParameter("cno")).getBytes("ISO-8859-1"),"UTF-8");  
  			 	 
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
            String sql="Insert Into Book VALUES(?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,bno);
            ps.setString(2,bname);
            ps.setString(3,bauthor);
            ps.setString(4,bpublication);
            ps.setString(5,bdate);
            ps.setString(6,bprice);
            ps.setString(7,baddress);
            ps.setInt(8,bcopy);
            ps.setInt(9,bcount);
            ps.setString(10,cno);  
            ps.setString(11,mno); 

			ps.executeUpdate();
            conn.commit();
            conn.close();
            ps.close();
           out.print("<script type='text/javascript'>alert('添加成功!');window.location.href='Jsp/Mangers/Book_mangerment.jsp';</script>");
	     }catch (SQLException e) {
	          e.printStackTrace();
	     }
	 
   %>
  </body>
</html>
