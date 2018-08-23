<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@ include file="/WEB-INF/jsp/common/head.jsp"%>

<body>
<div class="closetBoard">
	<div class="closetView" id="closet">
		<!-- .html()메소드로 객체 호출. -->
		ClosetImageView
	</div>
	<div class="liking">
		<span class="clover"></span>
		<span class="cloverPoint" id="cCount">0</span>
		<span class="flover"></span>
		<span class="floverPoint" id="fCount">0</span>
	</div>
	<div class="closetInfo">
		<ul class="userInfo">
			<li id="userPhoto" style="background:url('/file/img/ssu.png') no-repeat 50%;background-size:100%;"></li>
			<li id="regDate">2018-MM-DD(Mon), 24:mm:ss</li>
			<li id="userName">작성자</li>
			<li id="boardTitle">제목</li>
		</ul>
	</div>
</div>
<div class="event">
	<div class="eventView">
		<div class="eventImg">
			Ad Poster
		</div>
		<p class="eventTitle">
			Ad Title
		</p>
	</div>
</div>
<div class="promition">
	<div class="promitionView">
		<div class="promitionImg">
			Pm Poster
		</div>
		<p class="promitionTitle">
			Pm Title
		</p>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/jsp/layer/layerSimple.jsp"%>
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</html>
