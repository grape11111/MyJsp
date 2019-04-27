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

    <title>My JSP 'Bookmessage_u.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">


  </head>
  
  <body>
  <div class="am-u-lg-6">
    <div class="am-input-group">
    <form action="Jsp/Users/Findbook.jsp"  method="get">  
      <input type="text" class="am-form-field" placeholder="请输入图书名/图书编号"  name="findbook">
       <span class="am-input-group-btn">
        <button class="am-btn am-btn-default" type="submit">搜索</button>
       </span>
      </form>
    </div>
  </div>
  <br/>
  <table class="am-table am-table-bordered am-table-radius am-table-striped">
    <thead>
        <tr>
            <th>图书编号</th>
            <th>图书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>出版日期</th>
            <th>价格</th>
            <th>馆藏地</th>
            <th>副本数量</th>
            <th>可借数量</th>
            <th>图书分类号</th>
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
            Statement stmt = conn.createStatement();
                   
            String sql="select * from Book " ;
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
			out.print("</tr>");
		}
        
                     rs.close();
                    conn.close();
     }catch (SQLException e) {
          e.printStackTrace();
          out.println("错误");
             }
     %>
 </table>   
  </body>
</html>

