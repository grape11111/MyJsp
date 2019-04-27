<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AlterBorrow.jsp' starting page</title>
    
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
  			 String mno = (String)session.getAttribute("Mno");
  			 String cbno = new String((request.getParameter("cbno")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String uno = new String((request.getParameter("uno")).getBytes("ISO-8859-1"),"UTF-8"); 
  			 String borrowdate = new String((request.getParameter("borrowdate")).getBytes("ISO-8859-1"),"UTF-8");
  			 int ubook=0;
  			 String bno="";
  			 
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
            
             Statement stmt = conn.createStatement();                
            String sql5="select Ubook  from Users WHERE Uno='"+uno+"';" ;
            ResultSet rs = stmt.executeQuery(sql5);
             while(rs.next()){			
					ubook=rs.getInt(1);     
             } 
             
             String sql6="select Bno  from Copy WHERE CBno='"+cbno+"';" ;
             Statement stmt2 = conn.createStatement(); 
            ResultSet rs2 = stmt2.executeQuery(sql6);
             while(rs2.next()){			
					bno=rs2.getString(1);     
             }
             PreparedStatement ps=null;                             
            String sql="Insert Into BookBorrow(CBno,Uno,Mno,Borrowdate,Renew)  VALUES(?,?,?,?,?);";
            //PreparedStatement ps = conn.prepareStatement(sql);
            
            if(ubook<=5){ 
            ps = conn.prepareStatement(sql);
            
            ps.setString(1,cbno);
            ps.setString(2,uno);
            ps.setString(3,mno);
            ps.setString(4,borrowdate);
            ps.setInt(5,0);
            
            String sql2="Update Copy SET CBstatus='已被借阅' Where CBno='"+cbno+"';";
            String sql3="Update Users SET Ubook=Ubook+1 Where Uno='"+uno+"';";
            String sql4="Update Book SET Bcount=Bcount-1 Where Bno='"+bno+"';";

            PreparedStatement ps2 = conn.prepareStatement(sql2);
            PreparedStatement ps3 = conn.prepareStatement(sql3);
            PreparedStatement ps4 = conn.prepareStatement(sql4); 

			ps.executeUpdate();
			 ps2.executeUpdate();
			ps3.executeUpdate();
			ps4.executeUpdate(); 
			
            conn.commit();
            conn.close();
            ps.close();
             ps2.close();
            ps3.close();
            ps4.close(); 
            rs.close();
            rs2.close();
            out.print("<script type='text/javascript'>alert('借阅成功!');window.location.href='Jsp/Mangers/BorrowMessage.jsp';</script>");
	   }else{
	        out.print("<script type='text/javascript'>alert('借阅数量已达上限!');window.location.href='Jsp/Mangers/Borrow_mangerment.jsp';</script>");
	    } 
	    
	     }catch (SQLException e) {
	          e.printStackTrace();
	          out.println("错误");
	     }
	 
   %>
  </body>
</html>
