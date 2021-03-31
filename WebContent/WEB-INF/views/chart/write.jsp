<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <c:set var='root' value='${pageContext.request.contextPath}/'/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<body>
	<table style="width:60%; height: 100px; margin: auto; text-align: center;">

<br><br><br>
	
	
	<form action="${root }chart/write_pro" name="chartform" modelAttribute="chartBean" enctype="multipart/form-data" method='post'>
		
	
	<input type="button" id="member" value="차트메인페이지" onclick="location.href='${root}chart/chart_main?chart_info_idx=1'">
	
	
	
	<br>
	
		<br> 
	<div id="wrap">
   <h1 class="member">차트 입력 페이지 </h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
	<label for="11">일자</label>
	<input type="text" id="11" name="chart_date"  placeholder="날짜 입력">
	<input type="button" value="달력" onclick="$('#11').datepicker('show');" />
		
	<div class="clear"></div>
	
	 <label for="21">목표치</label>	
	<input type="text" id="21"  name="target"  >

	<div class="clear"></div>
	
	
	
	
	 <label for="31">실적치</label>	
	<input type="text" id="31" name="product">
	<div class="clear"></div>
	
	
	     <div class="form4">
	
	
	<label><input type="submit" value="차트추가" onclick="chk()"></label>    
	
	<label><input type="reset" value="다시작성" onclick="chk()"></label>
	</div>
	</div>
	</div>
	</div>
	</tr>
	</form>
	
	</table>
	
</body>
</html>



<script type="text/javascript">

        function chk()
        {
        	var ch=document.chartform.chart_date.value;
        
        	
        	
        		var month1="2020-01-01";
        	var month1e="2020-01-31";
        	
        	var month2="2020-02-01";
        	var month2e="2020-02-28";
        	
        	var month3="2020-03-01";
        	var month3e="2020-03-31";
        	var month4="2020-04-01";
        	var month4e="2020-04-30";
        	var month5="2020-05-01";
        	var month5e="2020-05-31";
        	var month6="2020-06-01";
        	var month6e="2020-06-30";
        	var month7="2020-07-01";
        	var month7e="2020-07-31";
        	var month8="2020-08-01";
        	var month8e="2020-08-31";
        	var month9="2020-09-01";
        	var month9e="2020-09-30";
        	var month10="2020-10-01";
        	var month10e="2020-10-31";
        	var month11="2020-11-01";
        	var month11e="2020-11-30";
        	var month12="2020-12-01";
        	var month12e="2020-12-31";
        	
        	
        	
       	if(
       	ch>=month1 && ch<=month1e ||
       	ch>=month2 && ch<=month2e || 
       	ch>=month3 && ch<=month3e || 
       	ch>=month4 && ch<=month4e || 
       	ch>=month5 && ch<=month5e || 
       	ch>=month6 && ch<=month6e || 
       	ch>=month7 && ch<=month7e || 
       	ch>=month8 && ch<=month8e || 
       	ch>=month9 && ch<=month9e || 
   	ch>=month10&& ch<=month10e|| 
      ch>=month11 && ch<=month11e || 
      ch>=month12 && ch<=month12e
       	)
         {
       	  alert("추가완료");
         }
       	else{
               	
               		
               		alert("범위 초과");
                   	document.chartform.reset().focus();
               	}
               	
            
      
           
           
            	
        }
        
        
       </script> 
 </head>


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

input[type="reset"] {
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
