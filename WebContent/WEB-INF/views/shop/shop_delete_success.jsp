<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<script>
	alert("주문취소 완료");
	
	location.href = "${root}shop/shop_result?cart_idx=1&user_id=<%=session.getAttribute("user_id")%>"
	
</script>