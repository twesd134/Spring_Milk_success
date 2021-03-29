<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <c:set var='root' value='${pageContext.request.contextPath}/'/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<script>
//달력 하나씩 사용할때
$(function() {
  $( "#11" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년'
  });
});
</script>

<style>

.member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;
 color: #fff;
 margin: 0 auto;
 text-align: center;
 text-transform: capitalize;
 font-family: "맑은 고딕";
 font-style: italic;
}

body {
 font-family: "맑은 고딕";
 font-size: 12px;
}

.form {
 width: 498px;
 height: 300px;
 border-radius: 25px;
 border: 5px double #999;
 margin: 30px auto;
}

.form2 {
 width: 380px;
 min-width: 320px;
 height: 200px;
 margin: 60px auto;
 margin-left:20px;
}

.form3 {
 float: left;
 /*   background:#f00;  */
}

.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
}

.form4 {
 padding: 0px 0px 0px 70px;
}

#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
}

.clear {
 clear: both;
}

input[type="submit"] {
 float: left;
 /*  display:block; */
 height: 50px;
 background: #FFBB00;
 border-radius: 5px;
 border: none;
 font-family: "맑은 고딕";
}
input[type="button"] {
 height: 30px;
 background: gray;
 border-radius: 5px;
/*  width: 140px; */
 font-family:"맑은 고딕";
 margin-top:10px;
 margin-right:20px;
}
input[type="checkbox"] {
 margin-top:20px;
}

</style>

<body>

		<a href='${root }chart/chart_main?chart_info_idx=1' value="차트 메인 페이지">차트 메인 페이지</a>
	
	<form action="${root }chart/modify_pro"" method="post">
	  <div id="wrap">
   <h1 class="member">수정하기</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <label for="11">일자</label>
	<input type="text" id="11" name="chart_date"  placeholder="날짜 입력">
	<input type="button" value="달력" onclick="$('#11').datepicker('show');" />
	   
	   
	   
	   
	      <div class="clear"></div>
		
		
	
		<label for="target">목표치</label>
		<input type="text" name="target" id="target" value="">
		 <div class="clear"></div>
		
		
		
		<label for="product">실적치</label>
		<input type="text" name="product" id="product"value="">
		<div class="clear"></div>
		</div>
		
    	 <div class="form4">
    	 
		<lable><input type="submit" value="차트 수정"></lable>
		
		</div>
		</div>
		</div>
		</div>
		
</body>
</html>