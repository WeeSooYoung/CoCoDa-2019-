/**
 * 
 */


function population(populationdata){
	
	reset();
	console.log(populationdata)
	var focusset = '';

	focusset += '<a data-target="#focus1" class="focuspoint">1.유동인구</a>';
	focusset += '<a data-target="#focus2" class="focuspoint">2.상주인구</a>';
	focusset += '<a data-target="#focus3" class="focuspoint">3.직장인구</a>';
	
	$('#focustable').html(focusset);
	
	var tablereset = '';
	tablereset += '<a name="focus1" class="focus" id="focus1">1.유동인구</h3><br>'
	tablereset += 	'<div id="floatallchart" class="chart"></div>'
	tablereset += 	'<div id="floatalltable" style = "color : gray; text-align : center; font-size : 1em"></div><br><br>'
	tablereset += '<table class = "table">'
	tablereset += '<tr>'
	tablereset += '<td id="floatmvswchart"class="chart"></td>'
	tablereset += '<td id="floatagechart" class="chart"></td>'
	tablereset += '</tr>'
	tablereset += '</table>'
	tablereset +=			  '<h4>4개월간 평균 유동인구</h4>';
	tablereset += '<table calss = "table"id="floattable" style = "width : 100%; font-weight : normal;text-align : center"></table>'
	tablereset += '<div id="floattimechart" class="chart"></div>'
	tablereset += '<br><h4>4개월간 시간대별 평균 유동인구</h4><br>'	
	tablereset += '<table id="floattimetable" style = "width : 100%"></table><br><br>'
	tablereset += 		'<table>'
	tablereset += '<tr>'
	tablereset += '<td id="onweekandendchart" class="chart"></td>'
	tablereset += 		'<td id="weekchart" class="chart"></td>'
	tablereset += 		'</tr>'
	tablereset += 		'</table>'
	tablereset += 		'<br><table id="weektable" style = "width : 100%"></table><br>'
	tablereset += 		'<br><table style = "width : 100%">'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "padding : 30px; font-size : 1.5em; color : gray">분석결과</td>'
	tablereset += 				'<td id="floatresult" style = "padding-left : 10px; font-size : 1.2em;"></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table>'
	tablereset += 		'<br>'
	tablereset += 		'<br>'
	tablereset += 		'<a name="focus2" class="focus" id="focus2">2.상주인구</h3>'
	tablereset += 		'<br>'
	tablereset += 		'<div id="stayallchart" class="chart"></div>'
	tablereset += 		'<br><div id="staytable"></div><br>'
	tablereset += '<table style = "width : 100%">'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "padding : 70px;color : gray; font-size : 1.5em;">분석결과</td>'
	tablereset += 				'<td id="stayresult" style = "padding-left : 50px; font-size : 1.5em;"></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td><div id="mvschart" class="chart"></div></td>'
	tablereset += 				'<td><div id="agechart"></div></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table><br>'
	tablereset += 		'<h4>4개월간 평균 상주인구</h4>';
	tablereset += 		'<br><table id="mvswageresulttable" style = "width : 100%"></table>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "padding : 70px; font-size : 1.5em; color : gray;">분석결과</td>'
	tablereset += 				'<td id="livingresult" style = "padding-left : 50px; font-size : 1.5em;"></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table>'
	tablereset += 		'<br>'
	tablereset += 		'<br>'
	tablereset += 		'<a name="focus3" class="focus" id="focus3">3.직장인구</h3>'
	tablereset += 		'<br>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td><div id="workermvschart" class="chart"></div></td>'
	tablereset += 				'<td><div id="workeragechart" class="chart"></div></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table><br>'
	tablereset += '<caption>4개월간 평균 직장인구</caption>'	
	tablereset += 		'<br><table id="workerresulttable" style = "width : 100%"></table>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "color : gray;padding : 70px; font-size : 1.5em;">분석결과</td>'
	tablereset += 				'<td id="workerresult" style = "padding-left : 50px; font-size : 1.5em;"></td>'
	tablereset += 			'</tr>'
	tablereset += 		'</table>'
	tablereset += 		'<table>'
	tablereset += 		'<tr>'
	tablereset += 		'<td><div id="incomechart" class="chart"></div></td>'
	tablereset += 		'<td><div id="income2chart" class="chart"></div></td>'
	tablereset += 		'</tr>'
	tablereset += 		'</table>'
	tablereset +=  		'<h5><br>4개월간 평균 소득,소비</h5><br>'
	tablereset += 		'<table id="incometable" style = "width : 100%"></table>'
	tablereset += 		'<table>'
	tablereset += 			'<tr>'
	tablereset += 				'<td style = "color : gray;padding : 70px; font-size : 1.5em;">분석결과</td>'
	tablereset += 				'<td id="incomeresult" style = "padding-left : 50px; font-size : 1.5em;"></td>'
	tablereset += 			'</tr>'	
		
		
	tablereset += 		'</table>'
	
		$('#defaulttable').html(tablereset);
	
	$(function(){
		
		$.ajax({
			url : 'selectstay',
			type : 'get',
			data : {
				'sigungu_cd' : populationdata.sigungu_cd
			},
			success : function(res) {
				stayall(res);
			},
			error : function(res) {
				alert('stayerror');
			}
		});	
		
			$.ajax({
				url : 'selectworker',
				type : 'get',
				data : {
					'sigungu_cd' : populationdata.sigungu_cd
				},
				success : function(res) {
					workermvsw(res);
				
					$.ajax({
						url : 'selectfloat2',
						type : 'get',
						data : {	
							'wgsx' : populationdata.cy,
							'wgsy' : populationdata.cx
						},
						success : function(res) {
							floatall(res);
						
							$.ajax({
								url : 'selectincome',
								type : 'get',
								data : {
									'sigungu_cd' : populationdata.sigungu_cd
								},
								success : function(res) {
									income(res);
								},
								error : function(res) {
									alert('incomeerror');
								}
							});
						},
					error : function(res) {
						alert('floaterror');
					}
				});

	
			},
			error : function(res) {
				alert('workererror');
			}
		});	
		
		$(".focuspoint").click(function(){
			var scrollPosition = $($(this).attr("data-target")).offset().top;
			
			$("body").animate({
				scrollTop : scrollPosition
			}, 500);
			
		});

		
	});

	//총 유동인구
	function floatall(resp) {
	
		var month1 = resp[3];
		var month2 = resp[2];
		var month3 = resp[1];
		var month4 = resp[0];
		var stayall1 = month1.allpop1;
		var stayall2 = month2.allpop1;
		var stayall3 = month3.allpop1;
		var stayall4 = month4.allpop1;
		var manall1 = month1.manpop;
		var manall2 = month2.manpop;
		var manall3 = month3.manpop;
		var manall4 = month4.manpop;
		var womanall1 = month1.womanpop;
		var womanall2 = month2.womanpop;
		var womanall3 = month3.womanpop;
		var womanall4 = month4.womanpop;
		var manvswoman1 = (((manall1 + manall2 + manall3 + manall4) / (manall1 + manall2 + manall3 + manall4 + womanall1 + womanall2 + womanall3 + womanall4)) * 100); 
		var manvswoman2 = (((womanall1 + womanall2 + womanall3 + womanall4) / (manall1 + manall2 + manall3 + manall4 + womanall1 + womanall2 + womanall3 + womanall4)) * 100);
		var mvswall = manvswoman1 + manvswoman2;
		var womantotal = ((womanall1 + womanall2 + womanall3 + womanall4)/4);
		var mantotal = ((manall1 + manall2 + manall3 + manall4) / 4);
		var age10 = ((month1.agepop10 + month2.agepop10 + month3.agepop10 + month4.agepop10)/4); 
		var age20 = ((month1.agepop20 + month2.agepop20 + month3.agepop20 + month4.agepop20)/4);
		var age30 = ((month1.agepop30 + month2.agepop30 + month3.agepop30 + month4.agepop30)/4);
		var age40 = ((month1.agepop40 + month2.agepop40 + month3.agepop40 + month4.agepop40)/4);
		var age50 = ((month1.agepop50 + month2.agepop50 + month3.agepop50 + month4.agepop50)/4);
		var age60 = ((month1.agepop60 + month2.agepop60 + month3.agepop60 + month4.agepop60)/4);
		var ageall = (age10 + age20 + age30 + age40 + age50 + age60);
		var age10rate = ((age10 / ageall)*100);
		var age20rate = ((age20 / ageall)*100);
		var age30rate = ((age30 / ageall)*100);
		var age40rate = ((age40 / ageall)*100);
		var age50rate = ((age50 / ageall)*100);
		var age60rate = ((age60 / ageall)*100);
		var ageallrate = (parseFloat(age10rate) + parseFloat(age20rate) +parseFloat(age30rate)+parseFloat(age40rate)+parseFloat(age50rate)+parseFloat(age60rate)).toFixed(1);
		var time1 = (month1.timepop1 + month2.timepop1 + month3.timepop1 + month4.timepop1) / 4;
		var time2 = (month1.timepop2 + month2.timepop2 + month3.timepop2 + month4.timepop2) / 4;
		var time3 = (month1.timepop3 + month2.timepop3 + month3.timepop3 + month4.timepop3) / 4;
		var time4 = (month1.timepop4 + month2.timepop4 + month3.timepop4 + month4.timepop4) / 4;
		var time5 = (month1.timepop5 + month2.timepop5 + month3.timepop5 + month4.timepop5) / 4;
		var time6 = (month1.timepop6 + month2.timepop6 + month3.timepop6 + month4.timepop6) / 4;
		var timeall = (time1 + time2 + time3 + time4 + time5 + time6);
		var time1rate = ((time1 / timeall)*100);
		var time2rate = ((time2 / timeall)*100);
		var time3rate = ((time3 / timeall)*100);
		var time4rate = ((time4 / timeall)*100);
		var time5rate = ((time5 / timeall)*100);
		var time6rate = ((time6 / timeall)*100);
		var timeallrate = (time1rate + time2rate + time3rate + time4rate + time5rate + time6rate);
		var mon = (month1.monpop + month2.monpop + month3.monpop + month4.monpop) / 4;
		var tue = (month1.tuepop + month2.tuepop + month3.tuepop + month4.tuepop) / 4;
		var wed = (month1.wedpop + month2.wedpop + month3.wedpop + month4.wedpop) / 4;
		var thr = (month1.thrpop + month2.thrpop + month3.thrpop + month4.thrpop) / 4;
		var fri = (month1.fripop + month2.fripop + month3.fripop + month4.fripop) / 4;
		var sat = (month1.satpop + month2.satpop + month3.satpop + month4.satpop) / 4;
		var sun = (month1.sunpop + month2.sunpop + month3.sunpop + month4.sunpop) / 4;
		var weekall = (mon + tue + wed + thr + fri + sat + sun);
		var onweek = (mon + tue + wed + thr + fri);
		var weekend = (sat + sun);
		var monrate = ((mon / weekall)*100);
		var tuerate = ((tue / weekall)*100);
		var wedrate = ((wed / weekall)*100);
		var thrrate = ((thr / weekall)*100);
		var frirate = ((fri / weekall)*100);
		var satrate = ((sat / weekall)*100);
		var sunrate = ((sun / weekall)*100);
		var weekallrate = (monrate + tuerate + wedrate + thrrate + frirate + satrate + sunrate);
		var onweekrate = (monrate + tuerate + wedrate + thrrate + frirate);
		var weekendrate = (satrate + sunrate);
		
	
	var floatallcontainer = document.getElementById('floatallchart');

	var floatalldata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '월별유동인구수',
		            data: [stayall1,stayall2,stayall3,stayall4]
		        }

		    ]
		};
	
	
	var floatalloptions = {
			chartExportMenu: {
		    visible : true
		    },
		chart: {width: 700, height: 400, title: '총유동인구'},
		yAxis: {title: '총유동인구수'}
	};
	
	tui.chart.lineChart(floatallcontainer, floatalldata, floatalloptions);
	
	var result = '';
	
	 result += '<h4 style = "text-align : left">유동인구 증감추이</h4><br>';
	 result += '<table style="width : 50%; font-size : 1rem"; color : gray; >';
	 result +=    '<tr>';
	 result +=	    '<th>기간</th>';
	 result +=      '<th>' + month1.fixed_month + ' ~ ' + month2.fixed_month + '월</th>';
	 result +=      '<th>' + month2.fixed_month + ' ~ ' + month3.fixed_month + '월</th>';
	 result +=      '<th>' + month3.fixed_month + ' ~ ' + month4.fixed_month + '월</th>';
	 result +=    '</tr>';
	 result +=    '<tr>';
	 result +=       '<td style = "color : gray;">유동인구 증감율</td>';
	 result +=       '<td>' + (((stayall2 - stayall1)/stayall1) * 100).toFixed(1) + '%';
	 		if (0 > (((stayall2 - stayall1)/stayall1) * 100)) {
				result += '<span class="down">▼</span></td>'
			}
			if (0 < (((stayall2 - stayall1)/stayall1) * 100)) {
				result += '<span class="up">▲</span></td>'
			} else {
				result += '</td>'	
			}
	result +=       '<td>' + (((stayall3 - stayall2)/stayall2) * 100).toFixed(1) + '%';
		 	if (0 > (((stayall3 - stayall2)/stayall2) * 100)) {
				result += '<span class="down">▼</span></td>'
			}
			if (0 < (((stayall3 - stayall2)/stayall2) * 100)) {
				result += '<span class="up">▲</span></td>'
			} else {
				result += '</td>'	
			}
	result +=       '<td>' + (((stayall4 - stayall3)/stayall3) * 100).toFixed(1) + '%';
	 		if (0 > (((stayall4 - stayall3)/stayall3) * 100)) {
				result += '<span class="down">▼</span></td>'
			}
			if (0 < (((stayall4 - stayall3)/stayall3) * 100)) {
				result += '<span class="up">▲</span></td>'
			} else {
				result += '</td>'	
			}
	 result +=    '</tr>';
	 result += '</table>';

	
	$('#floatalltable').html(result);
	
	
	//남녀인구		
	
		var mvswcontainer = document.getElementById('floatmvswchart');

		var mvswdata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '남자',
		            data: [manall1,manall2,manall3,manall4]
		        },
		        {
		            name: '여자',
		            data: [womanall1,womanall2,womanall3,womanall4]
		        }
		    ]
		};	
	var mvswoptions = {
			
			chart: {width: 700, height: 400, title: '남녀유동인구비교'},
			yAxis: {title: '인구수'}
		};
			
	tui.chart.columnChart(mvswcontainer, mvswdata, mvswoptions);
			
	
	//연령별인구
	var agecontainer = document.getElementById('floatagechart');

	var agedata = {
	    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
	    series: [
	        {
	            name: '10대',
	            data: [(month1.agepop10),(month2.agepop10),(month3.agepop10),(month4.agepop10)]
	        },
	        {
	            name: '20대',
	            data: [(month1.agepop20),(month2.agepop20),(month3.agepop20),(month4.agepop20)]
	        },
	        {
	            name: '30대',
	            data: [(month1.agepop30),(month2.agepop30),(month3.agepop30),(month4.agepop30)]
	        },
	        {
	            name: '40대',
	            data: [(month1.agepop40),(month2.agepop40),(month3.agepop40),(month4.agepop40)]
	        },
	        {
	            name: '50대',
	            data: [(month1.agepop50),(month2.agepop50),(month3.agepop50),(month4.agepop50)]
	        },
	        {
	            name: '60대이상',
	            data: [(month1.agepop60),(month2.agepop60),(month3.agepop60),(month4.agepop60)]
	        }
	    ]
	};
	
	var ageoptions = {
			
			chart: {width: 700, height: 400, title: '연령별유동인구비교'},
			yAxis: {title: '인구수'}
		};
			
	tui.chart.columnChart(agecontainer, agedata, ageoptions);
	
	var output = '';
	output+= 		'<tr>';
	output+=			'<td rowspan="2">지역</td>';
	output+=			'<td rowspan="2">구분</td>';
	output+=			'<td colspan="3">성별</td>';
	output+=			'<td colspan="7">연령</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>전체</td>';
	output+=			'<td>남자</td>';
	output+=			'<td>여자</td>';
	output+=			'<td>전체</td>';
	output+=			'<td>10대</td>';
	output+=			'<td>20대</td>';
	output+=			'<td>30대</td>';
	output+=			'<td>40대</td>';
	output+=			'<td>50대</td>';
	output+=			'<td>60대이상</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td rowspan="2">제1선택영역</td>';
	output+=			'<td>명</td>';
	output+=			'<td>'+ (mantotal + womantotal).toFixed(0) +'</td>';
	output+=			'<td>'+ mantotal.toFixed(0) +'</td>';
	output+=			'<td>'+ womantotal.toFixed(0) +'</td>';
	output+=				'<td>'+ ageall.toFixed(0)+'</td>';
	output+=				'<td>'+ age10.toFixed(0)+'</td>';
	output+=				'<td>'+ age20.toFixed(0)+'</td>';
	output+=				'<td>'+ age30.toFixed(0)+'</td>';
	output+=				'<td>'+ age40.toFixed(0)+'</td>';
	output+=				'<td>'+ age50.toFixed(0)+'</td>';
	output+=				'<td>'+ age60.toFixed(0)+'</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>비율</td>';
	output+=			'<td>' + (parseFloat(manvswoman1) + parseFloat(manvswoman2)) + '%</td>';
	output+=			'<td>'+ manvswoman1.toFixed(1)+'%</td>';
	output+=			'<td>'+ manvswoman2.toFixed(1)+'%</td>';
	output+=				'<td>'+ ageallrate +'%</td>';
	output+=				'<td>'+ age10rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ age20rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ age30rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ age40rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ age50rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ age60rate.toFixed(1)+'%</td>';
	output+=			'</tr>';
	
	$('#floattable').html(output);

	//시간대별
	
	var timecontainer = document.getElementById('floattimechart');

		var timedata = {
		    categories: ['0 ~ 6시','6 ~ 12시','12 ~ 15시','15 ~ 18시','18 ~ 21시','21 ~ 24시'],
		    series: [
		        {
		            name: (month1.fixed_month + '월'),
		            data: [month1.timepop1,month1.timepop2,month1.timepop3,month1.timepop4,month1.timepop5,month1.timepop6]
		        },
		        {
		            name: (month2.fixed_month + '월'),
		            data: [month2.timepop1,month2.timepop2,month2.timepop3,month2.timepop4,month2.timepop5,month2.timepop6]
		        },
		        {
		            name: (month3.fixed_month + '월'),
		            data: [month3.timepop1,month3.timepop2,month3.timepop3,month3.timepop4,month3.timepop5,month3.timepop6]
		        },
		        {
		            name: (month4.fixed_month + '월'),
		            data: [month4.timepop1,month4.timepop2,month4.timepop3,month4.timepop4,month4.timepop5,month4.timepop6]
		        }
		    ]
		};
		
	var timeoptions = {
			
			chart: {width: 700, height: 400, title: '시간대별유동인구비교'},
			yAxis: {title: '인구수'}
		};
			
	tui.chart.lineChart(timecontainer, timedata, timeoptions);
	
	output = '';
	
	output+= 		'<tr>';
	output+=			'<td rowspan="2">지역</td>';
	output+=			'<td rowspan="2">구분</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>전체</td>';
	output+=			'<td>00 ~ 06시</td>';
	output+=			'<td>06 ~ 12시</td>';
	output+=			'<td>12 ~ 15시</td>';
	output+=			'<td>15 ~ 18시</td>';
	output+=			'<td>18 ~ 21시</td>';
	output+=			'<td>21 ~ 24시</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td rowspan="2">제1선택영역</td>';
	output+=			'<td>명</td>';
	output+=			'<td>'+ timeall.toFixed(0) +'</td>';
	output+=				'<td>'+ time1.toFixed(0)+'</td>';
	output+=				'<td>'+ time2.toFixed(0)+'</td>';
	output+=				'<td>'+ time3.toFixed(0)+'</td>';
	output+=				'<td>'+ time4.toFixed(0)+'</td>';
	output+=				'<td>'+ time5.toFixed(0)+'</td>';
	output+=				'<td>'+ time6.toFixed(0)+'</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>비율</td>';
	output+=				'<td>'+ timeallrate +'%</td>';
	output+=				'<td>'+ time1rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ time2rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ time3rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ time4rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ time5rate.toFixed(1)+'%</td>';
	output+=				'<td>'+ time6rate.toFixed(1)+'%</td>';
	output+=			'</tr>';
	 
	$('#floattimetable').html(output);
	
	//주중,주말,요일별
	
	var weekendcontainer = document.getElementById('onweekandendchart');

	var weekenddata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '주중유동인구',
		            data: [month1.onweekpop,month2.onweekpop,month3.onweekpop,month4.onweekpop]
		        },
		        {
		            name: '주말유동인구',
		            data: [month1.weekendpop,month2.weekendpop,month3.weekendpop,month4.weekendpop]
		        }

		    ]
		};
	
	 
	var weekendoptions = {
		
		chart: {width: 700, height: 400, title: '주중/주말유동인구'},
		yAxis: {title: '총유동인구수'}
	};
	
	tui.chart.columnChart(weekendcontainer, weekenddata, weekendoptions);
	
	var weekcontainer = document.getElementById('weekchart');

		var weekdata = {
		    categories: ['일','월','화','수','목','금','토'],
		    series: [
		        {
		            name: (month1.fixed_month + '월'),
		            data: [month1.sunpop,month1.monpop,month1.tuepop,month1.wedpop,month1.thrpop,month1.fripop,month1.satpop]
		        },
		        {
		            name: (month2.fixed_month + '월'),
		            data: [month2.sunpop,month2.monpop,month2.tuepop,month2.wedpop,month2.thrpop,month2.fripop,month2.satpop]
		        },
		        {
		            name: (month3.fixed_month + '월'),
		            data: [month3.sunpop,month3.monpop,month3.tuepop,month3.wedpop,month3.thrpop,month3.fripop,month3.satpop]
		        },
		        {
		            name: (month4.fixed_month + '월'),
		            data: [month4.sunpop,month4.monpop,month4.tuepop,month4.wedpop,month4.thrpop,month4.fripop,month4.satpop]
		        }
		    ]
		};
		
	var weekoptions = {
			
			chart: {width: 700, height: 400, title: '요일별유동인구비교'},
			yAxis: {title: '인구수'}
		};
			
	tui.chart.lineChart(weekcontainer, weekdata, weekoptions);
	
	var output = '';
	output+= 		'<tr>';
	output+=			'<td rowspan="2">지역</td>';
	output+=			'<td rowspan="2">구분</td>';
	output+=			'<td colspan="3">주중/주말</td>';
	output+=			'<td colspan="7">요일별</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>전체</td>';
	output+=			'<td>주중</td>';
	output+=			'<td>주말</td>';
	output+=			'<td>일</td>';
	output+=			'<td>월</td>';
	output+=			'<td>화</td>';
	output+=			'<td>수</td>';
	output+=			'<td>목</td>';
	output+=			'<td>금</td>';
	output+=			'<td>토</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td rowspan="2">제1선택영역</td>';
	output+=			'<td>명</td>';
	output+=			'<td>'+ weekall.toFixed(0) +'</td>';
	output+=			'<td>'+ onweek.toFixed(0) +'</td>';
	output+=			'<td>'+ weekend.toFixed(0) +'</td>';
	output+=				'<td>'+ sun.toFixed(0)+'</td>'; 
	output+=				'<td>'+ mon.toFixed(0)+'</td>';
	output+=				'<td>'+ tue.toFixed(0)+'</td>';
	output+=				'<td>'+ wed.toFixed(0)+'</td>';
	output+=				'<td>'+ thr.toFixed(0)+'</td>';
	output+=				'<td>'+ fri.toFixed(0)+'</td>';
	output+=				'<td>'+ sat.toFixed(0)+'</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>비율</td>';
	output+=			'<td>' + weekallrate.toFixed(1) + '%</td>';
	output+=			'<td>'+ onweekrate.toFixed(1)+'%</td>';
	output+=			'<td>'+ weekendrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ sunrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ monrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ tuerate.toFixed(1)+'%</td>';
	output+=				'<td>'+ wedrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ thrrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ frirate.toFixed(1)+'%</td>';
	output+=				'<td>'+ satrate.toFixed(1)+'%</td>';
	output+=			'</tr>';
	
	$('#weektable').html(output);

	
	//요약문 작성
	var firstresult='';
	var mvswresult = '남성과 여성의 비율이 같습니다.';
	var ageresult = '모든 연령이 동일하게 분포되어있습니다.';
	var timeresult = '모든 시간대에 인원이 동일하게 분포되어있습니다.';
	var weekresult = '모든 요일에 인원이 동일하게 분포되어있습니다.';
	var agearray = [parseFloat(age10rate),parseFloat(age20rate),parseFloat(age30rate),parseFloat(age40rate),parseFloat(age50rate),parseFloat(age60rate)];
	var ageflag = parseFloat(age60rate);
	var ageflag2 = 60;
	var timearray = [time1rate,time2rate,time3rate,time4rate,time5rate,time6rate];
	var timearray2 = ['0 ~ 6시','6 ~ 12시','12 ~ 15시','15 ~ 18시','18 ~ 21시','21 ~ 24시'];
	var timeflag = time6rate;
	var timeflag2 = '21 ~ 24시';
	var timeflag3 = time6rate;
	var timeflag4 = '21 ~ 24시';
	var weekarray = [sunrate,monrate,tuerate,wedrate,thrrate,frirate,satrate];
	var weekarray2 = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
	var weekflag = sunrate;
	var weekflag2 = 0;
	var weekflag3 = sunrate;
	var weekflag4 = 0;
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;
	
	//남녀비교
	if (manvswoman1 > manvswoman2) {
		mvswresult = '남성의 비율이 ' + manvswoman1.toFixed(1) + '%, ';
	};
	
	if (manvswoman1 < manvswoman2) {
		mvswresult = '여성의 비율이 ' + manvswoman2.toFixed(1) + '%, ';
	};
	
	//연령비교
	$(agearray).each(function(index,item){
		if (ageflag < item) {
			ageflag = item;
			ageflag2 = (index+1)*10;
			count1++;
		}
	});
	
	//시간대 비교
	$(timearray).each(function(index,item){
		if (timeflag < item) {
			timeflag = item;
			timeflag2 = timearray2[index];
			count2++;
		}
		if (timeflag3 > item) {
			timeflag3 = item;
			timeflag4 = timearray2[index];
			count2++;
		}
	});
	
	//요일비교
	$(weekarray).each(function(index,item){
		if (weekflag < item) {
			weekflag = item;
			weekflag2 = weekarray2[index];
			count3++;
		}
		if (weekflag3 > item) {
			weekflag3 = item;
			weekflag4 = weekarray2[index];
			count3++;
		}
	});
	
	if (count1 != 0) {
	ageresult = ageflag2 + '대가 ' + ageflag.toFixed(1) + '%로 집중되어있습니다.' + '<br>';
	}
	
	if (count2 != 0) {
	timeresult = timeflag2 + ' 시간대에 '	+ timeflag.toFixed(1) + '%로 가장 많았으며, ' + timeflag4 + ' 시간대에 ' + timeflag3.toFixed(1) + '%로 가장 적었습니다.' + '<br>'	
	}
	
	if (count3 != 0) {
	weekresult = weekflag2 + '에 ' + weekflag.toFixed(1) + '%로 가장 많았으며, ' + weekflag4 + '에 ' + weekflag3.toFixed(1) + '%로 가장 적었습니다.';	
	}
	
	//결론
	firstresult += '제 1선택영역의 평균 유동인구는 ' + (mantotal + womantotal).toFixed(0) + '명이며, ';
	firstresult += mvswresult + ageresult;
	firstresult += '제 1선택영역의 시간대별로는 ' + timeresult;
	firstresult += '제 1선택영역의 요일별로 ' + weekresult;
	$('#floatresult').html(firstresult); 
} 
	
	
	
	
	//총 상주인구
	function stayall(resp) {
		

		var month1 = resp[3];
		var month2 = resp[2];
		var month3 = resp[1];
		var month4 = resp[0];
		var stayall1 = month1.allpop1;
		var stayall2 = month2.allpop1;
		var stayall3 = month3.allpop1;
		var stayall4 = month4.allpop1;
		var manall1 = month1.manpop;
		var manall2 = month2.manpop;
		var manall3 = month3.manpop;
		var manall4 = month4.manpop;
		var womanall1 = month1.womanpop;
		var womanall2 = month2.womanpop;
		var womanall3 = month3.womanpop;
		var womanall4 = month4.womanpop;
		var manvswoman1 = (((manall1 + manall2 + manall3 + manall4) / (manall1 + manall2 + manall3 + manall4 + womanall1 + womanall2 + womanall3 + womanall4)) * 100); 
		var manvswoman2 = (((womanall1 + womanall2 + womanall3 + womanall4) / (manall1 + manall2 + manall3 + manall4 + womanall1 + womanall2 + womanall3 + womanall4)) * 100);
		var mvswall = manvswoman1 + manvswoman2;
		var womantotal = ((womanall1 + womanall2 + womanall3 + womanall4)/4);
		var mantotal = ((manall1 + manall2 + manall3 + manall4) / 4);
		var age10 = ((month1.agepop10 + month2.agepop10 + month3.agepop10 + month4.agepop10)/4); 
		var age20 = ((month1.agepop20 + month2.agepop20 + month3.agepop20 + month4.agepop20)/4);
		var age30 = ((month1.agepop30 + month2.agepop30 + month3.agepop30 + month4.agepop30)/4);
		var age40 = ((month1.agepop40 + month2.agepop40 + month3.agepop40 + month4.agepop40)/4);
		var age50 = ((month1.agepop50 + month2.agepop50 + month3.agepop50 + month4.agepop50)/4);
		var age60 = ((month1.agepop60 + month2.agepop60 + month3.agepop60 + month4.agepop60)/4);
		var ageall = (age10 + age20 + age30 + age40 + age50 + age60);
		var age10rate = ((age10 / ageall)*100);
		var age20rate = ((age20 / ageall)*100);
		var age30rate = ((age30 / ageall)*100);
		var age40rate = ((age40 / ageall)*100);
		var age50rate = ((age50 / ageall)*100);
		var age60rate = ((age60 / ageall)*100);
		var ageallrate = (parseFloat(age10rate) + parseFloat(age20rate) +parseFloat(age30rate)+parseFloat(age40rate)+parseFloat(age50rate)+parseFloat(age60rate)).toFixed(1);

		
		var stayallcontainer = document.getElementById('stayallchart');

		var stayalldata = {
			    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
			    series: [
			        {
			            name: '월별상주인구수',
			            data: [stayall1,stayall2,stayall3,stayall4]
			        }

			    ]
			};
		
		
		var stayalloptions = {
			
			chart: {width: 700, height: 400, title: '총상주인구'},
			yAxis: {title: '총상주인구수'}
		};
		
		tui.chart.lineChart(stayallcontainer, stayalldata, stayalloptions);
		
		var stayresult = '';
		
		 stayresult += '<table style = "width : 100%">';
		 stayresult +=    '<tr>';
		 stayresult +=	    '<th>기간</th>';
		 stayresult +=      '<th>' + month1.fixed_month + ' ~ ' + month2.fixed_month + '월</th>';
		 stayresult +=      '<th>' + month2.fixed_month + ' ~ ' + month3.fixed_month + '월</th>';
		 stayresult +=      '<th>' + month3.fixed_month + ' ~ ' + month4.fixed_month + '월</th>';
		 stayresult +=    '</tr>';
		 stayresult +=    '<tr>';
		 stayresult +=       '<td>상주인구 증감율</td>';
		 stayresult +=       '<td>' + (((stayall2 - stayall1)/stayall1) * 100).toFixed(1) + '%';
		 		if (0 > (((stayall2 - stayall1)/stayall1) * 100)) {
					stayresult += '<span class="down">▼</span></td>'
				}
				if (0 < (((stayall2 - stayall1)/stayall1) * 100)) {
					stayresult += '<span class="up">▲</span></td>'
				} else {
					stayresult += '</td>'	
				}
		stayresult +=       '<td>' + (((stayall3 - stayall2)/stayall2) * 100).toFixed(1) + '%';
		 		if (0 > (((stayall3 - stayall2)/stayall2) * 100)) {
					stayresult += '<span class="down">▼</span></td>'
				}
				if (0 < (((stayall3 - stayall2)/stayall2) * 100)) {
					stayresult += '<span class="up">▲</span></td>'
				} else {
					stayresult += '</td>'	
				}
		stayresult +=       '<td>' + (((stayall4 - stayall3)/stayall3) * 100).toFixed(1) + '%';
		 		if (0 > (((stayall4 - stayall3)/stayall3) * 100)) {
					stayresult += '<span class="down">▼</span></td>'
				}
				if (0 < (((stayall4 - stayall3)/stayall3) * 100)) {
					stayresult += '<span class="up">▲</span></td>'
				} else {
					stayresult += '</td>'	
				}
		 stayresult +=    '</tr>';
		 stayresult += '</table>';

		$('#staytable').html(stayresult);
		
		
		
		//요약문 작성
		var staydata1 = (((stayall2 - stayall1)/stayall1) * 100);
		var staydata2 = (((stayall3 - stayall2)/stayall2) * 100);
		var staydata3 = (((stayall4 - stayall3)/stayall3) * 100);
		var staytemp = Math.abs(staydata1);
		var stayarray = [Math.abs(staydata1),Math.abs(staydata2),Math.abs(staydata3)]
		var stayaverage = (staydata1 + staydata2 + staydata3) / 3;
		var stayresult2 = '상주인구 평균	증감율은 ' + stayaverage.toFixed(1) + '% 이며, ';
		
		$(stayarray).each(function(index,item) {
			if (staytemp < item) {
				staytemp = item;
			}
		});
		
		stayresult2 += '가장 큰 변동폭은 ' + staytemp.toFixed(1) + '% 입니다.';
			
		$('#stayresult').html(stayresult2);
		
		//남녀인구		
		
		var mvswcontainer = document.getElementById('mvschart');

		var mvswdata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '남자',
		            data: [manall1,manall2,manall3,manall4]
		        },
		        {
		            name: '여자',
		            data: [womanall1,womanall2,womanall3,womanall4]
		        }
		    ]
		};
		
		var mvswoptions = {
				
				chart: {width: 700, height: 400, title: '남녀생활인구비교'},
				yAxis: {title: '인구수'}
			};
				
		tui.chart.columnChart(mvswcontainer, mvswdata, mvswoptions);
				
		//연령별인구
		var agecontainer = document.getElementById('agechart');

		var agedata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '10대',
		            data: [(month1.agepop10),(month2.agepop10),(month3.agepop10),(month4.agepop10)]
		        },
		        {
		            name: '20대',
		            data: [(month1.agepop20),(month2.agepop20),(month3.agepop20),(month4.agepop20)]
		        },
		        {
		            name: '30대',
		            data: [(month1.agepop30),(month2.agepop30),(month3.agepop30),(month4.agepop30)]
		        },
		        {
		            name: '40대',
		            data: [(month1.agepop40),(month2.agepop40),(month3.agepop40),(month4.agepop40)]
		        },
		        {
		            name: '50대',
		            data: [(month1.agepop50),(month2.agepop50),(month3.agepop50),(month4.agepop50)]
		        },
		        {
		            name: '60대이상',
		            data: [(month1.agepop60),(month2.agepop60),(month3.agepop60),(month4.agepop60)]
		        }
		    ]
		};
		
		var ageoptions = {
				
				chart: {width: 700, height: 400, title: '연령별인구비교'},
				yAxis: {title: '인구수'}
			};
				
		tui.chart.columnChart(agecontainer, agedata, ageoptions);
		
		var output = '';
		
		output+= 		'<tr>';
		output+=			'<td rowspan="2">지역</td>';
		output+=			'<td rowspan="2">구분</td>';
		output+=			'<td colspan="3">성별</td>';
		output+=			'<td colspan="7">연령</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>전체</td>';
		output+=			'<td>남자</td>';
		output+=			'<td>여자</td>';
		output+=			'<td>전체</td>';
		output+=			'<td>10대</td>';
		output+=			'<td>20대</td>';
		output+=			'<td>30대</td>';
		output+=			'<td>40대</td>';
		output+=			'<td>50대</td>';
		output+=			'<td>60대이상</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td rowspan="2">제1선택영역</td>';
		output+=			'<td>명</td>';
		output+=			'<td>'+ (mantotal + womantotal).toFixed(0) +'</td>';
		output+=			'<td>'+ mantotal.toFixed(0) +'</td>';
		output+=			'<td>'+ womantotal.toFixed(0) +'</td>';
		output+=				'<td>'+ ageall.toFixed(0)+'</td>';
		output+=				'<td>'+ age10.toFixed(0)+'</td>';
		output+=				'<td>'+ age20.toFixed(0)+'</td>';
		output+=				'<td>'+ age30.toFixed(0)+'</td>';
		output+=				'<td>'+ age40.toFixed(0)+'</td>';
		output+=				'<td>'+ age50.toFixed(0)+'</td>';
		output+=				'<td>'+ age60.toFixed(0)+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>비율</td>';
		output+=			'<td>' + (parseFloat(manvswoman1) + parseFloat(manvswoman2)) + '%</td>';
		output+=			'<td>'+ manvswoman1.toFixed(1)+'%</td>';
		output+=			'<td>'+ manvswoman2.toFixed(1)+'%</td>';
		output+=				'<td>'+ ageallrate +'%</td>';
		output+=				'<td>'+ age10rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age20rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age30rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age40rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age50rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age60rate.toFixed(1)+'%</td>';
		output+=			'</tr>';
		
		$('#mvswageresulttable').html(output);

		//요약문 작성
		var firstresult='';
		var mvswresult = '남성과 여성의 비율이 같습니다.';
		var ageresult = '모든 연령이 동일하게 분포되어있습니다.'
		var agearray = [parseFloat(age10rate),parseFloat(age20rate),parseFloat(age30rate),parseFloat(age40rate),parseFloat(age50rate),parseFloat(age60rate)];
		var ageflag = parseFloat(age60rate);
		var ageflag2 = 60;
		
		//남녀비교
		if (manvswoman1 > manvswoman2) {
			mvswresult = '남성의 비율이 ' + manvswoman1.toFixed(1) + '%, ';
		};
		
		if (manvswoman1 < manvswoman2) {
			mvswresult = '여성의 비율이 ' + manvswoman2.toFixed(1) + '%, ';
		};
		
		//연령비교
		$(agearray).each(function(index,item){
			if (ageflag < item) {
				ageflag = item;
				ageflag2 = (index+1)*10;
			}
		});
		
		ageresult = ageflag2 + '대가 ' + ageflag.toFixed(1) + '%로 집중되어있습니다.';
		
		//결론
		firstresult += '제 1선택영역의 평균 상주인구는 ' + (mantotal + womantotal).toFixed(0) + '명이며, ';
		firstresult += mvswresult + ageresult;
		$('#livingresult').html(firstresult);
	}
	
	//직장인구
function workermvsw(mvsw) {
		
		var month1 = mvsw[3];
		var month2 = mvsw[2];
		var month3 = mvsw[1];
		var month4 = mvsw[0];
		var manall1 = month1.manpop;
		var manall2 = month2.manpop;
		var manall3 = month3.manpop;
		var manall4 = month4.manpop;
		var womanall1 = month1.womanpop;
		var womanall2 = month2.womanpop;
		var womanall3 = month3.womanpop;
		var womanall4 = month4.womanpop;
		var manvswoman1 = (((manall1 + manall2 + manall3 + manall4) / (manall1 + manall2 + manall3 + manall4 + womanall1 + womanall2 + womanall3 + womanall4)) * 100); 
		var manvswoman2 = (((womanall1 + womanall2 + womanall3 + womanall4) / (manall1 + manall2 + manall3 + manall4 + womanall1 + womanall2 + womanall3 + womanall4)) * 100);
		var mvswall = manvswoman1 + manvswoman2;
		var womantotal = ((womanall1 + womanall2 + womanall3 + womanall4)/4);
		var mantotal = ((manall1 + manall2 + manall3 + manall4) / 4);
		var age10 = ((month1.agepop10 + month2.agepop10 + month3.agepop10 + month4.agepop10)/4); 
		var age20 = ((month1.agepop20 + month2.agepop20 + month3.agepop20 + month4.agepop20)/4);
		var age30 = ((month1.agepop30 + month2.agepop30 + month3.agepop30 + month4.agepop30)/4);
		var age40 = ((month1.agepop40 + month2.agepop40 + month3.agepop40 + month4.agepop40)/4);
		var age50 = ((month1.agepop50 + month2.agepop50 + month3.agepop50 + month4.agepop50)/4);
		var age60 = ((month1.agepop60 + month2.agepop60 + month3.agepop60 + month4.agepop60)/4);
		var ageall = (age10 + age20 + age30 + age40 + age50 + age60);
		var age10rate = ((age10 / ageall)*100);
		var age20rate = ((age20 / ageall)*100);
		var age30rate = ((age30 / ageall)*100);
		var age40rate = ((age40 / ageall)*100);
		var age50rate = ((age50 / ageall)*100);
		var age60rate = ((age60 / ageall)*100);
		var ageallrate = (parseFloat(age10rate) + parseFloat(age20rate) +parseFloat(age30rate)+parseFloat(age40rate)+parseFloat(age50rate)+parseFloat(age60rate)).toFixed(1);
		
			
		var mvswcontainer = document.getElementById('workermvschart');

		var mvswdata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '남자',
		            data: [manall1,manall2,manall3,manall4]
		        },
		        {
		            name: '여자',
		            data: [womanall1,womanall2,womanall3,womanall4]
		        }
		    ]
		};
		
		var mvswoptions = {
				
				chart: {width: 700, height: 400, title: '남녀직장인구비교'},
				yAxis: {title: '직장인구수'}
			};
				
		tui.chart.columnChart(mvswcontainer, mvswdata, mvswoptions);
		
		var agecontainer = document.getElementById('workeragechart');

		var agedata = {
		    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
		    series: [
		        {
		            name: '10대',
		            data: [(month1.agepop10),(month2.agepop10),(month3.agepop10),(month4.agepop10)]
		        },
		        {
		            name: '20대',
		            data: [(month1.agepop20),(month2.agepop20),(month3.agepop20),(month4.agepop20)]
		        },
		        {
		            name: '30대',
		            data: [(month1.agepop30),(month2.agepop30),(month3.agepop30),(month4.agepop30)]
		        },
		        {
		            name: '40대',
		            data: [(month1.agepop40),(month2.agepop40),(month3.agepop40),(month4.agepop40)]
		        },
		        {
		            name: '50대',
		            data: [(month1.agepop50),(month2.agepop50),(month3.agepop50),(month4.agepop50)]
		        },
		        {
		            name: '60대이상',
		            data: [(month1.agepop60),(month2.agepop60),(month3.agepop60),(month4.agepop60)]
		        }
		    ]
		};
		
		var ageoptions = {
				
				chart: {width: 700, height: 400, title: '연령별직장인구비교'},
				yAxis: {title: '직장인구수'}
			};
				
		tui.chart.columnChart(agecontainer, agedata, ageoptions);
		
		
		var output = '';
	
		output+= 		'<tr>';
		output+=			'<td rowspan="2">지역</td>';
		output+=			'<td rowspan="2">구분</td>';
		output+=			'<td colspan="3">성별</td>';
		output+=			'<td colspan="7">연령</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>전체</td>';
		output+=			'<td>남자</td>';
		output+=			'<td>여자</td>';
		output+=			'<td>전체</td>';
		output+=			'<td>10대</td>';
		output+=			'<td>20대</td>';
		output+=			'<td>30대</td>';
		output+=			'<td>40대</td>';
		output+=			'<td>50대</td>';
		output+=			'<td>60대이상</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td rowspan="2">제1선택영역</td>';
		output+=			'<td>명</td>';
		output+=			'<td>'+ (mantotal + womantotal).toFixed(0) +'</td>';
		output+=			'<td>'+ mantotal.toFixed(0) +'</td>';
		output+=			'<td>'+ womantotal.toFixed(0) +'</td>';
		output+=				'<td>'+ ageall.toFixed(0)+'</td>';
		output+=				'<td>'+ age10.toFixed(0)+'</td>';
		output+=				'<td>'+ age20.toFixed(0)+'</td>';
		output+=				'<td>'+ age30.toFixed(0)+'</td>';
		output+=				'<td>'+ age40.toFixed(0)+'</td>';
		output+=				'<td>'+ age50.toFixed(0)+'</td>';
		output+=				'<td>'+ age60.toFixed(0)+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>비율</td>';
		output+=			'<td>' + (parseFloat(manvswoman1) + parseFloat(manvswoman2)) + '%</td>';
		output+=			'<td>'+ manvswoman1.toFixed(1)+'%</td>';
		output+=			'<td>'+ manvswoman2.toFixed(1)+'%</td>';
		output+=				'<td>'+ ageallrate +'%</td>';
		output+=				'<td>'+ age10rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age20rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age30rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age40rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age50rate.toFixed(1)+'%</td>';
		output+=				'<td>'+ age60rate.toFixed(1)+'%</td>';
		output+=			'</tr>';
		
		
		$('#workerresulttable').html(output);
		

		//요약문 작성
		var firstresult='';
		var mvswresult = '남성과 여성의 비율이 같습니다.';
		var ageresult = '모든 연령이 동일하게 분포되어있습니다.'
		var agearray = [parseFloat(age10rate),parseFloat(age20rate),parseFloat(age30rate),parseFloat(age40rate),parseFloat(age50rate),parseFloat(age60rate)];
		var ageflag = parseFloat(age60rate);
		var ageflag2 = 60;
		
		//남녀비교
		if (manvswoman1 > manvswoman2) {
			mvswresult = '남성의 비율이 ' + manvswoman1.toFixed(1) + '%, ';
		};
		
		if (manvswoman1 < manvswoman2) {
			mvswresult = '여성의 비율이 ' + manvswoman2.toFixed(1) + '%, ';
		};
		
		//연령비교
		$(agearray).each(function(index,item){
			if (ageflag < item) {
				ageflag = item;
				ageflag2 = (index+1)*10;
			}
		});
		
		ageresult = ageflag2 + '대가 ' + ageflag.toFixed(1) + '%로 집중되어있습니다.';
		
		//결론
		firstresult += '제 1선택영역의 평균 직장인구는 ' + (mantotal + womantotal).toFixed(0) + '명이며, ';
		firstresult += mvswresult + ageresult;
		$('#workerresult').html(firstresult);
	}
	
	//수입
	function income(income) {
	
	var month1 = income[3];
	var month2 = income[2];
	var month3 = income[1];
	var month4 = income[0];
	var incomeall1 = month1.food + month1.cloth + month1.living + month1.medi + month1.transport + month1.hobby + month1.culture + month1.edu + month1.play;
	var incomeall2 = month2.food + month2.cloth + month2.living + month2.medi + month2.transport + month2.hobby + month2.culture + month2.edu + month2.play;
	var incomeall3 = month3.food + month3.cloth + month3.living + month3.medi + month3.transport + month3.hobby + month3.culture + month3.edu + month3.play;
	var incomeall4 = month4.food + month4.cloth + month4.living + month4.medi + month4.transport + month4.hobby + month4.culture + month4.edu + month4.play;
	var incomeall = (incomeall1 + incomeall2 + incomeall3 + incomeall4) / 4;
	var incomerate = (month1.incomerate + month2.incomerate + month3.incomerate + month4.incomerate) / 4;
	var monthincome = (month1.month_income + month2.month_income + month3.month_income + month4.month_income) / 4;
	var food = (month1.food + month2.food + month3.food + month4.food) / 4;
	var cloth = (month1.cloth + month2.cloth + month3.cloth + month4.cloth) / 4;
	var living = (month1.living + month2.living + month3.living + month4.living) / 4;
	var medi = (month1.medi + month2.medi + month3.medi + month4.medi) / 4;
	var transport = (month1.transport + month2.transport + month3.transport + month4.transport) / 4;
	var hobby = (month1.hobby + month2.hobby + month3.hobby + month4.hobby) / 4;
	var culture = (month1.culture + month2.culture + month3.culture + month4.culture) / 4;
	var edu = (month1.edu + month2.edu + month3.edu + month4.edu) / 4;
	var play = (month1.play + month2.play + month3.play + month4.play) / 4;
	var foodrate = (food / incomeall) * 100;
	var clothrate = (cloth / incomeall) * 100;
	var livingrate = (living / incomeall) * 100;
	var medirate = (medi / incomeall) * 100;
	var transportrate = (transport / incomeall) * 100;
	var hobbyrate = (hobby / incomeall) * 100;
	var culturerate = (culture / incomeall) * 100;
	var edurate = (edu / incomeall) * 100;
	var playrate = (play / incomeall) * 100;
	var incomeallrate = foodrate + clothrate + livingrate + medirate + transportrate + hobbyrate + culturerate + edurate + playrate;
		
	var incomecontainer = document.getElementById('incomechart');

	var incomedata = {
	    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
	    series: [
	        {
	            name: '총소비',
	            data: [incomeall1,incomeall2,incomeall3,incomeall4]
	        }
	    ]
	};
	
	var incomeoptions = {
			
			chart: {width: 700, height: 400, title: '소득비교'},
			yAxis: {title: '총소비'}
		};
			
	tui.chart.lineChart(incomecontainer, incomedata, incomeoptions);
	
	var income2container = document.getElementById('income2chart');

	var income2data = { 
	    categories: [month1.fixed_month + '월',month2.fixed_month + '월',month3.fixed_month + '월',month4.fixed_month + '월'],
	    series: [
	        {
	            name: '식료품',
	            data: [(month1.food),(month2.food),(month3.food),(month4.food)]
	        },
	        {
	            name: '의류',
	            data: [(month1.cloth),(month2.cloth),(month3.cloth),(month4.cloth)]
	        },
	        {
	            name: '생활용품',
	            data: [(month1.living),(month2.living),(month3.living),(month4.living)]
	        },
	        {
	            name: '의료',
	            data: [(month1.medi),(month2.medi),(month3.medi),(month4.medi)]
	        },
	        {
	            name: '교통',
	            data: [(month1.transport),(month2.transport),(month3.transport),(month4.transport)]
	        },
	        {
	            name: '여가',
	            data: [(month1.hobby),(month2.hobby),(month3.hobby),(month4.hobby)]
	        },
	        {
	            name: '문화',
	            data: [(month1.culture),(month2.culture),(month3.culture),(month4.culture)]
	        },
	        {
	            name: '교육',
	            data: [(month1.edu),(month2.edu),(month3.edu),(month4.edu)]
	        },
	        {
	            name: '유흥',
	            data: [(month1.play),(month2.play),(month3.play),(month4.play)]
	        }
	    ]
	};
	
	var income2options = {
			
			chart: {width: 700, height: 400, title: '종목별소비'},
			yAxis: {title: '종목별소비'}
		};
			
	tui.chart.columnChart(income2container, income2data, income2options);
	
	
	var output = '';
	
	output+= 		'<tr>';
	output+=			'<td rowspan="2">지역</td>';
	output+=			'<td rowspan="2">구분</td>';
	output+=			'<td colspan="2">소득</td>';
	output+=			'<td colspan="10">소비</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>월평균소득</td>';
	output+=			'<td>소득지수</td>';
	output+=			'<td>전체</td>';
	output+=			'<td>식료품</td>';
	output+=			'<td>의류</td>';
	output+=			'<td>생활용품</td>';
	output+=			'<td>의료비</td>';
	output+=			'<td>교통</td>';
	output+=			'<td>여가</td>';
	output+=			'<td>문화</td>';
	output+=			'<td>교육</td>';
	output+=			'<td>유흥</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td rowspan="2">제1선택영역</td>';
	output+=			'<td>원</td>';
	output+=			'<td>'+ monthincome.toFixed(0) +'</td>';
	output+=			'<td>'+ incomerate.toFixed(0) +'</td>';
	output+=				'<td>'+ incomeall.toFixed(0)+'</td>';
	output+=				'<td>'+ food.toFixed(0)+'</td>';
	output+=				'<td>'+ cloth.toFixed(0)+'</td>';
	output+=				'<td>'+ living.toFixed(0)+'</td>';
	output+=				'<td>'+ medi.toFixed(0)+'</td>';
	output+=				'<td>'+ transport.toFixed(0)+'</td>';
	output+=				'<td>'+ hobby.toFixed(0)+'</td>';
	output+=				'<td>'+ culture.toFixed(0)+'</td>';
	output+=				'<td>'+ edu.toFixed(0)+'</td>';
	output+=				'<td>'+ play.toFixed(0)+'</td>';
	output+=		'</tr>';
	output+=		'<tr>';
	output+=			'<td>비율</td>';
	output+=			'<td>%</td>';
	output+=			'<td>%</td>';
	output+=				'<td>'+ incomeallrate.toFixed(1) +'%</td>';
	output+=				'<td>'+ foodrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ clothrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ livingrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ medirate.toFixed(1)+'%</td>';
	output+=				'<td>'+ transportrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ hobbyrate.toFixed(1)+'%</td>';
	output+=				'<td>'+ culturerate.toFixed(1)+'%</td>';
	output+=				'<td>'+ edurate.toFixed(1)+'%</td>';
	output+=				'<td>'+ playrate.toFixed(1)+'%</td>';
	output+=			'</tr>';
	
	
	$('#incometable').html(output);
	

	//요약문 작성
	var firstresult = '제 1 선택영역의 ';
	var incomeresult = '평균 소득은 ' + monthincome.toFixed(0) + '이며 ' + '소득지수는' + incomerate.toFixed(0) + '입니다' + '<br>';  
	var income2result = '소비 비율은 같습니다.';
	var incomearray = [parseFloat(foodrate),parseFloat(clothrate),parseFloat(livingrate),parseFloat(medirate),parseFloat(transportrate),parseFloat(hobbyrate),parseFloat(culturerate),parseFloat(edurate),parseFloat(playrate)];
	var incomearray2 = ['식료품','의류','생활용품','의료품','교통','여가','문화','교육','유흥'];
	var incomeflag = parseFloat(playrate);
	var incomeflag2 = '식료품';
	var incomecount = 0;
	
	//소비비교
	for (var i = 0 ; i < incomearray.length ; i++) {
		
		if (incomeflag < incomearray[i]) {
			incomeflag = incomearray[i];
			incomeflag2 = incomearray2[i];
			incomecount++;
		}
		if (incomeflag > incomearray[i]) {
			incomecount++;
		}
	}
		
		if (incomecount > 0) {
		income2result = ' 소비는 ' +  incomeflag2 + '이(가	)' + incomeflag.toFixed(1)  +'%로  제일 높습니다.';
		}
		
		firstresult += incomeresult + income2result;
		
		$('#incomeresult').html(firstresult);
	}
}