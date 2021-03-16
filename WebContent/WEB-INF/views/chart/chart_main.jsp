<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="https://unpkg.com/http-vue-loader"></script> 
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vuex"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.css"></script>

	

</head>

<jsp:useBean id="Bean" class = "kr.co.community.beans.ChartBean">
	<jsp:setProperty name="Bean" property="*"/>
</jsp:useBean>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
 	
 	
	<table width="1000" align="center">
	<tr height="100">
	
		<td align="center" >
	
 
		<form action="${root}chart/chart_main_pro" modelAttribute="chartBean" enctype="multipart/form-data">
		
 		
		<select name="chart_date" selected="true">
	
					
	 	<option value="">전체보기</option>
		<option value="2020-01">1월</option>
		<option value="2020-02">2월</option>
		<option value="2020-03">3월</option>
		<option value="2020-04">4월</option>
		<option value="2020-05">5월</option>
		<option value="2020-06">6월</option>
		<option value="2020-07">7월</option>
		<option value="2020-08">8월</option>
		<option value="2020-09">9월</option>
		<option value="2020-10">10월</option>
		<option value="2020-11">11월</option>
		<option value="2020-12">12월</option>
	</select> 
	


	<input type="submit" value="검색">
 	<a href="${root }chart/chart_main?chart_info_idx=1">차트CRUD하기 </a> &nbsp;

	<td>${Bean.chart_date}월</td>
	</form>

	
	
	
	
<!-- 		<font color="black" size="10"> 차트</font> -->
	
	</td>
	</tr>
			

<br>
	
		<br> 
		
	<tr>
	<div class="chart-container" style="position:relative;height:100%;width:100%">
	<canvas  id="myChart"></canvas>
	</div>
	
	
	<button type="button" id="change">차트 변경 </button> &nbsp;
	
	<a href="${root }chart/write?chart_info_idx=${chart_info_idx}">차트 입력하기</a> &nbsp;
	<a href="${root }chart/modify?chart_info_idx=${chart_info_idx}">차트 수정하기</a> &nbsp;
	<a href="${root }chart/delete?chart_info_idx=${chart_info_idx}">차트 삭제하기</a>
	

	 </table>
	<br><br>
	
	

	<style>
		.table-area:after{display:block; content:''; clear:both;}
		.table-area{margin:0 auto; width:1000px;}		
		.table-area > table{float:left; width:11%; margin:11px;}
		/*float는 정렬인데 Left니까 왼쪽으로 정렬한다 01 -02 -03 이렇게  */
	</style>
	
	<div class="table-area"> 
	<c:forEach var='obj' items="${getonechart }">
	
		<table border="1" align="center">
		
		
		<tr>
		<td>${obj.chart_date }</td>
		</tr>
		<tr>
		<td>${obj.kind }</td>
		</tr>
		<tr>
		<td>${obj.product }</td>
		</tr>
		<tr>
		<td>${obj.target }</td>
		</tr>
		
		</table>
		</c:forEach>

	

		</div>
		
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
		
<script>
	var ctx = document.getElementById('myChart');
	
	var config = {
		type: 'line',
		data: {
			labels: [ // Date Objects
				
				
				<c:forEach var='obj' items="${getonechart }">
				'${obj.chart_date}',
				</c:forEach>
		
/* 			'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21',
			'22','23','24','25','26','27','28','29','30' */
			
		
				
			],
			datasets: [{
				label: '생산실적치',
				backgroundColor: 'rgb(0, 142, 255)',
				borderColor: 'rgb(0, 142, 255)',
				fill: false,
				data: [
					<c:forEach var='obj' items="${getonechart }">
					'${obj.target}',  
		 			</c:forEach>
				],
			}, {
				label: '생산 목표치',
				backgroundColor: 'rgba(255, 99, 132, 1)',
				borderColor: 'rgba(255, 99, 132, 1)',
				fill: false,
				data: [
				
					<c:forEach var='obj' items="${getonechart}">
					'${obj.product}',  
					</c:forEach>
				],
			}]
		},
		options: {
			maintainAspectRatio: false,
			title: {
				text: 'Chart.js Time Scale'
			},
			scales: {
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: '차트'
					}
				}]
			},
		}
	};
	 
	//차트 타입 변경
	var myChart = new Chart(ctx, config);
	
		document.getElementById('change').onclick = function(){
		
		var dataset = config.data.datasets;
		
		 if (config.type === 'line') {
   		 config.type = 'bar';
  		} else if (config.type === 'bar') {
   		 config.type = 'line';
 		 } else {
    	throw new Error('Unknown type');
		  
		}
		
		
		
		myChart.update();
		}
	
  </script>
</body> 