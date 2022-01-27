<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<script src="/goguma/asset/js/highcharts.js"></script>
<link rel="stylesheet" type="text/css" href="/goguma/asset/css/admin.css">
<style>
</style>
</head>
<body>
	<!-- connstatis.jsp -->
	<main class="main">
		<%@include file="/WEB-INF/views/inc/header.jsp"%>
		<section class="content">
			<div class="container">
				<%@ include file="/WEB-INF/views/inc/admin/nav.jsp"%>
				
				<div class="article">
					<h3>거래 통계</h3>
					<div id="chart" style="width:800px;"></div>
				</div>
			
			</div>
		</section>
		<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	</main>

	<script>
	var categories = [
	    '10-19', '20-29', '30-39', '40-49', '50-59', '60-69',
	    '70-79', '80+'
	];

	Highcharts.chart('chart', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: '연령별 회원 분포'
	    },

	    accessibility: {
	        point: {
	            valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
	        }
	    },
	    xAxis: [{
	        categories: categories,
	        reversed: false,
	        labels: {
	            step: 1
	        },
	        accessibility: {
	            description: 'Age (male)'
	        }
	    }, { // mirror axis on right side
	        opposite: true,
	        reversed: false,
	        categories: categories,
	        linkedTo: 0,
	        labels: {
	            step: 1
	        },
	        accessibility: {
	            description: 'Age (female)'
	        }
	    }],
	    yAxis: {
	        title: {
	            text: null
	        },
	        labels: {
	            formatter: function () {
	                return Math.abs(this.value) + '%';
	            }
	        },
	        accessibility: {
	            description: 'Percentage population',
	            rangeDescription: 'Range: 0 to 50%'
	        }
	    },

	    plotOptions: {
	        series: {
	            stacking: 'normal'
	        }
	    },

	    tooltip: {
	        formatter: function () {
	            return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
	                'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1) + '%';
	        }
	    },

	    series: [{
	        name: 'Male',
	        data: [
	            -22, -24, -30, -33, -32,
	            -29, -19, -11
	        ]
	    }, {
	        name: 'Female',
	        data: [
	            21, 26, 29, 32, 31,
	            29, 21, 17
	        ]
	    }]
	});
	</script>
</body>
</html>







