
	function offer(offerdata) {
	
		reset();
		
		var focusset = '';
		/*
		focusset += '<a data-target="#focus1" class="focuspoint">1.평균 영업 개월수</a>';
		focusset += '<a data-target="#focus2" class="focuspoint">2.생존율</a>';
		focusset += '<a data-target="#focus3" class="focuspoint">3.주중매출 비교</a>';
		*/
		focusset += '<a data-target="#focus4" class="focuspoint">1.시간대별 매출비교</a>';
		focusset += '<a data-target="#focus5" class="focuspoint">2.성별간 매출비교</a>';
		focusset += '<a data-target="#focus6" class="focuspoint">3.연령대별 매출비교</a>';
		
		$('#focustable').html(focusset);
		
		$(function() {		

			$.ajax({
				url : 'selectoffer',
				type : 'get',
				data : {
				'sigungu_cd' : offerdata.sigungu_cd,
				'sales_divison_s_cd' : offerdata.sales_divison_s_cd
				},
				success : function(res) {
					tableset();
					selectoffer(res);
					mvswsales(res);
					agesales(res);
				},
				error : function(res) {
					alert('error');
				}
			});	
		
			$(".focuspoint").click(function(){
				var scrollPosition = $($(this).attr("data-target")).offset().top;
				
				$("body").animate({
					scrollTop : scrollPosition
				}, 500);
				
			});
			
	});
		
		function tableset() {
			var tablereset = '<br>';
			tablereset += '<a name="focus1" class="focus" id="focus4">1.시간대별 매출비교</a><br>'
			tablereset += '<table class ="table">'
			tablereset += '<tr>'
			tablereset += '<td><div id="salestimechart"></div></td>'
			tablereset += '<td><div id="salestime2chart"></div></td>'
			tablereset += '</tr>'
			tablereset += '</table class ="table">'				
			tablereset += '<table id="salestimetable" class ="table"></table>'
			tablereset += '<table class ="table">'
			tablereset += 	'<tr>'
			tablereset += 		'<td>분석결과</td>'
			tablereset += 		'<td id="timesalesresult"></td>'
			tablereset += 	'</tr>'
			tablereset += '</table class ="table"><br>'
			tablereset += '<a name="focus1" class="focus" id="focus5">2.성별간 매출비교</a><br>'
			tablereset += '<table>'
			tablereset += '<tr>'
			tablereset += '<td><div id="salesmvswchart"></div></td>'
			tablereset += '<td><div id="salesmvsw2chart"></div></td>'
			tablereset += '</tr>'
			tablereset += '</table>'	
			tablereset += '<table id="salesmvswtable" class ="table"></table>'
			tablereset += '<table class ="table">'
			tablereset += 	'<tr>'
			tablereset += 		'<td>분석결과</td>'
			tablereset += 		'<td id="timemvswresult"></td>'
			tablereset += 	'</tr>'
			tablereset += '</table class ="table"><br>'
			tablereset += '<a name="focus1" class="focus" id="focus6">3.연령대별 매출비교</a><br>'
			tablereset += '<table class ="table">'
			tablereset += '<tr>'
			tablereset += '<td><div id="agesaleschart"></div></td>'
			tablereset += '<td><div id="agesales2chart"></div></td>'
			tablereset += '</tr>'
			tablereset += '</table class ="table">'	
			tablereset += '<table id="agesalestable" class ="table"></table>'
			tablereset += '<table class ="table">'
			tablereset += 	'<tr>'
			tablereset += 		'<td>분석결과</td>'
			tablereset += 		'<td id="agesalesresult"></td>'
			tablereset += 	'</tr>'
			tablereset += '</table>' 				
							
			$('#defaulttable').html(tablereset);	
		
		}
		
		function selectoffer(data) {
		
			//데이터 추출
			var montharray = new Array;
			
			$(data).each(function (index,item) {
				montharray[index] = item;
			});
			
			var month1 = montharray[0];
			var month2 = montharray[1];
			var month3 = montharray[2];
			var month4 = montharray[3];
			
			//매출 변수
			var timeall1 = (month1.TIME1 + month2.TIME1 + month3.TIME1 + month4.TIME1) / 4;
			var timeall2 = (month1.TIME2 + month2.TIME2 + month3.TIME2 + month4.TIME2) / 4;
			var timeall3 = (month1.TIME3 + month2.TIME3 + month3.TIME3 + month4.TIME3) / 4;
			var timeall4 = (month1.TIME4 + month2.TIME4 + month3.TIME4 + month4.TIME4) / 4;
			var timeall5 = (month1.TIME5 + month2.TIME5 + month3.TIME5 + month4.TIME5) / 4;
			var timeall6 = (month1.TIME6 + month2.TIME6 + month3.TIME6 + month4.TIME6) / 4;
			var timeall = timeall1 + timeall2 + timeall3 + timeall4 + timeall5 + timeall6;
			var time1rate = (timeall1 / timeall) * 100;
			var time2rate = (timeall2 / timeall) * 100;
			var time3rate = (timeall3 / timeall) * 100;
			var time4rate = (timeall4 / timeall) * 100;
			var time5rate = (timeall5 / timeall) * 100;
			var time6rate = (timeall6 / timeall) * 100;
			var timeallrate = time1rate + time2rate + time3rate + time4rate + time5rate + time6rate;
			//매출건수 변수
			var timecntall1 = (month1.SALES_CNT_TIME1 + month2.SALES_CNT_TIME1 + month3.SALES_CNT_TIME1 + month4.SALES_CNT_TIME1)/4;
			var timecntall2 = (month1.SALES_CNT_TIME2 + month2.SALES_CNT_TIME2 + month3.SALES_CNT_TIME2 + month4.SALES_CNT_TIME2)/4;
			var timecntall3 = (month1.SALES_CNT_TIME3 + month2.SALES_CNT_TIME3 + month3.SALES_CNT_TIME3 + month4.SALES_CNT_TIME3)/4;
			var timecntall4 = (month1.SALES_CNT_TIME4 + month2.SALES_CNT_TIME4 + month3.SALES_CNT_TIME4 + month4.SALES_CNT_TIME4)/4;
			var timecntall5 = (month1.SALES_CNT_TIME5 + month2.SALES_CNT_TIME5 + month3.SALES_CNT_TIME5 + month4.SALES_CNT_TIME5)/4;
			var timecntall6 = (month1.SALES_CNT_TIME6 + month2.SALES_CNT_TIME6 + month3.SALES_CNT_TIME6 + month4.SALES_CNT_TIME6)/4;
			var timecntall = timecntall1 + timecntall2 + timecntall3 + timecntall4 + timecntall5 + timecntall6;
			var timecnt1rate = (timecntall1 / timecntall)*100;
			var timecnt2rate = (timecntall2 / timecntall)*100;
			var timecnt3rate = (timecntall3 / timecntall)*100;
			var timecnt4rate = (timecntall4 / timecntall)*100;
			var timecnt5rate = (timecntall5 / timecntall)*100;
			var timecnt6rate = (timecntall6 / timecntall)*100;
			var timecntallrate = timecnt1rate + timecnt2rate + timecnt3rate + timecnt4rate + timecnt5rate + timecnt6rate;
			
			//시간대별 매출액
			var timecontainer = document.getElementById('salestimechart');

				var timedata = {
				    categories: ['0 ~ 6시','6 ~ 12시','12 ~ 15시','15 ~ 18시','18 ~ 21시','21 ~ 24시'],
				    series: []
				}; 
			
			$(montharray).each(function (index, item) {
				var temp = {
			            name: (item.FIXED_MONTH + '월'),
			            data: [item.TIME1,item.TIME2,item.TIME3,item.TIME4,item.TIME5,item.TIME6]
			        }
				timedata.series.push(temp);
			});	
				
			var timeoptions = {
					
					chart: {width: 700, height: 400, title: '시간대별매출비교'},
					yAxis: {title: '매출'}
				};
					
			tui.chart.lineChart(timecontainer, timedata, timeoptions);
			
			
			//시간대별 매출건수
			var time2container = document.getElementById('salestime2chart');

			var time2data = {
			    categories: ['0 ~ 6시','6 ~ 12시','12 ~ 15시','15 ~ 18시','18 ~ 21시','21 ~ 24시'],
			    series: []
			}; 
		
			$(montharray).each(function (index, item) {
				var temp = {
		            name: (item.FIXED_MONTH + '월'),
		            data: [item.SALES_CNT_TIME1,item.SALES_CNT_TIME2,item.SALES_CNT_TIME3,item.SALES_CNT_TIME4,item.SALES_CNT_TIME5,item.SALES_CNT_TIME6]
		        }
			time2data.series.push(temp);
			});	
			
			var time2options = {
				
				chart: {width: 700, height: 400, title: '시간대별매출건수비교'},
				yAxis: {title: '매출건수'}
			};
				
			tui.chart.columnChart(time2container, time2data, time2options); 
			
			output = '';
			output+= '<caption>4개월간 시간대별 평균매출</caption>'
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
			output+=			'<td rowspan="4">제1선택영역</td>';
			output+=			'<td>원</td>';
			output+=			'<td>'+ timeall.toFixed(0) +'</td>';
			output+=				'<td>'+ timeall1.toFixed(0)+'</td>';
			output+=				'<td>'+ timeall2.toFixed(0)+'</td>';
			output+=				'<td>'+ timeall3.toFixed(0)+'</td>';
			output+=				'<td>'+ timeall4.toFixed(0)+'</td>';
			output+=				'<td>'+ timeall5.toFixed(0)+'</td>';
			output+=				'<td>'+ timeall6.toFixed(0)+'</td>';
			output+=		'</tr>';
			output+=		'<tr>';
			output+=			'<td>매출비율</td>';
			output+=				'<td>'+ timeallrate.toFixed(0) +'%</td>';
			output+=				'<td>'+ time1rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ time2rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ time3rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ time4rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ time5rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ time6rate.toFixed(1)+'%</td>';
			output+=			'</tr>';
			output+=		'<tr>';
			output+=			'<td>건수</td>';
			output+=			'<td>'+ timecntall.toFixed(0) +'</td>';
			output+=				'<td>'+ timecntall1.toFixed(0)+'</td>';
			output+=				'<td>'+ timecntall2.toFixed(0)+'</td>';
			output+=				'<td>'+ timecntall3.toFixed(0)+'</td>';
			output+=				'<td>'+ timecntall4.toFixed(0)+'</td>';
			output+=				'<td>'+ timecntall5.toFixed(0)+'</td>';
			output+=				'<td>'+ timecntall6.toFixed(0)+'</td>';
			output+=		'</tr>';
			output+=        '<tr>'
			output+=			'<td>매출건수비율</td>';
			output+=				'<td>'+ timecntallrate.toFixed(0) +'%</td>';
			output+=				'<td>'+ timecnt1rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ timecnt2rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ timecnt3rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ timecnt4rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ timecnt5rate.toFixed(1)+'%</td>';
			output+=				'<td>'+ timecnt6rate.toFixed(1)+'%</td>';
			output+=		'</tr>';
			
			
			$('#salestimetable').append(output);	

		//요약문 작성
		var firstresult='';
		var timeresult = '매출의 비율이 같습니다.';
		var timearray = [parseFloat(time1rate),parseFloat(time2rate),parseFloat(time3rate),parseFloat(time4rate),parseFloat(time5rate),parseFloat(time6rate)];
		var timecntarray = [parseFloat(timecnt1rate),parseFloat(timecnt2rate),parseFloat(timecnt3rate),parseFloat(timecnt4rate),parseFloat(timecnt5rate),parseFloat(timecnt6rate)];
		var timearray2 = ['00 ~ 06시', '06 ~ 12시', '12 ~ 15시', '15 ~ 18시', '18 ~ 21시', '21 ~ 24시']
		var timeflag = parseFloat(time6rate);
		var timecntflag = parseFloat(timecnt6rate);
		var timeflag2 = '21 ~ 24시';
		var timecntflag2 = '21 ~ 24시';
		
		//시간대별매출비교
		$(timearray).each(function(index,item){
			if (timeflag < item) {
				timeflag = item;
				timeflag2 = timearray2[index];
			}
		});
		$(timecntarray).each(function (index,item) {
			if (timecntflag < item) {
				timecntflag = item;
				timecntflag2 = timearray2[index];
			}
		});
		
		timeresult = timeflag2 + ' 시간대에 ' + timeflag.toFixed(1) + '%로 매출이 집중되어있습니다.';
		timeresult2 = timecntflag2 + ' 시간대에 ' + timecntflag.toFixed(1) + '%로 매출건수가 집중되어있습니다.';
		
		
		//결론
		firstresult += '제 1선택영역의 평균 시간대 매출은 ' + timeresult + '<br>';
		firstresult += '제 1선택영역의 평균 시간대 매출건수는 ' + timeresult2;
		
		$('#timesalesresult').html(firstresult);
		
		}
		
		//성별
		function mvswsales(data) {

			//데이터 추출
			var montharray = new Array;
			
			$(data).each(function (index,item) {
				montharray[index] = item;
			});
			
			var month1 = montharray[0];
			var month2 = montharray[1];
			var month3 = montharray[2];
			var month4 = montharray[3];
			
			//성별변수
			var manall = (month1.MAN + month2.MAN + month3.MAN + month4.MAN)/4;
			var womanall = (month1.WOMAN + month2.WOMAN + month3.WOMAN + month4.WOMAN)/4;
			var mvswall = manall + womanall;
			var manrate = (manall / mvswall)*100;
			var womanrate = (womanall / mvswall)*100;
			var mvswallrate = manrate + womanrate;
			
			//성별 매출 건수 변수
			var mancntall = (month1.MAN_CNT + month2.MAN_CNT + month3.MAN_CNT + month4.MAN_CNT)/4;
			var womancntall = (month1.WOMAN_CNT + month2.WOMAN_CNT + month3.WOMAN_CNT + month4.WOMAN_CNT)/4;
			var mvswcntall = mancntall + womancntall;
			var mancntrate = (mancntall / mvswcntall)*100;
			var womancntrate = (womancntall / mvswcntall)*100;
			var mvswcntallrate = mancntrate + womancntrate;
			
		//성별매출	
		var mvswcontainer = document.getElementById('salesmvswchart');

			var mvswdata = {
			    categories: ['남자','여자'],
			    series: []
			}; 
		
		$(montharray).each(function (index, item) {
			var temp = {
		            name: (item.FIXED_MONTH + '월'),
		            data: [item.MAN,item.WOMAN]
		        }
			mvswdata.series.push(temp);
		});	
			
		var mvswoptions = {
				
				chart: {width: 700, height: 400, title: '성별간매출비교'},
				yAxis: {title: '매출'}
			};
				
		tui.chart.columnChart(mvswcontainer, mvswdata, mvswoptions);
		
		//성별 건수
		var mvswcntcontainer = document.getElementById('salesmvsw2chart');

			var mvswcntdata = {
			    categories: ['남자','여자'],
			    series: []
			}; 
		
		$(montharray).each(function (index, item) {
			var temp = {
		            name: (item.FIXED_MONTH + '월'),
		            data: [item.MAN_CNT,item.WOMAN_CNT]
		        }
			mvswcntdata.series.push(temp);
		});	
			
		var mvswcntoptions = {
				
				chart: {width: 700, height: 400, title: '성별간매출건수비교'},
				yAxis: {title: '매출'}
			};
				
		tui.chart.columnChart(mvswcntcontainer, mvswcntdata, mvswcntoptions);
		
		
		output = '';
		output+= '<caption>4개월간 성별간 평균매출</caption>'
		output+= 		'<tr>';
		output+=			'<td rowspan="2">지역</td>';
		output+=			'<td rowspan="2">구분</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>전체</td>';
		output+=			'<td>남자</td>';
		output+=			'<td>여자</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td rowspan="4">제1선택영역</td>';
		output+=			'<td>원</td>';
		output+=			'<td>'+ mvswall.toFixed(0) +'</td>';
		output+=				'<td>'+ manall.toFixed(0)+'</td>';
		output+=				'<td>'+ womanall.toFixed(0)+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>비율</td>';
		output+=				'<td>'+ mvswallrate.toFixed(0) +'%</td>';
		output+=				'<td>'+ manrate.toFixed(1)+'%</td>';
		output+=				'<td>'+ womanrate.toFixed(1)+'%</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>건수</td>';
		output+=			'<td>'+ mvswcntall.toFixed(0) +'</td>';
		output+=				'<td>'+ mancntall.toFixed(0)+'</td>';
		output+=				'<td>'+ womancntall.toFixed(0)+'</td>';
		output+=		'</tr>';
		output+=		'<tr>';
		output+=			'<td>비율</td>';
		output+=				'<td>'+ mvswcntallrate.toFixed(0) +'%</td>';
		output+=				'<td>'+ mancntrate.toFixed(1)+'%</td>';
		output+=				'<td>'+ womancntrate.toFixed(1)+'%</td>';
		output+=			'</tr>';
		 
		$('#salesmvswtable').append(output);	


		
		// 요약문 작성
		var secondresult = '';
		var mvswresult = '매출의 비율이 같습니다.';
		var mvswarray = [ parseFloat(manrate), parseFloat(womanrate) ];
		var mvswarray2 = [ '남자', '여자' ]
		var mvswflag = parseFloat(womanrate);
		var mvswflag2 = '여자';

		// 시간대별매출비교
		$(mvswarray).each(function(index, item) {
			if (mvswflag < item) {
				mvswflag = item;
				mvswflag2 = mvswarray2[index];
			}
		});

		mvswresult = mvswflag2 + '가 ' + mvswflag.toFixed(1)
				+ '%로 매출이 집중되어있습니다.';

		// 결론
		secondresult += '제 1선택영역의 평균 성별 간 매출은 ' + mvswresult;
		$('#timemvswresult').html(secondresult);
	
		
		}
		
		function agesales(data) {
			
			//데이터 추출
			var montharray = new Array;
			
			$(data).each(function (index,item) {
				montharray[index] = item;
			});
			
			var month1 = montharray[0];
			var month2 = montharray[1];
			var month3 = montharray[2];
			var month4 = montharray[3];
			
			//연령변수
			var age10 = (month1.AGESALE10 + month2.AGESALE10 + month3.AGESALE10 + month4.AGESALE10) / 4;
			var age20 = (month1.AGESALE20 + month2.AGESALE20 + month3.AGESALE20 + month4.AGESALE20) / 4;
			var age30 = (month1.AGESALE30 + month2.AGESALE30 + month3.AGESALE30 + month4.AGESALE30) / 4;
			var age40 = (month1.AGESALE40 + month2.AGESALE40 + month3.AGESALE40 + month4.AGESALE40) / 4;
			var age50 = (month1.AGESALE50 + month2.AGESALE50 + month3.AGESALE50 + month4.AGESALE50) / 4;
			var age60 = (month1.AGESALE60 + month2.AGESALE60 + month3.AGESALE60 + month4.AGESALE60) / 4;
			var ageall = age10 + age20 + age30 + age40 + age50 + age60;
			
			var age10rate = (age10 / ageall) * 100;
			var age20rate = (age20 / ageall) * 100;
			var age30rate = (age30 / ageall) * 100;
			var age40rate = (age40 / ageall) * 100;
			var age50rate = (age50 / ageall) * 100;
			var age60rate = (age60 / ageall) * 100;
			var ageallrate = age10rate + age20rate + age30rate + age40rate + age50rate + age60rate;
			
			//연령 매출 건수 변수
			var age10cnt = (month1.AGE_CNT_10 + month2.AGE_CNT_10 + month3.AGE_CNT_10 + month4.AGE_CNT_10) / 4;
			var age20cnt = (month1.AGE_CNT_20 + month2.AGE_CNT_20 + month3.AGE_CNT_20 + month4.AGE_CNT_20) / 4;
			var age30cnt = (month1.AGE_CNT_30 + month2.AGE_CNT_30 + month3.AGE_CNT_30 + month4.AGE_CNT_30) / 4;
			var age40cnt = (month1.AGE_CNT_40 + month2.AGE_CNT_40 + month3.AGE_CNT_40 + month4.AGE_CNT_40) / 4;
			var age50cnt = (month1.AGE_CNT_50 + month2.AGE_CNT_50 + month3.AGE_CNT_50 + month4.AGE_CNT_50) / 4;
			var age60cnt = (month1.AGE_CNT_60 + month2.AGE_CNT_60 + month3.AGE_CNT_60 + month4.AGE_CNT_60) / 4;
			var agecntall = age10cnt + age20cnt + age30cnt + age40cnt + age50cnt + age60cnt;
			
			var age10cntrate = (age10cnt / agecntall) * 100;
			var age20cntrate = (age20cnt / agecntall) * 100;
			var age30cntrate = (age30cnt / agecntall) * 100;
			var age40cntrate = (age40cnt / agecntall) * 100;
			var age50cntrate = (age50cnt / agecntall) * 100;
			var age60cntrate = (age60cnt / agecntall) * 100;
			var agecntallrate = age10cntrate + age20cntrate + age30cntrate + age40cntrate + age50cntrate + age60cntrate; 
			
		//연령매출	
		var agecontainer = document.getElementById('agesaleschart');

		var agedata = {
			categories : [ '10대', '20대', '30대', '40대', '50대', '60대이상'],
			series : []
		};

		$(montharray).each(function(index, item) {
			var temp = {
				name : (item.FIXED_MONTH + '월'),
				data : [ item.AGESALE10, item.AGESALE20, item.AGESALE30, item.AGESALE40, item.AGESALE50, item.AGESALE60 ]
			}
			agedata.series.push(temp);
		});

		var ageoptions = {

			chart : {
				width : 700,
				height : 400,
				title : '연령대별매출비교'
			},
			yAxis : {
				title : '매출'
			}
		};

		tui.chart.columnChart(agecontainer, agedata, ageoptions);

		//성별 건수
		var agecntcontainer = document.getElementById('agesales2chart');

		var agecntdata = {
			categories : [ '10대', '20대', '30대', '40대', '50대', '60대이상'],
			series : []
		};

		$(montharray).each(function(index, item) {
			var temp = {
				name : (item.FIXED_MONTH + '월'),
				data : [ item.AGE_CNT_10, item.AGE_CNT_20, item.AGE_CNT_30, item.AGE_CNT_40, item.AGE_CNT_50, item.AGE_CNT_60 ]
			}
			agecntdata.series.push(temp);
		});

		var agecntoptions = {

			chart : {
				width : 700,
				height : 400,
				title : '연령대매출건수비교'
			},
			yAxis : {
				title : '매출'
			}
		};

		tui.chart.columnChart(agecntcontainer, agecntdata, agecntoptions);

		output = '';
		output += '<caption>4개월간 연령대별 평균매출</caption>'
		output += '<tr>';
		output += '<td rowspan="2">지역</td>';
		output += '<td rowspan="2">구분</td>';
		output += '</tr>';
		output += '<tr>';
		output += '<td>전체</td>';
		output += '<td>10대</td>';
		output += '<td>20대</td>';
		output += '<td>30대</td>';
		output += '<td>40대</td>';
		output += '<td>50대</td>';
		output += '<td>60대</td>';
		output += '</tr>';
		output += '<tr>';
		output += '<td rowspan="4">제1선택영역</td>';
		output += '<td>원</td>';
		output += '<td>' + ageall.toFixed(0) + '</td>';
		output += '<td>' + age10.toFixed(0) + '</td>';
		output += '<td>' + age20.toFixed(0) + '</td>';
		output += '<td>' + age30.toFixed(0) + '</td>';
		output += '<td>' + age40.toFixed(0) + '</td>';
		output += '<td>' + age50.toFixed(0) + '</td>';
		output += '<td>' + age60.toFixed(0) + '</td>';
		output += '</tr>';
		output += '<tr>';
		output += '<td>비율</td>';
		output += '<td>' + ageallrate.toFixed(0) + '%</td>';
		output += '<td>' + age10rate.toFixed(1) + '%</td>';
		output += '<td>' + age20rate.toFixed(1) + '%</td>';
		output += '<td>' + age30rate.toFixed(1) + '%</td>';
		output += '<td>' + age40rate.toFixed(1) + '%</td>';
		output += '<td>' + age50rate.toFixed(1) + '%</td>';
		output += '<td>' + age60rate.toFixed(1) + '%</td>';
		output += '</tr>';
		output += '<tr>';
		output += '<td>건수</td>';
		output += '<td>' + agecntall.toFixed(0) + '</td>';
		output += '<td>' + age10cnt.toFixed(0) + '</td>';
		output += '<td>' + age20cnt.toFixed(0) + '</td>';
		output += '<td>' + age30cnt.toFixed(0) + '</td>';
		output += '<td>' + age40cnt.toFixed(0) + '</td>';
		output += '<td>' + age50cnt.toFixed(0) + '</td>';
		output += '<td>' + age60cnt.toFixed(0) + '</td>';
		output += '</tr>';
		output += '<tr>';
		output += '<td>비율</td>';
		output += '<td>' + agecntallrate.toFixed(0) + '%</td>';
		output += '<td>' + age10cntrate.toFixed(1) + '%</td>';
		output += '<td>' + age20cntrate.toFixed(1) + '%</td>';
		output += '<td>' + age30cntrate.toFixed(1) + '%</td>';
		output += '<td>' + age40cntrate.toFixed(1) + '%</td>';
		output += '<td>' + age50cntrate.toFixed(1) + '%</td>';
		output += '<td>' + age60cntrate.toFixed(1) + '%</td>';
		output += '</tr>';

		$('#agesalestable').append(output);

		// 요약문 작성
		var secondresult = '';
		var ageresult = '매출의 비율이 같습니다.';
		var ageresult2 = '매출건수 비율이 같습니다.';
		var agearray = [ parseFloat(age10rate), parseFloat(age20rate), parseFloat(age30rate), parseFloat(age40rate), parseFloat(age50rate), parseFloat(age60rate)];
		var agecntarray = [ parseFloat(age10cntrate), parseFloat(age20cntrate), parseFloat(age30cntrate), parseFloat(age40cntrate), parseFloat(age50cntrate), parseFloat(age60cntrate)];
		var agearray2 = [ '10대', '20대', '30대', '40대', '50대', '60대' ]
		var ageflag = parseFloat(age60rate);
		var ageflag2 = '60대';
		var agecntflag = parseFloat(age60cntrate);
		var agecntflag2 = '60대';

		// 시간대별매출비교
		$(agearray).each(function(index, item) {
			if (ageflag < item) {
				ageflag = item;
				ageflag2 = agearray2[index];
			}
		});
		
		$(agecntarray).each(function(index, item){
			if (agecntflag < item) {
				agecntflag = item;
				agecntflag2 = agearray2[index];
			}
		});
		
		ageresult = ageflag2 + '가 ' + ageflag.toFixed(1) + '%로 매출이 집중되어있습니다.';
		
		ageresult = agecntflag2 + '가' + agecntflag.toFixed(1) + '%로 매출건수가 집중되어있습니다.';
		
		// 결론
		secondresult += '제 1선택영역의 평균 연령대 간 매출은 ' + ageresult;
		$('#agesalesresult').html(secondresult);

	}
		
		
		
		
		
}