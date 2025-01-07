
$(function() {
	// 차트 객체들을 저장할 변수
	let bookChart, memberChart;
	// 기준 요일 배열 (일요일이 0, 월요일이 1, ... 토요일이 6)
	const weekDays = ['일', '월', '화', '수', '목', '금', '토'];
	const today = new Date();
	const labels = [];

	for (let i = 1; i < 8; i++) {
		// 현재 날짜에서 i일 전의 날짜 계산
		const pastDate = new Date(today);
		pastDate.setDate(today.getDate() - i);
		// 해당 날짜의 요일을 weekDays 배열에서 가져오기
		const dayLabel = weekDays[pastDate.getDay()];
		// labels 배열에 추가
		labels.push(dayLabel);
	}

	labels.reverse();

	// 초기 차트 설정
	function initCharts() {
		// 차트 1: 일일 예매 건수(예매, 예매취소)
		bookChart = new Chart(document.getElementById('chart1'), {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: '예매 건수',
					backgroundColor: 'rgba(75, 192, 192, 0.5)',
					data: []
				}, {
					label: '예매 취소 건수',
					backgroundColor: 'rgba(255, 99, 132, 0.5)',
					data: []
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '일일 예매 건수(예매, 예매 취소)'
					}
				}
			}
		});

		// 차트 2: 일일 신규회원, 탈퇴회원
		memberChart = new Chart(document.getElementById('chart2'), {
			type: 'line',
			data: {
				labels: labels,
				datasets: [{
					label: '신규 회원',
					borderColor: 'rgba(153, 102, 255, 1)',
					tension: 0.1,
					data: []
				}, {
					label: '탈퇴 회원',
					borderColor: 'rgba(54, 162, 235, 1)',
					tension: 0.1,
					data: []
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '일일 회원 증감(신규 회원, 탈퇴 회원)'
					}
				}
			}
		});
	}//initCharts

	initCharts();  // 차트 초기화
	loadAllData(); // 초기 데이터 로드
	setInterval(loadAllData, 60000); // 1분마다 업데이트

});

function loadAllData() {

	$('.chart-container').addClass('loading');

	$.ajax({
		url: '/admin/dashboard_data',
		type:"POST",
		data: { type: 'books' },
		dataType: "json",
		success: function(data) {
			updateBookChart(data);
		},
		error: function(xhr) {
			console.error(xhr.status);
		}
	});

	$.ajax({
		url: '/admin/dashboard_data',
		type:"POST",
		data: { type: 'members' },
		dataType: "json",
		success: function(data) {
			updateMemberChart(data);
		},
		error: function(xhr) {
			console.error(xhr.status);
		}
	});
}//loadAllData

function updateBookChart(data) {
	const chart = Chart.getChart("chart1");
	if (chart) {
		// 배열을 뒤집어서 최신 데이터가 오른쪽에 표시되도록 함
		chart.data.datasets[0].data = [...data.bookedTickets].reverse();
		chart.data.datasets[1].data = [...data.canceledTickets].reverse();
		chart.update();
	}
}

function updateMemberChart(data) {
	const chart = Chart.getChart("chart2");
	if (chart) {
		chart.data.datasets[0].data = [...data.joins].reverse();
		chart.data.datasets[1].data = [...data.withdraws].reverse();
		chart.update();
	}
}
