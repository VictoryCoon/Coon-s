<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@ include file="/WEB-INF/jsp/common/head.jsp"%>

<script>
$(document).ready(function(){
	
	$("#passwordChange").click(function(){

		if($("#changePw").val() != "" || $("#changePw").val() != "") {
			if($("#changePw").val() == $("#confirmPw").val()) {
				$("#cgPw").val($("#changePw").val());
			} else {
				alert("변경 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
		} else {
			alert("변경된 내용이 없습니다.");
			return;
		}
		
		document.updatePassword.action="/user/updatePassword.do";
		document.updatePassword.submit();
	});
	$("#mobileChange").click(function(){
		
		// 휴대폰 인증관련 크로스 스크립트 공격 관련 보호처리, Trigger 함수 보완.
		if($("#cgMobile1").val() == "") {
			alert("휴대폰번호 앞자리를 입력하세요.");
			return;
		}
		
		if($("#cgMobile2").val() == "") {
			alert("휴대폰번호 중간자리를 입력하세요.");
			return;
		}
		
		if($("#cgMobile3").val() == "") {
			alert("휴대폰번호 뒷자리를 입력하세요.");
			return;
		}
		
		if($("#certifyYn").val() != "N") {	// "N" : TEST
			alert("휴대폰 인증을 먼저 진행하세요.");
			return;
		} else {
			var mobile = $("#cgMobile1").val() + $("#cgMobile2").val() + $("#cgMobile3").val();
			$("#cgMobile").val(mobile);
			
			document.updateMobile.action="/user/updateMobile.do";
			document.updateMobile.submit();

			/* if == true
				$("#mobileChange").hide();
				$("#mobileChanged").fadeIn();
			*/
		}
	});
	
	$("#mobileCertify").click(function(){
		
		/* 휴대폰 인증관련 로직 추가 */
		
		$("#mobileCertify").hide();
		$("#mobileChange").fadeIn();

	});
	
	$("#goDrop").click(function(){
		location.href="/user/drop";
	});

});
</script>
<body>
<form name="updatePassword" method="POST">
	<input type="hidden" id="cgPw" name="userPw" value=""/>
	<input type="hidden" name="loginId" value="<%=sessionLoginId%>"/>
</form>
<form name="updateMobile" method="POST">
	<input type="hidden" id="cgMobile" name="mobile" value=""/>
	<input type="hidden" name="loginId" value="<%=sessionLoginId%>"/>
</form>
<div class="userInfo">
	<h1 class="title">User Informations</h1>
	<div class="infoList">
		<ul class="item">
			<li>ID</li>
			<li>이름</li>
			<li>Tel</li>
			<!-- <li>주소(가 필요한가?)</li> -->
			<li>옷장</li>
			<li>잔액</li>
			<li>최종 결제일</li>
			<li>비밀번호 변경</li>
		</ul>
		<ul class="current">
			<li><%=sessionLoginId %></li>
			<li><%=sessionName %></li>
			<li><%=sessionMobile %></li>
			<%-- <li><%=sessionAddress %></li> --%>
			<li><%=sessionClosetName %>&nbsp;<button>Change</button></li>
			<li>￦ <%=sessionCash %></li>
			<li><%=sessionCashLastDateKOR %></li>
			<li>
				<input type="password" id="changePw"  name="changePw"  placeholder="Password"/>
				<input type="password" id="confirmPw" name="confirmPw" placeholder="Password Confirm"/>
				&nbsp;<button id="passwordChange">Change</button>
			</li>
		</ul>
		<ul class="update">
			<li>　</li>
			<li>　</li>
			<li>
				<input type="text" id="cgMobile1" name="cgMobile1" maxlength="3" placeholder="＊＊＊"/> -
				<input type="text" id="cgMobile2" name="cgMobile2" maxlength="4" placeholder="＊＊＊＊"/> -
				<input type="text" id="cgMobile3" name="cgMobile3" maxlength="4" placeholder="＊＊＊＊"/>
				<button id="mobileCertify">Certify</button>
				<button style="display:none;" id="mobileChange">Change</button>
				<button style="display:none;" id="mobileChanged" disabled>Changed</button>
				<input type="hidden" id="certifyYn" name="certifyYn" value="N"/>
			</li>
			<!-- <li>
				<input type="text" id="post" name="post"/><button>우편번호 검색</button><br/>
				상세주소 1 : <input type="text" id="state" name="state"/><br/>
				상세주소 2 : <input type="text" id="city" name="city"/><br/>
				상세주소 3 : <input type="text" id="street" name="street"/><br/>
			</li> -->
			<li>　</li>
			<li>　</li>
			<li>　</li>
			<li>　</li>
		</ul>
	</div>
	<button id="goDrop" style="float:right;margin-top:12px;">UserDrop</button>
</div>
</body>
</html>