<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>

<!-- 제이 쿼리, 다음 지도 -->
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddea40514a36c7dd14200b5ab87a04ba&libraries=services"></script>

<!-- Materialize -->
<script type="text/javascript"
	src="<c:url value="/resources/js/materialize.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value = "/resources/css/materialize.min.css"/>" />
	<c:url value="/resources/js/materialize.min.js"/>
</head>
<body>
	<!-- Header -->
	<div class="row">
		<div class="col s12"></div>

	</div>
	<!-- Body -->
	<div class="row">
		<div class="col s12">
			<div class="col s3"></div>
			<div class="col s6">
				<div class="main-wrap">
					<form action="location" method="post" id="Mainform">
						<table class="centered">
							<tr>
								<td colspan="2">
									<div id="map" style="width: 850px; height: 700px;"></div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><span> [1] 분석 상권 지정 </span></td>
							</tr>

							<tr>
								<td><span> [2] 업종 지정 </span></td>
								<td>
									<div id="sales">
										<a class="waves-effect waves-indigo modal-trigger"
											href="#Sales" style="color: black;"> 업종 선택 </a>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button"
										class="btn waves-effect waves-light light-blue darken-2"
										id="analysis">분석하기</button>
									<button type="reset"
										class="btn waves-effect waves-light light-blue darken-2"
										id="cancel">취소</button>
								</td>
							</tr>
						</table>

						<!-- Modal -->
						<div id="Sales" class="modal modal-fixed-footer">
							<div class="modal-content">
								<ul class="tabs tabs-fixed-width tab-demo z-depth-1">
									<li class="tab"><a class="large" href="#food" value="Q">음식</a></li>
									<li class="tab"><a class="large" href="#service" value="F">생활서비스</a></li>
									<li class="tab"><a class="large" href="#retail" value="D">소매</a></li>
									<li class="tab"><a class="large" href="#entertain"
										value="N">관광/여가/오락</a></li>
									<li class="tab"><a class="large" href="#sports" value="P">스포츠</a></li>
									<li class="tab"><a class="large" href="#education"
										value="R">학문/교육</a></li>
									<li class="tab"><a class="large" href="#staying" value="O">숙박</a></li>
									<li class="tab"><a class="large" href="#estate" value="L">부동산</a></li>
								</ul>
								<div id="result"></div>
							</div>

							<div class="modal-footer">
								<div class="center-align">
									<a href="#"
										class="modal-close waves-effect waves-green btn-flat">확인</a>
									<button type="button" id="sure"
										class="modal-close waves-effect waves-green btn-flat">확인</button>
								</div>
							</div>
						</div>

						<div id="secret"></div>
					</form>
					<!-- Body Main Close -->
				</div>

			</div>
			<div class="col s3"></div>
		</div>

	</div>
	<!-- Footer-->
	<div class="row">
		<div class="col s12"></div>


	</div>
</body>


<script>
			var cx = 0; // 위도(가로) 설정
			var cy = 0; // 경도(세로) 설정
			var address;	
		
			$(function(){
				// Daum Map
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new daum.maps.LatLng(37.512003, 127.060739), 
					        level: 3
					    };
					
					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();
					
					//지도를 클릭한 위치에 표출할 마커입니다
					var marker = new daum.maps.Marker({ 
					    // 지도 중심좌표에 마커를 생성합니다 
					    position: map.getCenter() 
					}); 
					// 지도에 마커를 표시합니다
					marker.setMap(map);
					
					daum.maps.event.addListener(map, 'click', function(mouseEvent) {
						 searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
						 	if (status === daum.maps.services.Status.OK) {
						 		address = !!result[0].road_address ? result[0].road_address.address_name : '';
						 		address += result[0].address.address_name ;
						 		
					            console.log(address);
						 		
							    // 클릭한 위도, 경도 정보를 가져옵니다 
							    var latlng = mouseEvent.latLng; 
							    
							    // 마커 위치를 클릭한 위치로 옮깁니다
							    marker.setPosition(latlng);
							    
							    cy = latlng.getLat();// 위도
							    cx = latlng.getLng();// 경도 
								var contents = '';
							    contents += '<input type="hidden" name = "cx" value = "'+ cx +'">';
							    contents += '<input type="hidden" name = "cy" value = "'+ cy +'">';
		
							    document.getElementById('secret').innerHTML = contents;
							}
				        })
					}); 
					
					
					
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   

					//Map Close
					   $('.modal').modal(); // Modal 설정

					   $('#analysis').on('click', MapInfo); 
				   
					   $('.large').on('click', Division);
					   
					   $('#sure').on('click', inputRadio);
					   

				}) // OnLoad
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
					
				function searchDetailAddrFromCoords(coords, callback) {
				    // 좌표로 법정동 상세 주소 정보를 요청합니다
				  	 geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}
					
			
			
// Analsis : 경도, 위도, 상권번호		
			function MapInfo() {
			   	if (cx==0 || cy==0) {
			      alert('먼저 영역지정');
			      return false;
			   	}
			   
			   	var ServiceKey = 'zKK27PBQtqWr3tAKG4CG%2BSptcIqgwenD5aPNx2da%2Ff3b2KpFEbfDS0hNlFOpZIuKvdSRTf5V%2B1v4GSCw8X1qiw%3D%3D';
			   	var radius = 500;
			   
			   	var url = 'http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRadius?radius='
					   	+ radius +'&cx=' + cx + '&cy=' + cy + '&type=json&ServiceKey=' + ServiceKey;
	
				var temp1;
				var temp2;
				var temp3;

				var temp1_nm;
				var temp2_nm;
				var temp3_nm;
			   
			      $.ajax({
				      method : 'GET',
				      dataType : 'json',
				      url : url,
				
				      success : function(result) {	
				    	 console.log(result);
				    	 // 상권번호, 위도 경도
				         var inputTag = '';
				    	 var res = result.body.items;
				    	 
				    	 console.log(res);
				    	 
				         $(res).each(function(i, item) {
				        	// 상권코드
				        	console.log(item.trarNo);
				        	inputTag += '<input type="hidden" name = "sales_num" value="' + item.trarNo + '">';
				        	
				        	// 시군구코드
				        	if(i == 0){
				        		temp1 = res[i].signguCd;
				        		temp1_nm = res[i].signguNm;


				        		inputTag += '<input type="hidden" name = "sigungu_cd" value="' + temp1 + '">';
				        		inputTag += '<input type="hidden" name = "sigungu_nm" value="' + temp1_nm + '">';

				        		
				        	}
				        	else if(temp1 != res[i].signguCd && temp2 == null) {
				        		temp2 = res[i].signguCd;
				        		temp2_nm = res[i].signguNm;

				        		console.log('temp2 : ' + temp2)
				        		inputTag += '<input type="hidden" name = "sigungu_cd" value="' + temp2 + '">';
				        		inputTag += '<input type="hidden" name = "sigungu_nm" value="' + temp2_nm + '">';


				        	}
				        	else if(temp2 != null && temp2 != res[i].signguCd){
				        		temp3 = res[i].signCd;
				        		temp2_nm = res[i].signCd;


				        		console.log('temp3 : ' + temp3)
				        		inputTag += '<input type="hidden" name = "sigungu_cd" value="' + temp3 + '">';
				        		inputTag += '<input type="hidden" name = "sigungu_nm" value="' + temp3_nm + '">';
				        	}
				        	
				        	
				        	console.log('시군구 코드 : ' + item.signguCd);
				        	console.log('시군구 이름 : ' + item.signguNm);
				        	
					        
				         });
				         console.log(address);
				         inputTag += '<input type="hidden" name = "address" value="' + address + '">';
				        
				         $('#secret').append(inputTag);
				         
				       $('#Mainform').submit();
				      },
				      
				      error : function(e) {
				         console.log(e.responseText);
				         alert(url);
				      }
			   });
				
				
			}

// Division : 대분류, 중분류, 소분류 			
			   function Division(){
			    	var large_code = $(this).attr('value'); // 대 분류
			    	var output = '';
			    	
			    	$.ajax({
			    		url  	 : 'middle',
			    		type 	 : 'get',
			    		data	 : {"sales_divison_l_cd" : large_code},
			    		dataType : 'json',
			    		success  : function(result){
			    			//중분류
			    			$(result).each(function(i, item){
			    				
			    				if(i > 0){
			    					if(result[i-1].SALES_DIVISON_M_CD != result[i].SALES_DIVISON_M_CD){
					    				output += '<div class="left-align"  id = "' + item.SALES_DIVISON_M_CD + '" value = "' + item.SALES_DIVISON_M_CD + '"><strong>' + item.SALES_DIVISON_M_NM + '</strong></div>';
			    					}
			    				}else if(i == 0){
				    				output += '<div class="left-align" id = "' + item.SALES_DIVISON_M_CD + '" value = "' + item.SALES_DIVISON_M_CD + '"><strong>' + item.SALES_DIVISON_M_NM + '</strong></div>';    				
				    				}
			    				
			    			})

			    			$('#result').html(output);	
			    			
			    			//소분류
			    			var context = '';
			    			$.each($(".left-align"),function(index,item2){	
			    				
			    				$(result).each(function(i2,item3){
			    					
			    					if($(item2).attr("value") == item3.SALES_DIVISON_M_CD){
		    						
			    						context += '<div><label><input type="radio" name = "sales_division_s_cd" value = "'+ item3.SALES_DIVISON_S_CD +'"><span>'+item3.SALES_DIVISON_S_NM+'</span></label></div>';
			    					}
			    						    					
			    				})
			    				
			    				$(item2).after(context);
			    				context = '';
			    			});
			    			
			    			
			    		}
			   		})

			    }

			    function inputRadio(){
						   var radioTag = '';
						   var division_cd = $(':radio[name="sales_division_s_cd"]:checked').val();
						   if(division != null){
								radioTag += '<input type="hidden" name = "sales_division_s_cd" value = "'+ division+'">';
						   }

						   $('#secret').append(radioTag);
				}
			
			
		</script>

</html>