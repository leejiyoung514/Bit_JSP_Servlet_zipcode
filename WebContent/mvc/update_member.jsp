<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
	#message {
		border : none;
		color: red;
	}
	#zipmsg{
		color : red;
	}
</style>
<script type="text/javascript">
	function id_check(){
		//alert("success");
		var checkid = document.getElementById("userid").value;
		window.open("./command?cmd=viewIdCheck","","width=300px height=200px");
		return false;
	}
	function zipcode_check(){
		window.open("./command?cmd=postal","","width=300px height=200px");
		return false;
	}
	function id_check_with_ajax(val){
		//alert("success");
		var cmd;
		if(val=='0'){
			cmd = "id";
		} else {
			cmd = "zipcode";
		}
		alert(cmd);
		//var server_page = "id_service.jsp?cmd="+cmd;
		var server_page = "./command?cmd=viewIdService";//"./mvc/id_service.jsp";
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(this.readyState==4&&this.status==200){
				var result = this.responseText;
				alert(result);
				//Ajax 처리
				var parse_obj = JSON.parse(result);
				alert(parse_obj.user);
				alert(parse_obj.message);
				////
				if(val=="0"){
					processResultId(result);
				} else {
					pr(result);
				}

			} else if(this.readyState==4&&this.staus!=200){
				alert("error");
			}	
		}
		
		//xhr.open("GET", server_page, true);
		//xhr.send();
		
		data = "cmd1="+cmd;
		xhr.open("POST",server_page,true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
		xhr.send(data);
		return false;
	}
	
	function processResultId(result){
		if(result=="true"){
			//id값 사용가능
			//히든부분 처리
			document.getElementById("isIdCheck").value = true;
			document.getElementById("message").value = "아이디 사용가능";
		} else {
			// id 사용불가를 표시해야 함
			document.getElementById("message").value = "아이디 사용 불가능";
		}
	}
	
	var pr = function(result){
		var pos = document.getElementById("zipmsg");
		pos.innerHTML = result;
		var zip1 = result.substring(0, 3);
		var zip2 = result.substring(3, 6);
		document.getElementById("zip1").value = zip1;
		document.getElementById("zip2").value = zip2;
		document.getElementById("isZipCheck").value = true;
		return false;
	}
	
	function check_empty(){
		
		var val = document.getElementById("pw").value;
		if(val==""){
			alert("empty~");
		}
		return false;
	}
	
	function checkbox_check(){
		var eles = document.getElementsByClassName("langs"); //배열
		alert(eles.length);
		var count = 0;
		for(var i=0;i<eles.length;i++){
			if(eles[i].checked){
				//alert((i+1)+" checked");
				count++;
			}
		}
		alert("selected count is "+count)
		return false;
	}
	function select_check(){
		var val = document.getElementById("project").value;
		if(val=="0"){
			alert("프로젝트 경험을 선택해 주세요");
		}
		return false;
	}
	
	function final_check(){
		var flag = false;
		var val1 = document.getElementById("isIdCheck").value;
		var val2 = document.getElementById("isZipCheck").value;
		if(val2=="true"){
			flag = true;
		}
		//alert(flag);
		return flag;
	}
</script>
</head>
<body>
<%
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	if(vo==null){
		//빈값 공백이 오도록 처리
		vo = new MemberVO();
		vo.setId("");
		vo.setPw("");
		vo.setName("");
		vo.setZipcode(" - ");
		vo.setAddr1("");
		vo.setAddr2("");
		vo.setEmail("");
		vo.setLangs(new String[]{"0","","",""});
		vo.setTool("0");
		vo.setProject("1");
	}
%>
<form action="./command?cmd=update" method="post" enctype="application/x-www-form-urlencoded">
<table>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="userid" value="<%=vo.getId()%>" readonly="readonly" >
			</td>
	    <td></td>
	    <td></td>
	</tr>
	<tr><td>패스워드</td><td><input type="password" name="pw" id="pw" value="<%=vo.getPw()%>">
	</td><td></td><td></td></tr>
	<tr><td>이름</td><td><input type="text" name="name" id="name" value="<%=vo.getName()%>"></td><td></td><td></td></tr>
	<tr><td>우편번호</td>
		<td>
			<input type="text" name="zip1" size="3" value="<%=vo.getZipcode().split("-")[0]%>" id="zip1" onclick="return zipcode_check()" readonly="readonly"> -
			<input type="text" name="zip2" size="3" value="<%=vo.getZipcode().split("-")[1]%>" id="zip2" readonly="readonly">
			<span id="zipmsg"></span>
		</td>
		<td></td>
		<td><input type="hidden" name="isZipCheck" value="false" id="isZipCheck"></td></tr>
	<tr><td>주소1</td><td><input type="text" name="addr1" size="30" value="<%=vo.getAddr1()%>" id="addr1"></td><td></td><td></td></tr>
	<tr><td>주소2</td><td><input type="text" name="addr2" size="30" value="<%=vo.getAddr2()%>"></td><td></td><td></td></tr>
	
	<tr><td>이메일</td><td><input type="text" name="email" value="<%=vo.getEmail()%>"></td><td></td><td></td></tr>
	<tr><td>사용언어</td><td>
		<input type="checkbox" name="lang" class="langs" value="0" <%=vo.getLangs()[0].equals("0")?"checked":""%>>자바
		<input type="checkbox" name="lang" class="langs" value="1" <%=vo.getLangs()[1].equals("1")?"checked":""%>>파이썬
		<input type="checkbox" name="lang" class="langs" value="2" <%=vo.getLangs()[2].equals("2")?"checked":""%>>C++
		<input type="checkbox" name="lang" class="langs" value="3" <%=vo.getLangs()[3].equals("3")?"checked":""%>>C
		
		</td><td></td><td></td></tr>
	<tr><td>사용툴</td><td>
		<input type="radio" name="tool" value="0" <%=vo.getTool().equals("0")?"checked":""%>>이클립스
		<input type="radio" name="tool" value="1" <%=vo.getTool().equals("1")?"checked":""%>>Visual Studio
		<input type="radio" name="tool" value="2" <%=vo.getTool().equals("2")?"checked":""%>>Xcode
		<input type="radio" name="tool" value="3" <%=vo.getTool().equals("3")?"checked":""%>>notepad
		</td><td></td><td></td></tr>
	<tr><td>프로젝트경험</td>
		<td>
		<select name="project" id="project">
			<option value="0">프로젝트 경험
			<option value="1" <%=vo.getProject().equals("1")?"selected":"" %>>1~2회
			<option value="2" <%=vo.getProject().equals("2")?"selected":"" %>>3~4회
			<option value="3" <%=vo.getProject().equals("3")?"selected":"" %>>5~6회
			<option value="4" <%=vo.getProject().equals("4")?"selected":"" %>>7회이상
		</select>
		</td><td></td><td></td></tr>
	<tr>
		<td colspan="4"><input type="submit" value="수정" onclick="return final_check()"></td>
		
	</tr>
</table>	
</form>

</body>
</html>