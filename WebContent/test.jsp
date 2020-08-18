<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import = "java.util.Date" %>   
<%@ page import = "java.text.SimpleDateFormat " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

Date now = new Date();

%>

<%=now %><br>

<%

SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");

String today = sf.format(now);

%>

<%=today %><br>

<%

sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

today = sf.format(now);

%>

<%=today %><br>

<%

sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");

today = sf.format(now);

%>

<%=today %><br>





</body>
</html>