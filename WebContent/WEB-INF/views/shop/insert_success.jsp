<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<script>
	alert("상품 추가 /변경/삭제완료 ");
	location.href = '${root}shop/shop_main?shop_idx=1'
	
</script>