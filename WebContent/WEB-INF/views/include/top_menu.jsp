<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!-- 상단 메뉴 부분 -->

<nav class="navbar navbar-expand-md bg-black navbar-white fixed-top shadow-lg" >
	<!-- 크기,색상,배경색 설정후 상단고정  -->
	<a class="navbar-brand" href="${root }main">Community</a>
		<!-- navbar-brand는 원하는 링크 클릭시 이동하기 위함 -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navMenu">
	
	<!-- navbar-toggler 이걸로 원하는 버튼을 클릭시 하단 게시판목록을 볼수있다  -->
	
		<span class="navbar-toggler-icon"></span>
		
	</button>
	
	<div class="collapse navbar-collapse" id="navMenu">
	<!--  collapse navbar-collapse
	상위 중단 점으로 탐색 모음 내용을 그룹화하고 숨기는 데 사용됩니다. 정렬해주는 기능-->
	
		<ul class="navbar-nav">
		<!-- nav는 부모 -->
			<c:forEach var='obj' items='${topMenuList }'>
			<li class="nav-item">
					<!-- item은 자식 -->
			
				<a href="${root }board/main?board_info_idx=${obj.board_info_idx}" class="nav-link">${obj.board_info_name }</a>
			</li>
			</c:forEach>
		</ul>
		
		<ul class="navbar-nav ml-auto">
		<!-- ml-auto는 우측정렬이다 -->
			<li class="nav-item">
				<a href="${root }user/login" class="nav-link">로그인</a>
			</li>
			<li class="nav-item">
				<a href="${root }user/join" class="nav-link">회원가입</a>
			</li>
			<li class="nav-item">
				<a href="${root }user/modify" class="nav-link">정보수정</a>
			</li>
			<li class="nav-item">
				<a href="${root }user/logout" class="nav-link">로그아웃</a>
			</li>
		</ul>
		
	</div>
	</div>
</nav>