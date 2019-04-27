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
    
    <title>My JSP 'Message_m.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">


  </head>
  
  <body>
  <%      
            String username=(String)session.getAttribute("username");
            String mno="";
            String mname="";
            String msex="";
            
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
                   
            String sql="select * from Managers where Mname = '" + username + "' or Mno='"+username+"';" ;
            ResultSet rs = stmt.executeQuery(sql);
             if(rs.next()){
                    mno=rs.getString("Mno");
                    mname=rs.getString("Mname");
                    msex=rs.getString("Msex");

                }else{
                out.println("<script>alert('信息不存在！');window.location.href='../MyJsp/Login.jsp'</script>");
                    //response.sendRedirect("Login.jsp?errNo");//密码不对返回到登陆  
                } 
                rs.close();
                    conn.close();
          }catch (SQLException e) {
          e.printStackTrace();
          out.println("错误");
           }
           
           session.setAttribute("Mno",  mno);
                %>
                
<table class="am-table am-table-bordered am-table-radius am-table-striped">
    <thead>
        <tr>
            <th colspan="2">基本信息</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>工号</td>
            <td><%=mno %></td>
        </tr>
        <tr>
            <td>管理员姓名</td>
            <td><%=mname %></td>
        </tr>
        <tr >
            <td>性别</td>
            <td><%=msex %></td>
        </tr>
        
    </tbody>
</table>

    
  </body>
</html>
