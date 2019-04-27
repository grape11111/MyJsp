<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="UTF-8">
    <base href="<%=basePath%>">

    <title>My JSP 'Back_mangerment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">


  </head>
  
  <body>
  <table class="am-table am-table-bordered am-table-radius am-table-striped">
    <thead>
        <tr>
            <th>卡号</th>
            <th>索书号</th>
            <th>罚款金额</th>
            <th>还款日期</th>
            <th>工号</th>
            <th>备注</th>
            <th>管理员操作</th>            
        </tr>
    </thead>

<%      
            String username=(String)session.getAttribute("username");
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
            /* if(conn != null){  
			out.print("数据库连接成功！");
			out.println("<br />"); 
			out.println("-------------------------------"); 
			out.print("<br />"); }  */
            Statement stmt = conn.createStatement();                
            String sql="select *  from Fine;" ;
            ResultSet rs = stmt.executeQuery(sql);
             while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString(1)+"</td>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td>");
			out.print("<td>"+rs.getString(5)+"</td>");
			out.print("<td>"+rs.getString(6)+"</td>");
			out.print("<td><a href='Jsp/Mangers/BackFine.jsp?cbno="+rs.getString(2)+"'><button class='btn btn-primary'>交纳罚金</button></a></td>");
			out.print("</tr>");
		}
        
          rs.close();
          conn.close();
     }catch (SQLException e) {
          e.printStackTrace();
          out.println("错误!!!");
      }
     %>
 </table>   
  </body>
</html>

