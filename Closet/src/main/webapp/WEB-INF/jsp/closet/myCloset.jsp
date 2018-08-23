<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<%
	String conPath = request.getContextPath();
	System.out.print(conPath);
%>
<body>
<div class="title">
	<h1>MyCloset</h1>
	<button>Boarding</button>
</div>
<div class="closet">
	<div class="closetView" id="closet">
		ClosetImageView
	</div>
	<div class="closetOption" id="option">
		<ul>
			<li>Name : </li>
			<li>Brand : </li>
			<li>Capacity : </li>
			<li>Used : </li>
			<li>Rest : </li>
		</ul>
	</div>
</div>
<div class="items">
	<div class="itemList" id="itemList">
		<ul>
			<li>Outer</li>
			<li>Top</li>
			<li>innerTop</li>
			<li>Bottom</li>
			<li>innerBottom</li>
			<li>Shoes</li>
			<li>AccBelt</li>
			<li>AccHead</li>
			<li>AccFinger</li>
			<li>AccWristlet</li>
			<li>Piercing</li>
		</ul>
	</div>
</div>
<div class="mannequin">
	<div class="mannequinView" id="mannequin">
		mannequin
	</div>
</div>
<div class="box">
	<form action="/file/upload.do" method="POST" enctype="multipart/form-data" class="fileSet">
		<input type="file" id="uploadFile" name="uploadFile"/>
		<input type="hidden" name="category" value="outer"/>
		<button type="submit">Upload</button>
		<button type="reset">Cancel</button>
	</form>
	<div class="closetBox">
		<div class="boxList" id="outer">
			<span>Outer</span>
			<ul>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item4</li>
				<li>item5</li>
				<li>item6</li>
				<li>item7</li>
				<li>item8</li>
				<li>item9</li>
				<li>item0</li>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item4</li>
				<li>item5</li>
				<li>item6</li>
				<li>item7</li>
				<li>item8</li>
				<li>item3</li>
				<li>item4</li>
				<li>item5</li>
				<li>item6</li>
				<li>item7</li>
				<li>item8</li>
			</ul>
		</div>
	</div>
</div>
<div class="box">
	<form action="/file/upload.do" method="POST" enctype="multipart/form-data" class="fileSet">
		<input type="file" id="uploadFile" name="uploadFile"/>
		<input type="hidden" name="category" value="top"/>
		<button type="submit">Upload</button>
		<button type="reset">Cancel</button>
	</form>
	<div class="closetBox">
		<div class="boxList" id="top">
			<span>Top</span>
			<ul>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item4</li>
				<li>item5</li>
				<li>item6</li>
				<li>item7</li>
				<li>item8</li>
				<li>item9</li>
				<li>item0</li>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item4</li>
				<li>item5</li>
				<li>item6</li>
				<li>item7</li>
				<li>item8</li>
				<li>item3</li>
				<li>item4</li>
				<li>item5</li>
				<li>item6</li>
				<li>item7</li>
				<li>item8</li>
			</ul>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
