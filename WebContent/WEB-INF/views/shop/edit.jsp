<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var='root' value="${pageContext.request.contextPath }/"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/6.26.0/polyfill.min.js"></script>

<style>
body { text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ }
 
table{
width:60%;
height: 100px;
margin: auto;

text-align: center;
</style>



</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

 <br><br><br>
	<h2 alien="center">상품 수정페이지</h2>
		<br><br><br> 

<form action='${root }shop/update.do' enctype="multipart/form-data" method="post">
    <table border="1">
    
    
        <tr>
            <td>상품 이미지</td>
            <td>
                <img src="${root }upload/${tempBean.p_url}" height="300" width="250">
                <br>
          </td>
        
        <tr>
            <td><input type="file" name="productPhoto" id="productPhoto"></td>
          
          
          
             <td><input type="text" id="p_url" name="p_url" value="${tempBean.p_url}"></td> 
        </tr>
        </tr>
        
        <tr>
            <td>상품명</td>
            <td><input type="text" id="p_name" name="p_name" value="${tempBean.p_name}"></td>
        </tr>
        
        <tr>
            <td>가격</td>
            <td><input type="number" id="p_price" name="p_price" value="${tempBean.p_price}">원</td>
        </tr>
        
        <tr>
            <td>상품소개</td>
            <td><textarea id="p_desc" name="p_desc" rows="5" cols="60">${tempBean.p_desc}</textarea></td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="p_id" value="${tempBean.p_id}">
                <input type="submit" value="수정완료">
                <input type="button" onclick=location.href="${root }shop/delete.do?p_id=${tempBean.p_id}" value="삭제">
                <input type="button" onclick=location.href="${root }shop/shop_main?shop_idx=1" value="상품목록">    
            </td>
        </tr>
    </table>
    </form>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>
    
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>

<!-- </body> -->
<!-- </html> -->