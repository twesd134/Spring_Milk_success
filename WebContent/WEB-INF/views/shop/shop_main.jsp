<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/6.26.0/polyfill.min.js"></script>


<style>
body { text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ }
</style>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<%-- 	<form action="${root }shop/detail"  modelAttribute="ProductBean" enctype="multipart/form-data"> --%>
	<table style="width:60%; height: 100px; margin: auto; text-align: center;">

<br><br><br>
<div class="container" style="margin-top:100px">
	<div>
		<div class="card-body">
			<h2 alien="center">상품목록</h2>
			<table class="table table-hover" id='shop_list'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">상품번호</th>
						<th class="text-center d-none d-md-table-cell">상품이미지</th>
						<th class="text-center d-none d-md-table-cell">상품명</th>
						<th class="text-center d-none d-md-table-cell">가격</th>
					</tr>
				</thead>
<!-- <h2 alien="center">상품목록</h2> -->
  <tbody>
        <c:forEach var="obj" items="${listProduct }">
        <tr>
        	<td class="text-center d-none d-md-table-cell">
        	
                ${obj.p_id}
           
            </td>
            
            <td class="text-center d-none d-md-table-cell">
               <a href="${root}shop/detail?shop_idx=${shop_idx}&p_id=${obj.p_id}&p_url=${obj.p_url}">
              
              
               <img alt="" src="${root }upload/${obj.p_url}" width="120" height="120">
               </a>
               
            </td>
            
            <td class="text-center d-none d-md-table-cell">
            
               <a href="${root}shop/detail?shop_idx=${shop_idx}&p_id=${obj.p_id}&p_url=${obj.p_url}">${obj.p_name}</a>
               <a href="${root}shop/edit?shop_idx=${shop_idx}&p_id=${obj.p_id}">[상품편집]</a>
               
            </td>
           	
            <td class="text-center d-none d-md-table-cell">
                <fmt:formatNumber value="${obj.p_price}"/>원
            </td>
      	  </tr>
         </c:forEach>
      	</tbody>  
        </table>
         
          
         
        <div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
					<c:when test="${pageBean.prevPage <= 0 }">
					<li class="page-item disabled">
						<a href="#" class="page-link">이전</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }shop/shop_main?shop_idx=1&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }shop/shop_main?shop_idx=1&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }shop/shop_main?shop_idx=1&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					</c:forEach>
					
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }shop/shop_main?shop_idx=1&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
         
				</ul>
			</div>
			<div class="text-right">
				<a href="${root }shop/write?shop_idx=${shop_idx}" class="btn btn-primary">상품등록</a>
			</div>
			
			
		</div>
			
	</div>
	</div>
</div>	
        
    <c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</body>
</html>