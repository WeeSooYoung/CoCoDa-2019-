
function total(param){
    
    reset();
    
    var date = new Date();
    var today = date.getFullYear()+'/'+(date.getMonth() + 1)+'/'+date.getDate();
    
    var total_table = '';
    total_table += '<br><br>';
    total_table += '<h2>'
    total_table +=		'설정 정보';
    total_table +=  '</h2>';
    total_table += '<br><br>'
    total_table += '<div id="staticMap" style = "width : 50%; height : 500px"></div>'
    total_table += '<br><br>';
    total_table +=         '<table class = "table">';
    total_table +=             '<tr>';
    total_table +=                 '<th style = "font-size : 15pt; text-align : center">';
    total_table +=                     '선택 지역';
    total_table +=                 '</th>';
    total_table +=                 '<th style = "font-size : 15pt; text-align : center">';
    total_table +=                     '해당 상권';
    total_table +=                 '</th>';
    total_table +=                 '<th style = "font-size : 15pt; text-align : center">';
    total_table +=                     '분석 업종';
    total_table +=                 '</th>';
    total_table +=                 '<th style = "font-size : 15pt; text-align : center">';
    total_table +=                     '분석 시점';
    total_table +=                 '</th>';
    total_table +=             '</tr>';
    total_table +=             '<tr>';
    total_table +=                 '<td style = "text-align : center"><span style = "font-size : 15pt">';
    total_table +=                     address;
    total_table +=                 '</span></td>';
    total_table +=                 '<td style = "text-align : center"><span style = "font-size : 15pt">';
    total_table +=                     sales_nm;
    total_table +=                 '</span></td>';
    total_table +=                 '<td style = "text-align : center"><span style = "font-size : 15pt">';
    total_table +=                     sales_division_s_nm;
    total_table +=                 '</span></td>';
    total_table +=                 '<td style = "text-align : center"><span style = "font-size : 15pt">';
    total_table +=                     today;
    total_table +=                 '</span></td>';
    total_table +=             '</tr>';
    total_table +=         '</table>';
    
    $('#result').html(total_table);
    
    var marker = 
    {
        position: new kakao.maps.LatLng(cy, cx), 
        text: '지정 영역' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
;
    
    var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div     
    staticMapOption = { 
            center: new kakao.maps.LatLng(cy, cx), // 이미지 지도의 중심좌표
            level: 3, // 이미지 지도의 확대 레벨
            marker : marker
        };
        
    
	// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
    
    total_table = '';
    
    
    $.ajax({
          url   : 'total',
          type  : 'get',
          data  : param,
          success : detailTable
    });
    
      function detailTable(res){
            console.log(res);
            
            var total = 10;
            
            // 성장성 - 25점
            var salesScales = res[0].salesScales;   // 상권 규모 15점
            var compare_salesScales = 20.0;
            var result_salesScales = salesScales * total / compare_salesScales;
            result_salesScales = Math.floor(result_salesScales);
            if(result_salesScales >= 10){
                result_salesScales = 9;
            }
            
            
            var avgGrowth = res[0].avgGrowth;       // 월 별 매출증감률 10점
            var compare_avgGrowth = 2.04;
            var result_avgGrowth = avgGrowth * total / compare_avgGrowth;
            result_avgGrowth = Math.floor(result_avgGrowth);
            if(result_avgGrowth >= 10){
                result_avgGrowth = 9;
            }
            
            var expectSales = res[0].expectSales;                   // 예상 성장률 10점
            var compare_expectSales = 100000000000
            var result_expectSales = expectSales * 5 / compare_expectSales;
            result_expectSales = Math.floor(result_expectSales);
            if(result_expectSales >= 5){
                result_expectSales = 4;
            }
            
            var result_Growrh = result_expectSales + result_avgGrowth + result_salesScales;
            
            var rank_growth = [result_expectSales,result_avgGrowth,result_salesScales];
            
            var rank_growth_message = '';
            
            rank_growth = rank_growth.sort();
            if(rank_growth[2] == result_expectSales){
                
                rank_growth_message = '예상 수익률' ;
                
            }else if(rank_growth[2] == result_avgGrowth){
                
                rank_growth_message = '매출 증감률';
                
            }else{
                
                rank_growth_message ='상권 매출 비중';
                
            };
            
            
            
            // 안정성 - 25점
            var growth = res[1].growth;               // 해당 업소 매출 증감률 5점
            var compare_growth = 10;
            var result_growth = growth * 5 / compare_growth;
            result_growth = Math.floor(result_growth);
            if(result_growth >= 5){
                result_growth = 4;
            };
            
            
            var operationYear = res[1].operationYear; // 운영년수 10점
            var compare_operationYear = 50;
            var result_operationYear = operationYear * total / compare_operationYear;
            result_operationYear = Math.floor(result_operationYear);
            if(result_operationYear >= 10){
                result_operationYear = 10;
            };
            
            var variation = res[1].variation;         // 변동성 10점
            var compare_variation = 3;
            var result_variation = (variation * total / compare_variation);
            result_variation = Math.floor(result_variation);
            if(result_variation >= 10){
                result_variation = 9;
            };
            
            var result_Stability = result_variation + result_operationYear + result_growth;
            
            var rank_stability = [result_variation,result_operationYear,result_growth];
            
            var rank_stability_message = '';
            
            rank_stability = rank_stability.sort();
            
            if(rank_stability[2] == result_variation){
                
                rank_stability_message = '변동성' ;
                
            }else if(rank_stability[2] == result_operationYear){
                
                rank_stability_message = '평균 운영년수';
                
            }else{
                
                rank_stability_message ='업종 매출 증감률';
            };
            
            
            
            // 집객력 - 25점
            var floatPop = res[2].floatPop;       // 유동인구 10점
            var compare_floatPop = 200;
            var result_floatPop = floatPop * total / compare_floatPop;
            result_floatPop = Math.floor(result_floatPop);
            if(result_floatPop >= 10){
                result_floatPop = 9;
            }
            
            
            var stayPop = res[2].stayPop;         // 거주인구 10점
            var compare_stayPop = 200;
            var result_stayPop = stayPop * total / compare_stayPop;
            result_stayPop = Math.floor(result_stayPop);
            if(result_stayPop >= 10){
                result_stayPop = 9;
            }
           
            var workerPop = res[2].workerPop;      // 직장인구 10점
            var compare_workerPop = 20;
            var result_workerPop = workerPop * 5 / compare_workerPop;
            result_workerPop = Math.floor(result_workerPop);
            if(result_workerPop >= 5){
                result_workerPop = 4;
            }
            
            var result_Collect = result_workerPop + result_stayPop + result_floatPop;   
            
            var rank_collect = [result_workerPop,result_stayPop,result_floatPop];
            
            var rank_collect_message = '';
            
            rank_collect = rank_collect.sort();
            
            if(rank_collect[2] == result_workerPop){
                
                rank_collect_message = '배후 직장인구' ;
                
            }else if(rank_collect[2] == result_stayPop){
                
                rank_collect_message = '배후 주거인구';
                
            }else{
                
                rank_collect_message ='유동인구';
            };
            
            
            //구매력 - 25점
            var cnt_price = res[3].cnt_price;       // 건당 결제금액 10점
            var compare_cnt_price = 20000;
            var result_cnt_price = cnt_price * total / compare_cnt_price;
            result_cnt_price = Math.floor(result_cnt_price);
            if(result_cnt_price >= 10){
                result_cnt_price = 9;
            }
            
            var income_level = res[3].income_level; // 소비수준 10점
            var compare_income_level = 7690000;
            var result_income_level = income_level * total / compare_income_level;
            result_income_level = Math.floor(result_income_level);
            if(result_income_level >= 10){
                result_income_level = 9;
            }
            
            var pur_scale =  salesScales * 5 / 20.0
            pur_scale = Math.floor(pur_scale);
            if(pur_scale >= 5){
                pur_scale = 4;
            }
            
            var result_Purchase = pur_scale + result_income_level + result_cnt_price;
            
            var rank_purchase = [pur_scale,result_income_level,result_cnt_price];
            
            var rank_purchase_message = '';
            
            rank_purchase = rank_purchase.sort();
            
            if(rank_purchase[2] == result_cnt_price){
                
                rank_purchase_message = '건당 매출 금액' ;
                
            }else if(rank_purchase[2] == result_income_level){
                
                rank_purchase_message = '소비 수준';
                
            }else{
                
                rank_purchase_message ='상권 매출규모';
            };
            
            
            var final_result = (result_Growrh + result_Stability + result_Collect + result_Purchase)/10;
            final_result = Math.floor(final_result);
            
            var final_grade = 0;
            
            switch (final_result) {
              case 10 : final_grade = 1;
                        break;
              case 9  : final_grade = 1;
                        break;
              case 8  : final_grade = 2;
                        break;
              case 7  : final_grade = 3;
                        break;
              case 6  : final_grade =  4;
                        break;
              default : final_grade = 5;
                        break;
            }
            
            
            var detail_table = '';
            detail_table +='<br><br>';
            detail_table += '<h2>종합 평가</h2>';
            detail_table += '<table>';
            detail_table +=     '<tr>'
            detail_table +=         '<td style="padding-left : 100px">'						
            detail_table +=             '<div id = "total_result_anal" style = "width : 400px; height : 320px;" ></div>'; 
            detail_table +=				'</div>';
            detail_table +=         '<td>'
            detail_table +=         '<td style="padding-left : 200px">'
            detail_table +=             '<h3>';
            detail_table +=                 '선택하신 영역은 '+ final_grade+' 등급 입니다.';
            detail_table +=             '</h3>';
            detail_table +=	'<br><br>';
            detail_table +=             '<p>';
            detail_table +=                 ' 인구 분석, 매출 분석, 집객 시설 등의 결과를 통해 나온 결과로 <br>1등급에 가까울 수록 창업 성공률이 높음을 의미합니다.';
            detail_table +=             '</p>';
            detail_table +=         '<td>'; 
            detail_table +=     '</tr>';
            detail_table += '</table>';
            detail_table += '<br><br><br>';
                
                
                
            detail_table += '<h2>세부 평가</h2>';
            detail_table += '<br><br>';
            detail_table += '<table class="table">';
            detail_table +=         '<colgroup>';
            detail_table +=             '<col style="width:7%">';
            detail_table +=             '<col style="width:7%">';
            detail_table +=             '<col style="width:35%">';
            detail_table +=             '<col style="width:12%">';
            detail_table +=             '<col style="width:7%">';
            detail_table +=             '<col>';
            detail_table +=        ' </colgroup>';
            detail_table +=        ' <tbody>';
            detail_table +=            '<tr>';
            detail_table +=                 '<th colspan="2" style = "text-align : center">구분</th>';
            detail_table +=                ' <th colspan="4" style = "text-align : center">내용</th>';
            detail_table +=             '</tr>';
            detail_table +=            ' <tr >';
            detail_table +=                ' <th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<span style = "font-size : 12pt">성장성</span>';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>(25점)</small>';
            detail_table +=                ' </th>';
            detail_table +=                 '<th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<strong>'+  result_Growrh  +'</strong>점';
            detail_table +=                 '</th>';
            detail_table +=                 '<td rowspan="4">';
            detail_table +=                       '<div id="Growth"></div>';          
            detail_table +=                 '</td>';
            detail_table +=                 '<th>';
            detail_table +=                    ' 매출 증감률';
            detail_table +=                    ' <br>';
            detail_table +=                     '<small>';
            detail_table +=                        ' (10점)';
            detail_table +=                     '</small>';
            detail_table +=                 '</th>';
            detail_table +=                 '<td>';
            detail_table +=                     '<strong> '+ result_salesScales +' </strong>점';
            detail_table +=                ' </td>';
            detail_table +=                ' <td style="text-align: left">';
            detail_table +=                     '- 전월 대비 매출 증감률';
            detail_table +=                 '</td>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th>';
            detail_table +=                     '상권 매출 비중<br>'
            detail_table +=                     '<small> (10점) </small>';           
            detail_table +=                ' </th>';
            detail_table +=                 '<td>';
            detail_table +=                     '<strong> '+ result_avgGrowth +' </strong>점';
            detail_table +=                 '</td>';
            detail_table +=                 '<td style="text-align: left">';
            detail_table +=                     '- 서울시 전체 상권 평균매출 대비 매출 비중';
            detail_table +=                 '</td>';
            detail_table +=            ' </tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th>예상 성장률<br><small> (5)점 </small> </th>';
            detail_table +=                 '<td><strong>' + result_expectSales + '</strong>점</td>';
            detail_table +=                 '<td>';
            detail_table +=                    '- 분기 성장 추이를 이용하여 다음 분기 성장 예정 추이';
            detail_table +=                 '</td>';
            detail_table +=            ' </tr>';
            detail_table +=            ' <tr>';
            detail_table +=                 '<td colspan="3" style="padding-top : 60px;text-align: center; font-size : 14pt">';
            detail_table +=                     '성장성 지수 산출항목 중 ';
            detail_table +=                     '<strong>' + rank_growth_message + '</strong>';
            detail_table +=                     '의 비중이 상대적으로 높습니다';
            detail_table +=                 '</td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<span style = "font-size : 12pt"> 안정성</span>';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>(25점)</small>';
            detail_table +=                ' </th>';
            detail_table +=                 '<th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<strong>' + result_Stability + '</strong>점'
            detail_table +=                 '</th>'
            detail_table +=                 '<td rowspan="4">'
            detail_table +=                    ' <div id="Stability"></div>'
            detail_table +=                 '</td>';
            detail_table +=                 '<th>';
            detail_table +=                     '업소 매출 증감률';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>';
            detail_table +=                        ' (5점)';
            detail_table +=                     '</small>';
            detail_table +=                ' </th>';
            detail_table +=                ' <td>';
            detail_table +=                     '<strong> '+ result_growth +' </strong>점';
            detail_table +=                 '</td>';
            detail_table +=                 '<td style="text-align: left">';
            detail_table +=                    ' - 전월 대비 동종 업종 매출 증감률';
            detail_table +=                 '</td>';
            detail_table +=           '  <tr>';
            detail_table +=                 '<th>';
            detail_table +=                     '평균 운영년수';
            detail_table +=                     '<br>';
            detail_table +=                    ' <small>';
            detail_table +=                        ' (10점)';
            detail_table +=                    ' </small>';
            detail_table +=                 '</th>';
            detail_table +=                ' <td>';
            detail_table +=                     '<strong> '+result_operationYear+' </strong>점';
            detail_table +=                 '</td>';
            detail_table +=                 '<td style="text-align: left">'
            detail_table +=                     '- 상권 내 동일 업종 평균 운영년수';
            detail_table +=                ' </td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th>변동성<br><small>(10점)</small></th>';
            detail_table +=                 '<td><strong>'+result_variation+'</strong>점</td>';
            detail_table +=                 '<td>';
            detail_table +=                     '- 상권 내 월별 점포수 변동성'; 
            detail_table +=                 '</td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                ' <td colspan="3" style="padding-top : 60px;text-align: center; font-size : 14pt">';
            detail_table +=                     '안정성 지수 산출항목 중 ';
            detail_table +=                     '<strong>'+ rank_stability_message +'</strong>';
            detail_table +=                     '의 비중이 상대적으로 높습니다';
            detail_table +=                 '</td>';
            detail_table +=            ' </tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th rowspan="4" style="padding-top:200px;">';
            detail_table +=                    '<span style = "font-size : 12pt"> 구매력 </span>';
            detail_table +=                    ' <br>';
            detail_table +=                     '<small>(25점)</small>';
            detail_table +=                 '</th>';
            detail_table +=                 '<th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<strong>' + result_Purchase + '</strong>점';
            detail_table +=                 '</th>';
            detail_table +=                 '<td rowspan="4">';
            detail_table +=                     '<div id = "Purchasing"></div>';
            detail_table +=                 '</td>';
            detail_table +=                 '<th>';
            detail_table +=                     '상권 매출규모';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>';
            detail_table +=                         '(5점)';
            detail_table +=                     '</small>';
            detail_table +=                ' </th>';
            detail_table +=                 '<td>';
            detail_table +=                     '<strong> '+ pur_scale +' </strong>';
            detail_table +=                     '점';
            detail_table +=                 '</td>';
            detail_table +=                 '<td style="text-align: left">';
            detail_table +=                     '- 서울시 전체 상권 평균매출 대비 매출 비중';
            detail_table +=                 '</td>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th>';
            detail_table +=                     '건당 매출 금액';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>';
            detail_table +=                         '(10점)';
            detail_table +=                     '</small>';
            detail_table +=                 '</th>';
            detail_table +=                 '<td>';
            detail_table +=                     '<strong> '+ result_cnt_price +' </strong>점';
            detail_table +=                 '</td>';
            detail_table +=                 '<td style="text-align: left">';
            detail_table +=                     '- 상권 내 평균 건당 매출 금액';
            detail_table +=                ' </td>';
            detail_table +=            ' </tr>';
            detail_table +=            ' <tr>'
            detail_table +=                 '<th>소비 수준<br><small>(10점)</small></th>';
            detail_table +=                 '<td><strong>'+result_income_level+'</strong>점</td>';
            detail_table +=                 '<td>';
            detail_table +=                     '- 상권 내 평균 수입';
            detail_table +=                 '</td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<td colspan="3" style="padding-top : 60px;text-align: center; font-size : 14pt">';
            detail_table +=                     '구매력 지수 산출항목 중 ';
            detail_table +=                     '<strong>'+ rank_purchase_message +'</strong>';
            detail_table +=                     ' 의 비중이 상대적으로 높습니다';
            detail_table +=                 '</td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<span style = "font-size : 12pt"> 집객력</span>';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>(25)점</small>';
            detail_table +=                 '</th>';
            detail_table +=                ' <th rowspan="4" style="padding-top:200px;">';
            detail_table +=                     '<strong> '+ result_Collect +' </strong>점';
            detail_table +=                 '</th>';
            detail_table +=                 '<td rowspan="4">';
            detail_table +=                     '<div id = "Collecting">';
            detail_table +=                     '</div>';
            detail_table +=                 '</td>';
            detail_table +=                 '<th>';
            detail_table +=                    ' 유동인구';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>';
            detail_table +=                         '(10)점';
            detail_table +=                     '</small>';
            detail_table +=                ' </th>';
            detail_table +=                ' <td>';
            detail_table +=                    ' <strong> '+result_floatPop+' </strong>';
            detail_table +=                   '점';
            detail_table +=                ' </td>';
            detail_table +=                 '<td style="text-align: left">';
            detail_table +=                     '- 상권 내 평균 유동인구';
            detail_table +=                 '</td>';
            detail_table +=             '<tr>';
            detail_table +=                ' <th>';
            detail_table +=                     '배후 주거인구';
            detail_table +=                    ' <br>';
            detail_table +=                     '<small>';
            detail_table +=                         '(10)점';
            detail_table +=                    ' </small>';
            detail_table +=                ' </th>';
            detail_table +=                 '<td>';
            detail_table +=                     '<strong> '+ result_stayPop +' </strong>점';
            detail_table +=                 '</td>';
            detail_table +=                 '<td style="text-align: left">';
            detail_table +=                     '- 상권 내 배후 주거인구';
            detail_table +=                 '</td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<th>배후 직장인구';
            detail_table +=                     '<br>';
            detail_table +=                     '<small>';
            detail_table +=                         '(5)점';
            detail_table +=                     '</small>';
            detail_table +=                ' </th>';
            detail_table +=                 '<td>';
            detail_table +=                     '<strong> '+ result_workerPop +' </strong>점';
            detail_table +=                 '</td>';    
            detail_table +=                 '<td>';
            detail_table +=                     '- 상권 내 배후 직장인구';
            detail_table +=                 '</td>';
            detail_table +=             '</tr>';
            detail_table +=             '<tr>';
            detail_table +=                 '<td colspan="3" style="padding-top : 60px;text-align: center; font-size : 14pt">';
            detail_table +=                     '집객력 지수 산출항목 중 ';
            detail_table +=                     '<strong>'+rank_collect_message+'</strong>';
            detail_table +=                     ' 의 비중이 상대적으로 높습니다';
            detail_table +=                ' </td>';
            detail_table +=             '</tr>';
            detail_table +=         '</tbody>';
            detail_table +=     '</table>';
            
            $('#focustable').html(detail_table);
            
            var growth_container = document.getElementById('Growth');
            
            var growth_data = {
                    categories: ["매출 증감률", "상권 매출 비중", "예상 성장률"],
                    series: [
                        {
                            name: 'Growth',
                            data: [result_avgGrowth, result_salesScales, result_expectSales]
                        },
                        
                    ]
           };
            var growth_options = {
                chart: {
                    title: 'Growth',
                    width: 500,
                    height: 500
                },
                series: {
                    showDot: false,
                    showArea: false
                },
                plot: {
                    type: 'circle'
                },
                legend: {
                    align: 'bottom'
                }
            };
            var theme = {
                series: {
                    colors: [
                        '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                        '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
                    ]
                }
            };

            tui.chart.radialChart(growth_container, growth_data, growth_options);
            //
            
            var stability_container = document.getElementById('Stability');
            
            var stability_data = {
                    categories: ["변동성", "평균 운영 년수", "업소 매출 증감률"],
                    series: [
                        {
                            name: 'Stability',
                            data: [result_variation, result_operationYear, result_growth]
                        },
                        
                    ]
           };
            var stability_options = {
                chart: {
                    title: 'Stability',
                    width: 500,
                    height: 500
                },
                series: {
                    showDot: false,
                    showArea: false
                },
                plot: {
                    type: 'circle'
                },
                legend: {
                    align: 'bottom'
                }
            };
            var theme = {
                series: {
                    colors: [
                        '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                        '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
                    ]
                }
            };

            tui.chart.radialChart(stability_container, stability_data, stability_options);
            //
            
            var collect_container = document.getElementById('Collecting');
            
            var collect_data = {
                    categories: ["유동인구", "배후 주거 인구", "배후 직장인구"],
                    series: [
                        {
                            name: 'Collecting',
                            data: [result_floatPop, result_stayPop, result_workerPop]
                        },
                        
                    ]
           };
            var collect_options = {
                chart: {
                    title: 'Collecting',
                    width: 500,
                    height: 500
                },
                series: {
                    showDot: false,
                    showArea: false
                },
                plot: {
                    type: 'circle'
                },
                legend: {
                    align: 'bottom'
                }
            };
            var theme = {
                series: {
                    colors: [
                        '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                        '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
                    ]
                }
            };

            tui.chart.radialChart(collect_container, collect_data, collect_options);
            
            //
            var purchase_container = document.getElementById('Purchasing');
            
            var purchase_data = {
                    categories: ["상권 매출규모", "소비 수준", "건당 매출 금액"],
                    series: [
                        {
                            name: 'Purchasing',
                            data: [pur_scale, result_income_level, result_cnt_price]
                        },
                        
                    ]
           };
            var purchase_options = {
                chart: {
                    title: 'Purchasing',
                    width: 500,
                    height: 500
                },
                series: {
                    showDot: false,
                    showArea: false
                },
                plot: {
                    type: 'circle'
                },
                legend: {
                    align: 'bottom'
                }
            };
            var theme = {
                series: {
                    colors: [
                        '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                        '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
                    ]
                }
            };

            tui.chart.radialChart(purchase_container, purchase_data, purchase_options);
            //
            
             var total_result_anal = new JustGage({
                  id: "total_result_anal", 
                  value: final_grade, 
                  min: 1,
                  max: 5,
                  title: "상권 등급",
                  label: '등급'
                  
               
                });
            
            

      } // detail 
      
      
} // total

