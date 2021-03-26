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
	
	<table style="width:60%; height: 100px; margin: auto; text-align: center;">
	<br><br><br>
	<h2 alien="center">상품 상세 페이지 입니다</h2>
			<br><br><br>
		
		
		<tr>
		
		<td rowspan="6" width="500" >
       <img alt="" src="${root }images/${getProduct.p_url }" width="450" height="450"></td>
		
		
		
		
		<tr>
		<td width="250" alien="center"> 상품이름 : ${getProduct.p_name }</td> </tr>
		
		
		
		
		<tr> 
		<td width="250" alien="center"> 상품가격 : ${getProduct.p_price }원</td> </tr>
		<tr>
		<td width="250" alien="center"> 상품설명: ${getProduct.p_desc }</td>
		
		</tr>
		<tr>
		
		<td width="250" alien="center" colspan="2">
	
			
		
		
		<form name="form1" action="${root }shop/insert.do">
		수량&nbsp;:&nbsp;
		<input type="hidden" name="p_url" value="${getProduct.p_url }">
		<input type="hidden" name="p_id" value="${getProduct.p_id}">
		
		<select name="amount">
			
			<option value="1">1Box</option>
			<option value="2">2Box</option>
			<option value="3">3Box</option>
			<option value="4">4Box</option>
			<option value="5">5Box</option>
			<option value="6">6Box</option>
			<option value="7">7Box</option>
			<option value="8">8Box</option>
			<option value="9">9Box</option>
			<option value="10">10Box</option>
		
		</select>
		
		<input type="submit" value="장바구니에 담기">
		<input type="button" value="상품목록" onclick="location.href='${root }shop/shop_main?shop_idx=${shop_idx }'">
		
		 </td> </tr>
		</form>
	</table>
	
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>