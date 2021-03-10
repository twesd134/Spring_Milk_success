<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<body>



 <form action="deleteProc.jsp" method="post" >
 	  <div id="wrap">
		<h1 class="member">삭제하기</h1>
   <div class="form">
      <label for="chart_date">삭제할 날짜</label>
		<input type="text" name="chart_date" id="chart_date" value=""  placeholder="날짜 입력 하세요">
		<div class="clear"></div>
		
		<div class="form4">
		<lable><input type="reset" value="취소"></lable>
		
        <lable><input type="submit" value="삭제" /></lable>
        <lable><input type="button" onclick="window.open('chartMain.jsp')"value="차트 메인 페이지"/></lable>
		</div>
        </div>
        </div>
        
       </tr>
        
        
    </table>
    </form>
    
</body>
</html>