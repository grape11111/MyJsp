<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统</title>
</head>

<frameset rows="15%,*" frameborder="0" framespacing="10">
		<frame src="Top.jsp" noresize="noresize" scrolling="yes" />
		<frameset cols="10%,*">
			<frame src="Left_nav.html" noresize="noresize" />
			<frame src="Contain.jsp?pages=1" name="contain" />
		</frameset>
	</frameset>
</html>