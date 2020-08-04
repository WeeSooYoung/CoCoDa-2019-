<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
    <title>Home</title>
</head>
<!-- Jquery JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<!-- Chart Javascript -->


<script src="<c:url value="/resources/js/Chart.min.js"/>"></script>
<script src="resources/js/raphael.js"></script>
<script src="resources/js/tui-code-snippet.js"></script>
<script src="resources/js/tui-chart.min.js"></script>
<script src="resources/js/population.js"></script>
<link rel="stylesheet" href="resources/css/tui-chart.min.css">

<!-- JavaScript File -->

<script>
  // 모델 값 전역변수 설정
  var cx = ${cx};                 // 위도
  var cy = ${cy};                 // 경도
  var sales_num = ${sales_num};         // 상권 번호
  
  var sigungu_cd = '11680'
  /* var sigungu_cd = ${sigungu_cd};   */       // 시군구 코드
  
  var sigungu_num = '${sigungu_nm}';        // 시군구 이름
  
  var address = '${address}';           // 주소
  var sales_division_s_cd = 'F04A07';
  /* = ${sales_division_s_cd}// 소분류코드 */
  /* var sigungu_arr = [];
  for (var i = 0; i < sigungu_num.length; i++) {
    sigungu_arr.push(sigungu_num[i]);
  } */
  
  // On Load
  $(function(){
    $.ajax({
      url   : 'total',
      type  : 'get',
      data  : {
        'sigungu_cd'     : sigungu_cd,
        'sales_divison_s_cd' : sales_division_s_cd
      },
      success : detailTable
    });
  })
  
  function detailTable(res){
    console.log(res);

    // 성장성 - 20점
    var salesScales = res[0].salesScales;     // 상권 규모 10점
    var avgGrowth = res[0].avgGrowth;     // 월 별 매출증감률 10점
    var expectSales = 20;           // 예상 성장률 10점
    
    // 안정성
    var growth = res[1].growth;         // 해당 업소 매출 증감률 10점
    var operationYear = res[1].operationYear; // 운영년수 10점
    var variation = res[1].variation;     // 변동성 10점
    
    // 집객력
    var floatPop = res[2].floatPop;       // 유동인구 10점
    var stayPop = res[2].stayPop;       // 거주인구 10점
    var workerPop = res[2].workerPop      // 직장인구 10점
    
    //구매력
    var cnt_price = res[3].cnt_price;     // 건당 결제금액 10점
    var income_level = res[3].income_level;   // 소비수준 10점
                          // 상권 매출규모 10점
    console.log(res[0].salesScales);
    
    
    var datail_table = '';

    datail_table += '<table class="table table-bordered">';
    datail_table +=         '<caption>상세 평가 지수</caption>';
    datail_table +=         '<colgroup>';
    datail_table +=             '<col style="width:7%">';
    datail_table +=             '<col style="width:7%">';
    datail_table +=             '<col style="width:35%">';
    datail_table +=             '<col style="width:12%">';
    datail_table +=             '<col style="width:7%">';
    datail_table +=             '<col>';
    datail_table +=        ' </colgroup>';
    datail_table +=        ' <tbody>';
    datail_table +=            '<tr>';
    datail_table +=                 '<th colspan="2">구분</th>';
    datail_table +=                ' <th colspan="4">내용</th>';
    datail_table +=             '</tr>';
    datail_table +=            ' <tr>';
    datail_table +=                ' <th rowspan="4">';
    datail_table +=                     '<strong> 성장성</strong>';
    datail_table +=                     '<br>';
    datail_table +=                     '<small>(20)점</small>';
    datail_table +=                ' </th>';
    datail_table +=                 '<th rowspan="4">';
    datail_table +=                     '<strong>16.7</strong>점';
    datail_table +=                 '</th>';
    datail_table +=                 '<td rowspan="4">';
	datail_table +=                       '<div id="Growth"></div>';          
    datail_table +=                 '</td>';
    datail_table +=                 '<th>';
    datail_table +=                    ' 매출 증감률';
    datail_table +=                    ' <br>';
    datail_table +=                     '<small>';
    datail_table +=                        ' (10)점';
    datail_table +=                     '</small>';
    datail_table +=                 '</th>';
    datail_table +=                 '<td>';
    datail_table +=                     '<strong> 8.3 </strong>점';
    datail_table +=                ' </td>';
    datail_table +=                ' <td style="text-align: left">';
    datail_table +=                     '- 작년 동월대비 전체 매출규모 증감률';
    datail_table +=                     '<small>(5점)</small>';
    datail_table +=                    ' <br>';
    datail_table +=                    ' - 작년 동월대비 가게당 매출규모 증감률';
    datail_table +=                     '<small>(5점)</small>';
    datail_table +=                 '</td>';
    datail_table +=             '<tr>';
    datail_table +=                 '<th>';
    datail_table +=                     '상권 매출 비중<br>'
    datail_table +=                     '<small> (5)점 </small>';           
    datail_table +=                ' </th>';
    datail_table +=                 '<td>';
    datail_table +=                     '<strong> 3.4 </strong>점';
    datail_table +=                 '</td>';
    datail_table +=                 '<td style="text-align: left">';
    datail_table +=                     '작년 동원 대비 전국 대비 선택지역 매출비중 증감률';
    datail_table +=                 '</td>';
    datail_table +=            ' </tr>';
    datail_table +=             '<tr>';
    datail_table +=                 '<th>예상 성장률</th>';
    datail_table +=                 '<td>5.0점</td>';
    datail_table +=                 '<td>';
    datail_table +=                    ' 반기별 매출증감 추이를 이용하여 향후 1년간의 매출을 예측한 지표';
    datail_table +=                 '</td>';
    datail_table +=            ' </tr>';
    datail_table +=            ' <tr>';
    datail_table +=                 '<td colspan="3" style="text-align: left">';
    datail_table +=                     '성장성 지수 산출항목 중';
    datail_table +=                     '<strong>매출증감률</strong>';
    datail_table +=                     '의 비중이 상대적으로 높습니다';
    datail_table +=                 '</td>';
    datail_table +=             '</tr>';
    datail_table +=             '<tr>';
    datail_table +=                 '<th rowspan="4">';
    datail_table +=                     '<strong> 안정성</strong>';
    datail_table +=                     '<br>';
    datail_table +=                     '<small>(20)점</small>';
    datail_table +=                ' </th>';
    datail_table +=                 '<th rowspan="4">';
    datail_table +=                     '<strong>10.3</strong>점'
    datail_table +=                 '</th>'
    datail_table +=                 '<td rowspan="4">'
    datail_table +=                    ' <div id="Stability"></div>'
    datail_table +=                 '</td>';
    datail_table +=                 '<th>';
    datail_table +=                     '공급 대비 수요';
    datail_table +=                     '<br>';
    datail_table +=                     '<small>';
    datail_table +=                        ' (10)점';
    datail_table +=                     '</small>';
    datail_table +=                ' </th>';
    datail_table +=                ' <td>';
    datail_table +=                     '<strong> 8.3 </strong>';
    datail_table +=                     '"점"';
    datail_table +=                 '</td>';
    datail_table +=                 '<td style="text-align: left">';
    datail_table +=                    ' - 작년 동월대비 전체 매출규모 증감률';
    datail_table +=                     '<small>(5점)</small>';
    datail_table +=                     '<br>';
    datail_table +=                     '- 작년 동월대비 가게당 매출규모 증감률';
    datail_table +=                     '<small>(5점)</small>';
    datail_table +=                 '</td>';
    datail_table +=           '  <tr>';
    datail_table +=                 '<th>';
    datail_table +=                     '점포별 매출편아';
    datail_table +=                     '<br>';
    datail_table +=                    ' <small>';
    datail_table +=                        ' (5)점';
    datail_table +=                    ' </small>';
    datail_table +=                 '</th>';
    datail_table +=                ' <td>';
    datail_table +=                     '<strong> 3.4 </strong>점';
    datail_table +=                 '</td>';
    datail_table +=                 '<td style="text-align: left">'
    datail_table +=                     '작년 동원 대비 전국 대비 선택지역 매출비중 증감률';
    datail_table +=                ' </td>'
    datail_table +=             '</tr>'
    datail_table +=             '<tr>'
    datail_table +=                 '<th>기간별 매출편차</th>'
    datail_table +=                 '<td>5.0점</td>'
    datail_table +=                 '<td>'
    datail_table +=                     '영업력 지수 산출항목 중 점포별 매출편차의 비중이 상대적으로 높습니다.'
    datail_table +=                 '</td>'
    datail_table +=             '</tr>'
    datail_table +=             '<tr>'
    datail_table +=                ' <td colspan="3" style="text-align: left">'
    datail_table +=                     '성장성 지수 산출항목 중'
    datail_table +=                     '<strong>매출증감률</strong>'
    datail_table +=                     '의 비중이 상대적으로 높습니다'
    datail_table +=                 '</td>'
    datail_table +=            ' </tr>'
    datail_table +=             '<tr>'
    datail_table +=                 '<th rowspan="4">'
    datail_table +=                    '<strong> 구매력</strong>'
    datail_table +=                    ' <br>'
    datail_table +=                     '<small>(20)점</small>'
    datail_table +=                 '</th>'
    datail_table +=                 '<th rowspan="4">'
    datail_table +=                     '<strong>10.0</strong>점'
    datail_table +=                 '</th>'
    datail_table +=                 '<td rowspan="4">'
    datail_table +=                     '<div id = "Purchasing"></div>'
    datail_table +=                 '</td>'
    datail_table +=                 '<th>'
    datail_table +=                     '상권 매출규모'
    datail_table +=                     '<br>'
    datail_table +=                     '<small>'
    datail_table +=                         '(10)점'
    datail_table +=                     '</small>'
    datail_table +=                ' </th>'
    datail_table +=                 '<td>'
    datail_table +=                     '<strong> 8.3 </strong>'
    datail_table +=                     '점'
    datail_table +=                 '</td>'
    datail_table +=                 '<td style="text-align: left">'
    datail_table +=                     '- 작년 동월대비 전체 매출규모 증감률'
    datail_table +=                     '<small>(5점)</small>'
    datail_table +=                     '<br>'
    datail_table +=                     '- 작년 동월대비 가게당 매출규모 증감률'
    datail_table +=                    ' <small>(5점)</small>'
    datail_table +=                 '</td>'
    datail_table +=             '<tr>';
    datail_table +=                 '<th>'
    datail_table +=                     '건당 매출 금액'
    datail_table +=                     '<br>'
    datail_table +=                     '<small>'
    datail_table +=                         '(5)점'
    datail_table +=                     '</small>'
    datail_table +=                 '</th>'
    datail_table +=                 '<td>'
    datail_table +=                     '<strong> 3.4 </strong>점'
    datail_table +=                 '</td>'
    datail_table +=                 '<td style="text-align: left">'
    datail_table +=                     '작년 동원 대비 전국 대비 선택지역 매출비중 증감률'
    datail_table +=                ' </td>'
    datail_table +=            ' </tr>'
    datail_table +=            ' <tr>'
    datail_table +=                 '<th>소비 수준</th>'
    datail_table +=                 '<td>5.0점</td>'
    datail_table +=                 '<td>'
    datail_table +=                     '반기별 매출증감 추이를 이용하여 향후 1년간의 매출을 예측한 지표'
    datail_table +=                 '</td>'
    datail_table +=             '</tr>'
    datail_table +=             '<tr>'
    datail_table +=                 '<td colspan="3" style="text-align: left">'
    datail_table +=                     '성장성 지수 산출항목 중'
    datail_table +=                     '<strong>소비 수준</strong>'
    datail_table +=                     '의 비중이 상대적으로 높습니다'
    datail_table +=                 '</td>'
    datail_table +=             '</tr>'
    datail_table +=             '<tr>'
    datail_table +=                 '<th rowspan="4">'
    datail_table +=                     '<strong> 집객력</strong>'
    datail_table +=                     '<br>'
    datail_table +=                     '<small>(20)점</small>'
    datail_table +=                 '</th>'
    datail_table +=                ' <th rowspan="4">'
    datail_table +=                     '<strong>5.1</strong>"점"'
    datail_table +=                 '</th>'
    datail_table +=                 '<td rowspan="4">'
    datail_table +=                     '<div id = "Collecting">'
    datail_table +=                     '</div>'
    datail_table +=                 '</td>'
    datail_table +=                 '<th>'
    datail_table +=                    ' 유동인구'
    datail_table +=                     '<br>'
    datail_table +=                     '<small>'
    datail_table +=                         '(10)점'
    datail_table +=                     '</small>'
    datail_table +=                ' </th>';
    datail_table +=                ' <td>'
    datail_table +=                    ' <strong> 3.5. </strong>'
    datail_table +=                   '점'
    datail_table +=                ' </td>'
    datail_table +=                 '<td style="text-align: left">'
    datail_table +=                     '- 작년 동월대비 전체 매출규모 증감률'
    datail_table +=                     '<small>(5점)</small>'
    datail_table +=                     '<br>'
    datail_table +=                     '- 작년 동월대비 가게당 매출규모 증감률'
    datail_table +=                     '<small>(5점)</small>'
    datail_table +=                 '</td>'
    datail_table +=             '<tr>'
    datail_table +=                ' <th>'
    datail_table +=                     '배후 주거인구'
    datail_table +=                    ' <br>'
    datail_table +=                     '<small>'
    datail_table +=                         '(5)점'
    datail_table +=                    ' </small>'
    datail_table +=                ' </th>'
    datail_table +=                 '<td>'
    datail_table +=                     '<strong> 3.4 </strong>점'
    datail_table +=                 '</td>'
    datail_table +=                 '<td style="text-align: left">'
    datail_table +=                     '작년 동원 대비 전국 대비 선택지역 매출비중 증감률'
    datail_table +=                 '</td>'
    datail_table +=             '</tr>'
    datail_table +=             '<tr>'
    datail_table +=                 '<th>배후 직장인구'
    datail_table +=                    ' 유동인구'
    datail_table +=                     '<br>'
    datail_table +=                     '<small>'
    datail_table +=                         '(5)점'
    datail_table +=                     '</small>'
    datail_table +=                ' </th>'
    datail_table +=                 '<td>'
    datail_table +=                     '반기별 매출증감 추이를 이용하여 향후 1년간의 매출을 예측한 지표'
    datail_table +=                 '</td>'
    datail_table +=             '</tr>'
    datail_table +=             '<tr>'
    datail_table +=                 '<td colspan="3" style="text-align: left">'
    datail_table +=                     '집객력 지수 산출항목 중'
    datail_table +=                     '<strong>유동인구</strong>'
    datail_table +=                     '의 비중이 상대적으로 높습니다'
    datail_table +=                ' </td>'
    datail_table +=             '</tr>'
    datail_table +=         '</tbody>'
    datail_table +=     '</table>'
    
    $('#result').html(datail_table);
    
 var salesScales = res[0].salesScales;     // 상권 규모 10점
    var avgGrowth = res[0].avgGrowth;     // 월 별 매출증감률 10점
    var expectSales = 20;           



    var ctx = $('#Growth');
    var myRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
          labels  : ['salesScales', 'avgGrowth', 'expectSales'],
          datasets: [{
                data: [salesScales, avgGrowth, expectSales]
            }]
        },
        options: options
    });
  }


</script>


<body>

  <!-- Body -->
  <div class = "row">
    <div class = "col s12">
      <!-- Right Space -->
      <div class = "col s2"></div>
      <!-- Main -->
      <div class = "col s8">
        <div id = result></div>
      </div>
      
      <!-- Left Space -->
      <div class = "col s2"></div>
    </div>
  </div>
  
</body>


</html>