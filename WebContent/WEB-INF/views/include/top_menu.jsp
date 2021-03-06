<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>



<!-- 상단 메뉴 부분 -->
<nav class="navbar navbar-expand-md bg-skyblue navbar-white fixed-top shadow-lg">
	<a class="navbar-brand" href="${root }main">Community</a>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse"
	        data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>        
	</button>

<jsp:useBean id="Bean" class = "kr.co.community.beans.CartVO">
	<jsp:setProperty name="Bean" property="*"/>
</jsp:useBean>
	
	<div class="collapse navbar-collapse" id="navMenu">
		
		<ul class="navbar-nav">
		
		
		<c:forEach var='obj' items='${ShopMenu }'>
		 <li class="nav-item">
			    <a href="${root }shop/shop_main?shop_idx=${obj.shop_idx }" class="nav-link">${obj.shop_name }</a>
		</li>
		</c:forEach>
		
		<c:forEach var='obj' items='${cartMenu }'>
		 <li class="nav-item">
			    <a href="${root }shop/shop_result?cart_idx=${obj.cart_idx}&user_id=<%=session.getAttribute("user_id") %>" class="nav-link">${obj.cart_name }</a>
		</li>
		
		</c:forEach>
		<c:forEach var='obj' items='${topMenuList }'>
			
			<li class="nav-item">
				<a href="${root }board/main?board_info_idx=${obj.board_info_idx}" class="nav-link">${obj.board_info_name }</a>
			</li>
			
			</c:forEach>
		
		<c:forEach var='obj' items='${chartMenu }'>
		
			
			<li>
				<a href="${root }chart/chart_main?chart_info_idx=${obj.chart_info_idx }&user_id=<%=session.getAttribute("user_id") %>" class="nav-link">${obj.chart_info_name }</a>
			</li> 
		
		</c:forEach>
		
		   
		</ul>
		
	
		
		
		
		<ul class="navbar-nav ml-auto">
			<c:choose>
				
				<c:when test="${loginUserBean.userLogin == true }">
					<li class="nav-item">
						<a href="${root }user/modify" class="nav-link">정보수정</a>
					</li>
					<li class="nav-item">
						<a href="${root }user/logout" class="nav-link">로그아웃</a>
					</li>
				</c:when>
				
				<c:otherwise>
					<li class="nav-item">
						<a href="${root }user/login" class="nav-link">로그인</a>
					</li>
					<li class="nav-item">
						<a href="${root }user/join" class="nav-link">회원가입</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			
		</ul>
	</div>
</nav>