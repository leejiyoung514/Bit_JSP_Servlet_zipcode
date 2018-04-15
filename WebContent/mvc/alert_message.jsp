<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경고 메시지</title>
</head>
<body>
<jsp:useBean id="alert" class="kr.co.bit.utils.AlertMessage" scope="session"></jsp:useBean>
<jsp:setProperty property="message" name="alert" value="<%=request.getParameter(\"msg\")%>"/>
<jsp:getProperty property="message" name="alert"/>
</body>
</html>