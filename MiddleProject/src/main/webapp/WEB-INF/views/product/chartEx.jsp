<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 
1. 동기방식 : 1 실행 순서 끝나야 다음 순서 실행(1사람 커피 주문 후 받아갈때까지 다음 사람 주문 x)
2. 비동기방식 : 여러 실행을 한꺼번에 실행함. (커피 주문 + 받아가기 등 한번에 실행 가능)
 -->

<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		console.log('1번');
		var result = [ //result 값을 배열 안에 배열 형태로 출력
		[ 'dept', 'cnt' ] ];

		console.log('2번');
		let xhtp = new XMLHttpRequest(); //비동기방식처리(Ajax 호출).
		xhtp.open('get', 'chartData.do');
		xhtp.send();
		xhtp.onload = function() { //서버로 데이터를 가져오면 함추 호출
			console.log('3번');
			let data = JSON.parse(xhtp.response); //object 타임을 json 형태로 변환해줘야 함.
			for ( let dept in data) {
				console.log(dept, data[dept]); //부서정보, cnt
				result.push([ dept, data[dept] ]); //result 배열로 출력
			}

			console.log('4번');
			console.log(result);
			data = google.visualization.arrayToDataTable(result);

			var options = {
				title : '부서별 인원 현황'
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart'));

			chart.draw(data, options); //chart 출력
		}
	}
</script>
</head>
<body>
	<p>view/chart/pieChart.jsp</p>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>
