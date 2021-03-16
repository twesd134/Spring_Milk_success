<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<style>
body { text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ }



</style>
<body>
	
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <h1 align="center">　</h1>
   <hr>
   <h2>자기소개</h2>
   
    <table style="width:60%; height: 100px; margin: auto; text-align: center;">

   <tr>
     <td>Name   </td><td> :</td><td>   홍 길동</td>
   </tr>
   <tr>
     <td>Age    </td><td> :</td><td>   18</td>
   </tr>
   <tr>
     <td>Address</td><td> :</td><td><address>서울시 중구</address>   </td>
   </tr>
   <tr>
     <td>Phone  </td><td> :</td><td>   010-0123-4567</td>
   </tr>
   <tr>
     <td>E-mail </td><td> :</td><td>   hong@abc.com</td>
   </tr>
   <tr>
     <td>Tall   </td><td> :</td><td>   180Cm</td>
   </tr>
   <tr>
     <td>Weight </td><td> :</td><td>   75KG</td>
   </tr>
   <tr>
     <td>Blood  </td><td> :</td><td> <em>  O형</em></td>
   </tr>
   <tr>
     <td>Hobby  </td><td> :</td><td>   Travel</td>
   </tr>
     
   </table>
   </ul>
   <p><font size="5" color="darkblue" face="돋움, arial, 굴림">학력사항</font></p>
   <tr>
  <td>   
       한국 초등학교 2000년 졸업 <br>
       한국 중학교 2003년 졸업<br>
       한국 고등학교 2006년 졸업
   </td>   
 
  </tr>
   <hr>
   <div>





<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>









    