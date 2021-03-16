<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>

<style>
body { text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ }



</style>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	<table style="width:60%; height: 100px; margin: auto; text-align: center;">

<br><br><br>

<h2 alien="center">상품목록</h2>
        <tr>
        
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        
        </tr>
        
        <c:forEach var="row" items="${list}">
        <tr>
        	<td>
                ${obj.productId}
            </td>
            <td>
                <a href="${path}/shop/product/detail/${row.productId}">
                    <img src="${path}/images/${row.productUrl}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}/shop/product/detail/${row.productId}">${row.productName}</a>
            </td>
            <td>
                <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
        </table>
    <c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</body>
</html>