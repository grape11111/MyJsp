<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Renew.jsp' starting page</title>
    
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
  			 String cbno = new String((request.getParameter("cbno")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String backdate="";
  			 int renew=0;			 
  			 
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
            String sql="select Backdate,Renew from BookBorrow WHERE CBno='"+cbno+"';" ;
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

             while(rs.next()){			
			backdate=rs.getString(1);
			renew=rs.getInt(2);
		    } 
 
            String sql2="Update BookBorrow SET Backdate=DATEADD(day,15,Backdate),Renew=Renew+1 Where CBno='"+cbno+"';";
        PreparedStatement ps=null;
         if(renew<2){
            //PreparedStatement ps = conn.prepareStatement(sql2);
            ps = conn.prepareStatement(sql2);
			ps.executeUpdate();
			ps.close();
	}else{
	out.print("<script type='text/javascript'>alert('续借次数已达上限!');window.location.href='Jsp/Mangers/BorrowMessage.jsp';</script>");
	}

            rs.close();
            conn.close();
            //ps.close();}
            out.print("<script type='text/javascript'>alert('续借成功!');window.location.href='Jsp/Mangers/BorrowMessage.jsp';</script>");
	     }catch (SQLException e) {
	          e.printStackTrace();
	          out.println("错误!!!");
	     }
	 
   %>
  </body>
</html>
