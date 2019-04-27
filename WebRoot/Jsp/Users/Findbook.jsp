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

    <title>My JSP 'Findbook.jsp' starting page</title>
    
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
            <th>图书编号(IBSN)</th>
            <th>图书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>出版日期</th>
            <th>价格</th>
            <th>馆藏地</th>
            <th>副本数量</th>
            <th>可借数量</th>
            <th>图书分类号</th>
            <th>索书号</th>
            <th>图书状态</th>            
        </tr>
    </thead>

  <%      
            String username=(String)session.getAttribute("username");
            String fb_message = new String((request.getParameter("findbook")).getBytes("ISO-8859-1"),"UTF-8");  
            if(fb_message!=null){               
            String driverClass ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url= "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Library";
            try{
             Class.forName(driverClass);//加载驱动 
             }catch (ClassNotFoundException e) {
             e.printStackTrace();}          
             try{
            String name = "Grape";
            String password = "2549107521";
            Connection conn = DriverManager.getConnection(url,name,password);//得到连接
            Statement stmt = conn.createStatement();                   
            String sql="select * from Book_users WHERE Bno='"+fb_message+"' or Bname='"+fb_message+"';" ;
            ResultSet rs = stmt.executeQuery(sql);
             while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString(1)+"</td>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td>");
			out.print("<td>"+rs.getString(5)+"</td>");
			out.print("<td>"+rs.getString(6)+"</td>");
			out.print("<td>"+rs.getString(7)+"</td>");
			out.print("<td>"+rs.getString(8)+"</td>");
			out.print("<td>"+rs.getString(9)+"</td>");
			out.print("<td>"+rs.getString(10)+"</td>");
			out.print("<td>"+rs.getString(11)+"</td>");
			out.print("<td>"+rs.getString(12)+"</td>");
			out.print("</tr>");
		}
        
                     rs.close();
                    conn.close();
     }catch (SQLException e) {
          e.printStackTrace();
          out.println("错误");
     }
     }else{
     out.print("<script type='text/javascript'>alert('请输入要查询的图书编号或书名!');window.location.href='Jsp/Users/Bookmesssage.jsp';</script>");
            }
     %>
 </table>   
  </body>
</html>

