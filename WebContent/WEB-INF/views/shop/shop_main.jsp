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

<h2 alien="center">상품목록</h2>
        <tr>
        
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
           </tr>
        
        <c:forEach var="obj" items="${listProduct }">
        <tr>
        	<td>
        	
                ${obj.p_id}
           
            </td>
            
            <td>
               <a href="${root}shop/detail?shop_idx=${shop_idx}&p_id=${obj.p_id}">
               <img alt="" src="${root }images/${obj.p_url}" width="120" height="120">
               </a>
            </td><td>
            
                 <a href="${root}shop/detail?shop_idx=${shop_idx}&p_id=${obj.p_id}">${obj.p_name}</a>
            </td>
           	
            <td>
                <fmt:formatNumber value="${obj.p_price}"/>
            </td>
        </tr>
        </c:forEach>
        </table>
        
<!--         </form> -->
        
    <c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</body>
</html>