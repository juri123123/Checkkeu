<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>정책등록</title>
<style>
		.container {
			width: 385px;
			line-height: 50px;
			margin: 50px auto;
			margin-bottom: 100px;
		}

		h5 {
			text-align: center;
		}
		
		h5 span {
			color: teal;
		}
		
		
	 input {
	 	width: 300px;
	 	height: 30px;
	 	border-radius: 5px;
	 	border: 1px solid lightgray;
	 }	 
	 button {
	 	width: 100px;
	 	height: 90x;
	 	padding: 10px;
		border: none;
		border-radius: 25px;
	 }
	 button:hover {
	 	background-color: #8080FF;
	 	color: white;
	 }


	#tableStyle {
		margin: auto;
		text-align: center;
	}
	td {
		height: 50px;
		width: 100px;
	}
	
	#textStyle{
		text-align: left;
		font-size: 15px;
	}
	#age, #date {
		width: 120px;
	}

</style>
<script>

	function policyCreate(targetUri) {
	    form.action = targetUri;
	    form.submit();
	}  
	function policyCreate() {
		if (form.name.value == "") {
		      alert("정책이름을 입력하십시오.");
		      form.name.focus();
		      return false;
		   }
		if (form.contents.value == "") {
		      alert("정책내용을 입력하십시오.");
		      form.contents.focus();
		      return false;
		}
	   if (form.qualificationForApplication.value == "") {
		      alert("자격요건을 입력하십시오.");
		      form.qualificationForApplication.focus();
		      return false;
	   } 
	   if (form.local.value == "") {
		      alert("지역을 입력하십시오.");
		      form.local.focus();
		      return false;
	   } 
	   if (form.startAge.value == "") {
		      alert("나이를 입력하십시오.");
		      form.startAge.focus();
		      return false;
		}
	   if (form.endAge.value == "") {
		      alert("나이를 입력하십시오.");
		      form.endAge.focus();
		      return false;
		}
	   if (form.income.value == "") {
		      alert("소득분위 입력하십시오.");
		      form.income.focus();
		      return false;
		   } 
		if (form.startDate.value == "") {
		      alert("지원기간을 입력하십시오.");
		      form.startDate.focus();
		      return false;
		   } 
		if (form.endDate.value == "") {
		      alert("지원기간을 입력하십시오.");
		      form.endDate.focus();
		      return false;
		   } 
		if (form.howToApply.value == "") {
			      alert("지원방법을 입력하십시오.");
			      form.howToApply.focus();
			      return false;
			}
	   form.submit();
	}
	
	
	</script>  
	
</head>
<body>
<!-- header -->
 <jsp:include page="/header.jsp"/>
  <br/><br/>
	   <div class="container">
		<h5><span>정책등록</span> 페이지입니다.</h5>
        <hr/>      
	    
 <div>
	<form name="form" method="POST" action="<c:url value='/policy/insert' />">
	<table id= tableStyle>
	<tr>
	<td id = textStyle>정책이름</td> 
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td id = textStyle>정책내용 </td><td><textarea style="border-radius: 5px; border: 1px solid lightgray;" name="contents" rows="5" cols="42.5" ></textarea></td>
	</tr>
	<tr>
	<td id = textStyle>자격요건</td> <td>  <input type="text" name="qualificationForApplication"><br/></td>
	</tr>
	<tr>
	<td id = textStyle>지역 </td> <td><input type="text" name="local"><br/></td>
	</tr>
	<tr>
	<td id = textStyle>나이</td><td> <input id="age" type="text" name="startAge"> - <input id="age" type="text" name="endAge"><br/></td>
	</tr>
	
	<tr>
	<td id = textStyle>소득분위</td><td> <input type="text" name="income"><br/></td>
	</tr>
	<tr>
	<td id = textStyle>지원기간</td><td> <input id="date" type="text" name="startDate"> - <input id="date" type="text" name="endDate"><br/></td>
	</tr>
	<tr>
	<td id = textStyle>지원방법</td><td> <input type="text" name="howToApply"><br/></td>
	</tr>

	</table>
	<table align="center">
		  <tr>
			<td>
			<input type="button" value="회원 가입" onClick="policyCreate()"> 
			</td>
		  </tr>
	</table>
</form>
</div>
 <!-- footer -->
		<jsp:include page="/footer.jsp"/>
</body>
</html>