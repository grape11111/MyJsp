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
    
    <title>My JSP 'Message_u.jsp' starting page</title>
    
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
            String uno="";
            String uname="";
            String usex="";
            String usdept="";
            String uphone="";
            String ubook="";
            
             String cbno="";
            String bno="";
            String bname="";

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
                   
            String sql="select * from Users where Uname = '" + username + "'" ;
            ResultSet rs = stmt.executeQuery(sql);
             if(rs.next()){
                    /* out.println("<script>alert('登陆成功！')</script>");
                    session.setAttribute("username",  user);
                    response.sendRedirect("frame.jsp?username="+URLEncoder.encode(user)); //解决乱码  */
                    uno=rs.getString("Uno");
                    uname=rs.getString("Uname");
                    usex=rs.getString("Usex");
                    usdept=rs.getString("Udept");
                    uphone=rs.getString("Uphone");
                    ubook=rs.getString("Ubook");
                }else{
                out.println("<script>alert('信息不存在！');window.location.href='../MyJsp/Login.jsp'</script>");
                    //response.sendRedirect("Login.jsp?errNo");//密码不对返回到登陆  
                } 
                
                %>
                
<table class="am-table am-table-bordered am-table-radius am-table-striped">
    <thead>
        <tr>
            <th colspan="2">基本信息</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>卡号</td>
            <td><%=uno %></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><%=uname %></td>
        </tr>
        <tr >
            <td>性别</td>
            <td><%=usex %></td>
        </tr>
        <tr>
            <td>院系名</td>
            <td><%=usdept %></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td><%=uphone %></td>
        </tr>
        <tr>
            <td>累计借书</td>
            <td><%=ubook %></td>
        </tr>
        <!-- <tr>
            <td>所借书籍</td>
            <td><p>已借阅<%=ubook %>本：<br>索书号：<%=cbno %><br>图书编号：<%=bno %><br>图书名：<%=bname %><br><p></td>
        </tr> -->
    </tbody>
</table>

  <table class="am-table am-table-bordered am-table-radius am-table-striped">
    <thead>
    <tr><th>个人借阅情况<th></tr>
        <tr>
            <th>索书号</th>
            <th>图书编号</th>
            <th>图书名</th>
            <th>借阅日期</th>
            <th>应还日期</th>
            <th>归还日期</th>
            <th>续借次数</th>
        </tr>
    </thead>               
          <%
            String sql2="select BookBorrow.CBno,Copy.Bno,Bname,Borrowdate,Backdate,Returndate,Renew From BookBorrow,Book,Copy WHERE BookBorrow.CBno=Copy.CBno and Copy.Bno=Book.Bno and BookBorrow.Uno= '" +uno+ "'" ;
            ResultSet rs2 = stmt.executeQuery(sql2);

	          while(rs2.next()){
					out.print("<tr>");
					out.print("<td>"+rs2.getString(1)+"</td>");
					out.print("<td>"+rs2.getString(2)+"</td>");
					out.print("<td>"+rs2.getString(3)+"</td>");
					out.print("<td>"+rs2.getString(4)+"</td>");
					out.print("<td>"+rs2.getString(5)+"</td>");
					out.print("<td>"+rs2.getString(6)+"</td>");
					out.print("<td>"+rs2.getString(7)+"</td>");
					out.print("</tr>");
			   } 
	                   
                     rs.close();
                     rs2.close();
                    conn.close();
     }catch (SQLException e) {
          e.printStackTrace();
          out.println("错误");
             }
     %>
    
  </body>
</html>
