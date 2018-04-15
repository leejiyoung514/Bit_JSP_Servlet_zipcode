<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Array"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<script type="text/javascript">
	function send_remove(id){
		var frm = document.getElementById("frm");
		alert(id);
		frm.action = "command?cmd=remove&id="+id;
		frm.onsubmit();
	}
</script>
</head>
<body>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
	StringBuffer sb = new StringBuffer("<form method='post' action='' id='frm'>");
	for(MemberVO vo : list){
		sb.append(vo.getId());
		sb.append(" <a href='command?cmd=updateReady&id="+vo.getId()+"'>"+vo.getName()+"</a>");
		sb.append(" "+vo.getAddr1());
		sb.append(" "+Arrays.toString(vo.getLangs()));
		sb.append("<button onclick=\"return send_remove('"+vo.getId()+"')\">");
		sb.append("삭제</button><br>");
	}
	sb.append("</form>");
	out.print(sb.toString());
%>
<a href="command?cmd=updateReady&id="+vo.getId()>이름</a>
</body>
</html>



