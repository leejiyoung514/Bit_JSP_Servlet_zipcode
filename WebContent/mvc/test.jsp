<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alert Test</title>
</head>
<body>
<%
	String encoder = URLEncoder.encode("테스트", "UTF-8");
%>
<jsp:include page="alert_message.jsp">
	<jsp:param value="<%=encoder%>" name="msg"/>
</jsp:include>
</body>
</html>