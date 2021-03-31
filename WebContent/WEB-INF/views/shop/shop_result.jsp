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


<!-- <script>
function delOk(){
    if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
        return false;
    }
}
</script> -->
  

<style>
body { text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ }
</style>
<!-- JSP Bean 활용해서 저기에 담아오자 -->

</head>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<table border="1" style="width:60%; height: 100px; margin: auto; text-align: center;">
	<br><br><br>
	<h2 alien="center">나의주문목록</h2>
			<br><br><br>
	
    

                <tr>
                	<th>주문번호</th>
                	<th>주문자 아이디</th>
                	<th>주문자 이름</th>
                	<th>주소</th>
                	<th>주문한날짜</th>
                	<th>도착예정날짜</th>
                	
                	<th>배송상태</th>
					<th>배송전 메세지</th>                	
                	<th>상품이미지</th>
                	<th>상품이름</th>
                	<th>제품번호</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>총금액</th>
                </tr>

                <c:forEach var='obj' items="${listCart }">
                
                <tr>
                <td>${obj.cart_id }</td>
                <td>${obj.user_id}</td>
                <td>${obj.user_name }</td>
                
                <td>${obj.address }</td>
                <td>${obj.nowTime }</td>
                
                <td>${obj.arrive }</td>
                
                
                <td><c:if test="${obj.arrive < obj.nowTime }">
                			 배송완료
                </c:if>
                
                <c:if test="${obj.arrive == obj.nowTime }">
                			 당일배송예정
                </c:if>
                
               <c:if test="${obj.arrive >obj.nowTime }">
                			 배송중
                </c:if>
                	
                
                		
                </td>
                
                
                <td>${obj.message }</td>
                
                
              <td> <img alt="" src="${root }images/${obj.p_url}" width="120" height="120"></td>
               		<td>${obj.p_name }</td> 	
               		<td>${obj.p_id }</td>
             		
                
                    
                    <td>
                        <fmt:formatNumber pattern="###,###,###" value="${obj.p_price}"/>원
                    </td>
                    
                    <td>${obj.amount}Box</td>
                    
                    <td>
                        <fmt:formatNumber pattern="###,###,###" value="${obj.money}"/>원
                    </td>
              
                    
   
                    <td> 
	

<a href="${root}shop/delete?cart_id=${obj.cart_id}&user_id=<%=session.getAttribute("user_id")%>" class="btn btn-mg" onclick="if(!confirm('주문을 취소하시겠습니까??')){return false;}">주문취소</a>
				
						
					
	
				
				
                    </td>	
                    
                    
                    
    </tr>
    <tr>
   
    </tr>
                    

        	
                
                
               </c:forEach>

    </table>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>