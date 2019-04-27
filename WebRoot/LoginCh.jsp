<%@ page language="java" import="java.util.*,java.sql.Connection,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
    <%      //接收用户名和密码  
    
            String user = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");  
            String pwd = request.getParameter("pwd");
            String driverClass ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url= "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Library";
            try{
             Class.forName(driverClass);//加载驱动 
             }catch (ClassNotFoundException e) {
             e.printStackTrace();
             }
           
             try{
            String username = "Grape";
            String password = "2549107521";
           
            Connection conn = DriverManager.getConnection(url,username,password);//得到连接
            Statement stmt = conn.createStatement();
            
            
            String sql="";
            if(request.getParameter("role").equals("users")){
               sql="select * from Users where Uname = '" + user + "' or Uno='"+user+"' and Upwd = '" + pwd + "'";
               ResultSet rs = stmt.executeQuery(sql);
                if(rs.next()){
                    out.println("<script>alert('登陆成功！')</script>");
                    session.setAttribute("username",  user);
                    response.sendRedirect("frame_users.jsp?username="+URLEncoder.encode(user)); //解决乱码 
                }else{
                out.println("<script>alert('账号不存在或者密码输入错误！');window.location.href='../MyJsp/Login.jsp'</script>");
                    //response.sendRedirect("Login.jsp?errNo");//密码不对返回到登陆 
                    rs.close();
     				conn.close(); 
                }
             }else{
              sql="select * from Managers where Mname = '" + user + "' or Mno='"+user+"' and Mpwd = '" + pwd + "'";
              ResultSet rs = stmt.executeQuery(sql);
                if(rs.next()){
                    out.println("<script>alert('登陆成功！')</script>");
                    session.setAttribute("username",  user);
                    response.sendRedirect("frame.jsp?username="+URLEncoder.encode(user)); //解决乱码 
                }else{
                out.println("<script>alert('账号不存在或者密码输入错误！');window.location.href='../MyJsp/Login.jsp'</script>");
                    //response.sendRedirect("Login.jsp?errNo");//密码不对返回到登陆  
                    rs.close();
                    conn.close();
                }
              }  
              
             /* ResultSet rs = stmt.executeQuery(sql);
                if(rs.next()){
                    out.println("<script>alert('登陆成功！')</script>");
                    session.setAttribute("username",  user);
                    response.sendRedirect("frame.jsp?username="+URLEncoder.encode(user)); //解决乱码 
                }else{
                out.println("<script>alert('账号不存在或者密码输入错误！');window.location.href='../MyJsp/Login.jsp'</script>");
                    //response.sendRedirect("Login.jsp?errNo");//密码不对返回到登陆  
                } 
                     rs.close();
                    conn.close();*/
     }catch (SQLException e) {
          e.printStackTrace();
          out.println("错误");
             }
     %>
  </body>
</html>
