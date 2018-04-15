<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 검사</title>
<script type="text/javascript">
	function work_close(){
		//id의 값을 가져오기
		var userid = document.getElementById("id").value;
		opener.document.getElementById("userid").value = userid;
		opener.document.getElementById("isIdCheck").value = true;
		self.close();
	}
</script>
</head>
<body>
<%
	MemberVO vo = (MemberVO)request.getAttribute("result");
	String message = "사용할 수 없습니다.";
	// vo == null 처리 하고 message = "" 이 셋팅
	if(vo==null){//vo== null 처음에 입력창에 입력하지 않아서 "사용할수 없습니다" vo null값이여서 ""이렇게 뜨면안되니까 null일때 message ""해줘서 안뜨게 
		message = "";
	} else if(vo.getPw()==null){//입력을하면 값이 null이 아니고, id는 값이 있는데 pw에는 없어서 사용가능하기때문에 사용할 수 없습니다.
		message = "사용할 수 있습니다.";
	}
	
%>
ID check
<form action="./command?cmd=idcheck" method="post">
	아이디<input type="text" name="id" value="<%=vo==null?"":vo.getId()%>" id="id">  
	<!-- 창을 띄우면 첫페이지가 널포인트에러가 떠서 널값을 처리해줘야 아이디확인창을 볼수 있음 -->
	<input type="submit" value="아이디확인"><%=message%>
	<!-- 
		search_id.jsp로 연결하여
		user만 사용가능하고 admin은 사용불가능하도록 결정한 후
		사용여부를 id_check.jsp에 전달하여 참고하도록 한다.
	 -->
	<button onclick="work_close()">아이디사용하기</button>
</form>
</body>
</html>