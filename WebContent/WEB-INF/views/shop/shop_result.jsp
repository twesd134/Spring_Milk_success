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


<script>
    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="${root}shop/shop_result";
        });
    });
</script>

</head>
<body>




<!-- JSP Bean 활용해서 저기에 담아오자 -->

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<table style="width:60%; height: 100px; margin: auto; text-align: center;">
	<br><br><br>
	<h2 alien="center">장바구니</h2>
			<br><br><br>
	
    <c:choose>
        <c:when test="${map.count == 0}">
            장바구니가 비어있습니다.
        </c:when>
        <c:otherwise>

                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>취소</th>
                </tr>
                <c:forEach var="obj" items="${listCart }" varStatus="i">
                
                <tr>
                    <td>
                        ${obj.p_name}
                    </td>
 				</tr>
 				<tr>                
                    <td >
                        ${obj.p_price}
                        <fmt:formatNumber pattern="###,###,###" value="${obj.p_price}"/>
                    </td>
                 </tr>   
                    <td>
                        <input type="number" style="width: 40px" name="amount" value="${obj.amount}" min="1">
                        <input type="hidden" name="productId" value="${obj.p_id}">
                    </td>
                    <td style="width: 100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${obj.money}"/>
                    </td>
                    <td>
                     <%--    <a href="${path}/shop/cart/delete.do?cart_id=${obj.cart_id}">삭제</a> --%>
                    </td>
                </tr>
            
                
                
               </c:forEach>
            <button type="submit" id="btnUpdate">수정</button>
        </c:otherwise>
    </c:choose>
    
    <button type="button" id="btnList">상품목록</button>
    </table>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>