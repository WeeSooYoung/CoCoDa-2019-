/**
 * 
 */


function attraction(attractiondata){
	
	reset();
	
	var focusset = '';

	focusset += '<a data-target="#focus1" class="focuspoint">1.주요시설</a>';
	focusset += '<a data-target="#focus2" class="focuspoint">2.학교시설</a>';
	focusset += '<a data-target="#focus3" class="focuspoint">3.지하철</a>';
	//focusset += '<a data-target="#focus3" class="focuspoint">4.아파트</a>';
	
	$('#focustable').html(focusset);
	
	var tablereset = '';
	tablereset += '<br><br><a name="focus1" class="focus" id="focus1">1.주요시설</h3><br>'
	tablereset += '<div id="nullreset1">'
	tablereset += '<div id="attractionchart" class="chart"></div><br>'
	tablereset += '<h5>학생수</h5><br>'
	tablereset += '<table id="attractiontable" class = "table" style="width : 100%">'
	tablereset += '</table>'
	tablereset += '</div>'
	tablereset += 		'<br>'
	tablereset += 		'<br>'
	tablereset += 		'<a name="focus2" class="focus" id="focus2">2.학교시설</h3>'
	tablereset += 		'<br>'
	tablereset += 		'<div id="nullreset2">'
	tablereset += 		'<div id="schoolallchart" class="chart"></div>'
	tablereset += 		'<table id="schooltable"  class = "table" style="width : 100%"></table>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "padding : 30px; font-size : 1.5em; color : gray">분석결과</td>'
	tablereset += 				'<td id="schoolresult" style = "color : black ;padding-left : 10px; font-size : 1.2em;"></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table>'
	tablereset += 		'<br>'
	tablereset += 		'<br>'
	tablereset += 		'<a name="focus3" class="focus" id="focus3">3.지하철</a>'
	tablereset += 		'<br>';
	tablereset += 	'<div id = "nullreset3">'
	tablereset +=	'<div id="subwaychart" class="chart"></div>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td></td>'
	tablereset += 			'</tr>'	
	tablereset += 		'</table>'
	tablereset +=	'<h5>지하철 승하차 인원수</h5><br>';
	tablereset += 		'<table class = "table" id="subwaytable" style="width : 100%; font-size : 1.2em;">'
	tablereset +=	'</table>';
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "padding : 30px; font-size : 1.5em; color : gray">분석결과</td>'
	tablereset += 				'<td id="subwayresult" style = "color : black ;padding-left : 10px; font-size : 1.2rem;"></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table>'
	tablereset += 	'</div>'		
	
	
		$('#defaulttable').html(tablereset);
	
	$(function(){
		$.ajax({
			url : 'selectattraction',
			type : 'get',
			data : {
				'sigungu_cd' : attractiondata.sigungu_cd
			},
			success : function(res) {
				attract(res);
				school(res);

				$.ajax({
					method : 'get',
					url : 'selectsubway',
					type : 'json',
					data : {
						'wgsx' : attractiondata.wgsx,
						'wgsy' : attractiondata.wgsy
					},
					success : function (res) {
						subway(res);
					},
					error : function (e) {
						console.log(e);
						alert('error');
					}
				});
				
			},
			error : function(e) {
				console.log(e);
				alert('attractionerror');
			}
		});	
		
		
		$(".focuspoint").click(function(){
			var scrollPosition = $($(this).attr("data-target")).offset().top;
			
			$("body").animate({
				scrollTop : scrollPosition
			}, 500);
			
		});
	});


	
	
	function attract(attdata) {
		
		if (attdata.length > 0) {
		
		var month4 = attdata[0];
		var attall = parseInt(month4.kinder)+parseInt(month4.bank)+parseInt(month4.bhospital)+parseInt(month4.shospital)+parseInt(month4.department)+parseInt(month4.government)+parseInt(month4.phar)+parseInt(month4.theater);
		var kinderrate = (month4.kinder/attall)*100;
		var bankrate = (month4.bank / attall)*100;
		var bhrate = (month4.bhospital / attall)*100;
		var shrate = (month4.shospital / attall)*100;
		var derate = (month4.department / attall)*100;
		var governrate = (month4.government / attall)*100;
		var pharrate = (month4.phar / attall)*100;
		var theaterrate = (month4.theater / attall) *100;
		var attrateall = kinderrate + bankrate + bhrate + shrate + derate + governrate + pharrate + theaterrate;
		
		var attractioncontainer = document.getElementById('attractionchart');

		var attractiondata = {
		    categories: ['유치원','은행','대형병원','일반병원','백화점','관공서','약국','극장'],
		    series: [
		        {
		            name: ('주요시설'),
		            data: [month4.kinder,month4.bank,month4.bhospital,month4.shospital,month4.department,month4.government,month4.phar,month4.theater]
		        }
		    	]
		}; 

		var attractionoptions = {
				
				chart: {width: 700, height: 400, title: '주요시설'},
				yAxis: {title: '시설수'}
			};
				
		tui.chart.columnChart(attractioncontainer, attractiondata, attractionoptions);
		
		var output = '';
		
		output+= 		'<tr>';
		output+=			'<td rowspan="2">학교</td>';
		output+=			'<td rowspan="2">구분</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>전체</td>';
		output+=			'<td>유치원</td>';
		output+=			'<td>은행</td>';
		output+=			'<td>대형병원</td>';
		output+=			'<td>일반병원</td>';
		output+=			'<td>백화점</td>';
		output+=			'<td>관공서</td>';
		output+=			'<td>약국</td>';
		output+=			'<td>극장</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td rowspan="4">제1선택영역</td>';
		output+=			'<td>개</td>';
		output+=			'<td>'+attall+'</td>';
		output+=			'<td>'+month4.kinder+'</td>';
		output+=			'<td>'+month4.bank+'</td>';
		output+=			'<td>'+month4.bhospital+'</td>';
		output+=			'<td>'+month4.shospital+'</td>';
		output+=			'<td>'+month4.department+'</td>';
		output+=			'<td>'+month4.government+'</td>';
		output+=			'<td>'+month4.phar+'</td>';
		output+=			'<td>'+month4.theater+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>%</td>';
		output+=			'<td>'+attrateall.toFixed(0)+'%</td>';
		output+=			'<td>'+kinderrate.toFixed(0) +'%</td>';
		output+=			'<td>'+bankrate.toFixed(0)+'%</td>';
		output+=			'<td>'+bhrate.toFixed(0)+'%</td>';
		output+=			'<td>'+shrate.toFixed(0)+'%</td>';
		output+=			'<td>'+derate.toFixed(0)+'%</td>';
		output+=			'<td>'+governrate.toFixed(0)+'%</td>';
		output+=			'<td>'+pharrate.toFixed(0)+'%</td>';
		output+=			'<td>'+theaterrate.toFixed(0)+'%</td>';
		output+=		'</tr>';
		
		$('#attractiontable').append(output);
		
	} else {
		document.getElementById('nullreset1').empty;
		var output = '';
		output += '<div>';
		output += '지정영역에 주요시설이 존재하지 않습니다';
		output += '</div>';
		$('#nullreset1').html(output);
	}
		
	}
	
	function school(schooldata) {
		
		if (schooldata.length > 0) {
		
		var month1 = schooldata[3];
		var month2 = schooldata[2];
		var month3 = schooldata[1];
		var month4 = schooldata[0];
		
		var ele_pop = (month1.ele_pop + month2.ele_pop +month3.ele_pop+ month4.ele_pop)/4;
		var mid_pop = (month1.mid_pop + month2.mid_pop + month3.mid_pop + month4.mid_pop)/4;
		var high_pop = (month1.high_pop + month2.high_pop + month3.high_pop + month4.high_pop)/4;
		var uni_pop = (month1.uni_pop + month2.uni_pop + month3.uni_pop + month4.uni_pop)/4;
		var stuall = ele_pop + mid_pop + high_pop + uni_pop;
		var ele_rate = (ele_pop / stuall) * 100;
		var mid_rate = (mid_pop / stuall) * 100;
		var high_rate = (high_pop / stuall) * 100;
		var uni_rate = (uni_pop / stuall) * 100;
		var rate_all = (ele_rate + mid_rate + high_rate + uni_rate);
		
		
		
		//학교시설
		var schoolcontainer = document.getElementById('schoolallchart');

		var schooldata = {
		    categories: ['초등학교','중학교','고등학교','대학교'],
		    series: [
	        {
	            name: ('학교'),
	            data: [month4.elementary,month4.middle,month4.high,month4.university]
	        }
	        ]
		}; 
		
		var schooloptions = {
				
				chart: {width: 700, height: 400, title: '학교시설'},
				yAxis: {title: '시설수'}
			};
				
		tui.chart.columnChart(schoolcontainer, schooldata, schooloptions);
		
		var output = '';
		output+= '<caption>학생수</caption>'
		output+= 		'<tr>';
		output+=			'<td rowspan="2">학교</td>';
		output+=			'<td rowspan="2">구분</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>전체</td>';
		output+=			'<td>초등학교</td>';
		output+=			'<td>중학교</td>';
		output+=			'<td>고등학교</td>';
		output+=			'<td>대학교</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td rowspan="4">제1선택영역</td>';
		output+=				'<td>명</td>';
		output+=				'<td>'+ stuall.toFixed(0)+'</td>';
		output+=				'<td>'+ ele_pop.toFixed(0)+'</td>';
		output+=				'<td>'+ mid_pop.toFixed(0)+'</td>';
		output+=				'<td>'+ high_pop.toFixed(0)+'</td>';
		output+=				'<td>'+ uni_pop.toFixed(0)+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>%</td>';
		output+=				'<td>'+ rate_all.toFixed(0) +'%</td>';
		output+=				'<td>'+ ele_rate.toFixed(1)+'</td>';
		output+=				'<td>'+ mid_rate.toFixed(1)+'</td>';
		output+=				'<td>'+ high_rate.toFixed(1)+'</td>';
		output+=				'<td>'+ uni_rate.toFixed(1)+'</td>';
		output+=		'</tr>';
		
		$('#schooltable').append(output);
		

		// 요약문 작성
		var secondresult = '';
		var schoolresult = '매출의 비율이 같습니다.';
		var schoolarray = [ ele_rate,mid_rate,high_rate,uni_rate ];
		var schoolarray2 = [ '초등학생', '중학생', '고등학생', '대학생' ]
		var schoolflag = parseFloat(uni_rate);
		var schoolflag2 = '대학생';

		// 학생수비교
		$(schoolarray).each(function(index, item) {
			if (schoolflag < item) {
				schoolflag = item;
				schoolflag2 = schoolarray2[index];
			}
		});

		schoolresult = schoolflag2 + '이 ' + schoolflag.toFixed(1)
				+ '%로 제일 많은 비중을 차지하고 있습니다.';

		// 결론
		secondresult += '제 1선택영역의 학생은 ' + schoolresult;
		$('#schoolresult').html(secondresult);
	
		
		
		
		}  else {
			document.getElementById('nullreset2').empty;
			var output = '';
			output += '<div>';
			output += '지정영역에 학교가 존재하지 않습니다';
			output += '</div>';
			$('#nullreset2').html(output);
		}
		
	}
	
	function subway (subdata) {
		
		console.log(JSON.stringify(subdata));
		
		if (subdata.length > 0) {
		
		var month1 = subdata[3];
		var month2 = subdata[2];
		var month3 = subdata[1];
		var month4 = subdata[0];
		var sub_nm = month4.sub_nm + '역';
		var line = month4.line;
		
		var time1 = (month1.time1 + month2.time1 + month3.time1 + month4.time1) /4;
		var time2 = (month1.time2 + month2.time2 + month3.time2 + month4.time2) /4;
		var time3 = (month1.time3 + month2.time3 + month3.time3 + month4.time3) /4;
		var time4 = (month1.time4 + month2.time4 + month3.time4 + month4.time4) /4;
		var time5 = (month1.time5 + month2.time5 + month3.time5 + month4.time5) /4;
		var time6 = (month1.time6 + month2.time6 + month3.time6 + month4.time6) /4;
		var time7 = (month1.time7 + month2.time7 + month3.time7 + month4.time7) /4;
		var timeall = time1 + time2 + time3 + time4 + time5 + time6 + time7;
		
		var time1rate = (time1 / timeall) * 100;
		var time2rate = (time2 / timeall) * 100;
		var time3rate = (time3 / timeall) * 100;
		var time4rate = (time4 / timeall) * 100;
		var time5rate = (time5 / timeall) * 100;
		var time6rate = (time6 / timeall) * 100;
		var time7rate = (time7 / timeall) * 100;
		var timeallrate = time1rate + time2rate + time3rate + time4rate + time5rate +time6rate + time7rate; 
		

		var subwaycontainer = document.getElementById('subwaychart');

		var subwaydata = {
		    categories: ['4 ~ 6시','6 ~ 9시','9 ~ 15시','15~ 18시', '18 ~ 22시', '22 ~ 1시', '1 ~ 4시'],
		    series: [
	        {
	            name: (month1.fixed_date + '월'),
	            data: [month1.time1,month1.time2,month1.time3,month1.time4,month1.time5,month1.time6,month1.time7]
	        },
	        {
	            name: (month2.fixed_date + '월'),
	            data: [month2.time1,month2.time2,month2.time3,month2.time4,month2.time5,month2.time6,month2.time7]
	        },
	        {
	            name: (month3.fixed_date + '월'),
	            data: [month3.time1,month3.time2,month3.time3,month3.time4,month3.time5,month3.time6,month3.time7]
	        },
	        {
	            name: (month4.fixed_date + '월'),
	            data: [month4.time1,month4.time2,month4.time3,month4.time4,month4.time5,month4.time6,month4.time7]
	        }
	        
		    	]
		}; 
		
		var subwayoptions = {
				
				chart: {width: 700, height: 400, title: '지하철 승하차 인원'},
				yAxis: {title: '인원'}
			};
				
		tui.chart.lineChart(subwaycontainer, subwaydata, subwayoptions);
		

		var output = '';
		output+= 		'<tr>';
		output+=			'<td rowspan="2">역명</td>';
		output+=			'<td rowspan="2">구분</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>전체</td>';
		output+=			'<td>' + '4 ~ 6시' + '</td>';
		output+=			'<td>' + '6 ~ 9시' + '</td>';
		output+=			'<td>' + '9 ~ 15시' + '</td>';
		output+=			'<td>' + '15~ 18시' + '</td>';
		output+=			'<td>' + '18 ~ 22시' + '</td>';
		output+=			'<td>' + '22 ~ 1시' + '</td>';
		output+=			'<td>' + '1 ~ 4시' + '</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td rowspan="4">'+ sub_nm +'</td>';
		output+=				'<td>명</td>';
		output+=				'<td>'+ timeall.toFixed(0)+'</td>';
		output+=				'<td>'+ time1.toFixed(0)+'</td>';
		output+=				'<td>'+ time2.toFixed(0)+'</td>';
		output+=				'<td>'+ time3.toFixed(0)+'</td>';
		output+=				'<td>'+ time4.toFixed(0)+'</td>';
		output+=				'<td>'+ time5.toFixed(0)+'</td>';
		output+=				'<td>'+ time6.toFixed(0)+'</td>';
		output+=				'<td>'+ time7.toFixed(0)+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>%</td>';
		output+=				'<td>'+ timeallrate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time1rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time2rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time3rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time4rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time5rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time6rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ time7rate.toFixed(1)+'%</td>';
		output+=		'</tr>';
		
		$('#subwaytable').append(output);
		

		// 요약문 작성
		var secondresult = '';
		var subwayresult = '지하철 승하차 인원은.';
		var subwayarray = [ time1rate,time2rate,time3rate,time4rate,time5rate,time6rate,time7rate ];
		var subwayarray2 = [ '4 ~ 6시','6 ~ 9시','9 ~ 15시','15~ 18시', '18 ~ 22시', '22 ~ 1시', '1 ~ 4시']
		var subwayflag = parseFloat(time7rate);
		var subwayflag2 = '1 ~ 4시';

		// 학생수비교
		$(subwayarray).each(function(index, item) {
			if (subwayflag < item) {
				subwayflag = item;
				subwayflag2 = subwayarray2[index];
			}
		});

		subwayresult = subwayflag2 + '에 ' + subwayflag.toFixed(1)
				+ '%로 제일 많은 비중을 차지하고 있습니다.';

		// 결론
		secondresult += sub_nm + '의 승하차 인원은 ' + subwayresult;
		
		$('#subwayresult').append(secondresult);
	
		
		
		} else {
			$('#nullreset3').empty();
			var output = '';
			output += '<div>';
			output += '지정영역에 지하철역이 존재하지 않습니다';
			output += '</div>';
			$('#nullreset3').html(output);
		}
		
	}
	
}