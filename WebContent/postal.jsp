<%@page import="kr.co.bit.vo.ZipcodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조회화면</title>
<script type="text/javascript">
	function popup(){
		var val = document.getElementById("popup").value;
		//alert(val);
	}
	function use_zipcode(){
		var val = document.getElementById("popup").value;
		var temp = val.split(" ");
		var zipcode = temp[0].split("-");
		var address = val.substring(temp[0].length+1);
		//alert(zipcode+"/"+address);
		opener.document.getElementById("zip1").value = zipcode[0];
		opener.document.getElementById("zip2").value = zipcode[1];
		opener.document.getElementById("addr1").value = address;
		opener.document.getElementById("isZipCheck").value = true;
		self.close();
	}
</script>
</head>
<body>
<form action="./command?cmd=searchDong" method="post">
	<input type="text" name="dong">
	<input type="submit" value="조회">
</form>
<br>

<br>
<%
	ArrayList<ZipcodeVO> list = (ArrayList<ZipcodeVO>)request.getAttribute("list");
	if(list==null){
		list = new ArrayList<ZipcodeVO>();
	}
	//System.out.println(list.size());
	StringBuffer sb = 
			new StringBuffer("<select onchange='popup()' id='popup'><option>주소 선택");
	for(ZipcodeVO vo : list){
		sb.append("<option value='"+vo.getAddress()+"'>");
		sb.append(vo.toString());
	}
	sb.append("</select>");
	//out.print(sb.toString());
%>
<%=sb.toString()%>
<button onclick="use_zipcode()">사용하기</button>
<br><br>
<input type="text" name="zip1" size="5"> - 
<input type="text" name="zip2" size="5"><br><br>
<input type="text" name="addr1" size="50"><br><br>
<input type="text" name="addr2" size="50"><br>
</body>
</html>
