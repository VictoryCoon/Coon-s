<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

	HttpSession sessionInfo = request.getSession(true);

	String sessionId = "";
	String sessionName = "";
	String sessionPw = "";
	String sessionMobile = "";
	String sessionAddress = "";
	String sessionCash = "";
	String sessionCashLastAmt = "";
	String sessionCashLastDate = "";
	String sessionLoginId = "";
	String sessionBankCd = "";
	String sessionBankName = "";
	String sessionClosetCd = "";
	String sessionClosetName = "";
	String sessionCashLastDateKOR = "";
	String sessionCashLastDateSlash = "";
	String sessionYn = "N";

	if(sessionInfo.getAttribute("userId") != null) {
		sessionId = (String) sessionInfo.getAttribute("userId");
		sessionName = (String) sessionInfo.getAttribute("userName");
		sessionPw = (String) sessionInfo.getAttribute("userPw");
		sessionMobile = (String) sessionInfo.getAttribute("mobile");
		sessionAddress = (String) sessionInfo.getAttribute("address");
		sessionCash = (String) sessionInfo.getAttribute("cash");
		sessionCashLastAmt = (String) sessionInfo.getAttribute("cashLastAmt");
		sessionCashLastDate = (String) sessionInfo.getAttribute("cashLastDate");
		sessionLoginId = (String) sessionInfo.getAttribute("loginId");
		sessionBankCd = (String) sessionInfo.getAttribute("bankCd");
		sessionBankName = (String) sessionInfo.getAttribute("bankName");
		sessionClosetCd = (String) sessionInfo.getAttribute("closetCd");
		sessionClosetName = (String) sessionInfo.getAttribute("closetName");
		sessionCashLastDateKOR = sessionCashLastDate.substring(0,4) + "년 " + sessionCashLastDate.substring(4,6) + "월 " + sessionCashLastDate.substring(6,8) + "일";
		sessionCashLastDateSlash = sessionCashLastDate.substring(0,4) + "/" + sessionCashLastDate.substring(4,6) + "/" + sessionCashLastDate.substring(6,8) + "/";
		sessionYn = "Y";
	} else {
		sessionId = "";
		sessionName = "";
		sessionPw = "";
		sessionMobile = "";
		sessionAddress = "";
		sessionCash = "";
		sessionCashLastAmt = "";
		sessionCashLastDate = "";
		sessionLoginId = "";
		sessionBankCd = "";
		sessionBankName = "";
		sessionClosetCd = "";
		sessionClosetName = "";
		sessionYn = "N";
	}

	String alertScript = "<script>$(document).ready(function(){ alert('세션이 만료되었습니다.\n다시 로그인 해 주세요.');location.href = '/'; });</script>";
	
	if(request.getRequestURI().indexOf("/user/") != -1 || request.getRequestURI().indexOf("/closet/") != -1 ) {
		
		if(sessionId == "" || sessionId == null) {
			out.println(alertScript);
			
			response.sendRedirect("/");
		}
	}	
%>