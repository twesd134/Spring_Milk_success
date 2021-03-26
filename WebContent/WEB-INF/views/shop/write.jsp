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
<script>
$(document).ready(function(){
    // 상품 등록 유효성검사
    $("#addBtn").click(function(){
        var p_name = $("#p_name").val();
        var p_price = $("#p_price").val();
        var p_desc = $("#p_desc").val();
        var productPhoto = $("#productPhoto").val();

        if(p_name == "") {
            alert("상품명을 입력해주세요");
            p_name.foucs();
        } else if (productPrice == "") {
            alert("상품 가격을 입력해주세요");
            p_price.focus();
        } else if (productDesc == "") {
            alert("상품 설명을 입력해주세요");
            p_desc.focus();
        } else if (productPhoto == "") {
            alert("상품 사진을 입력해주세요");
            productPhoto.focus();
        }
        // 상품 정보 전송
        document.form1.action = "${root}shop/insert.do";
        document.form1.submit();
    });
    // 상품 목록이동
    $("#listBtn").click(function(){
        location.href='${root}shop/shop_main?shop_idx=1';
    });
});


</script>

<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<h2>상품 등록</h2>
<form id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="p_name" id="p_name"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="p_price" id="productPrice"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="5" cols="60" name="p_desc" id="productDesc"></textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type="file" name="productPhoto" id="productPhoto"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="등록" id="addBtn">
                <input type="button" value="목록" id="listBtn">
            </td>
        </tr>
    </table>
</form>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>