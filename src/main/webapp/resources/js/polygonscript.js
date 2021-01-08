
	//위험도  표시
	function colorcheck (data) {
		switch (data) {
			case 1 : 
				return '#002EFF'
			case 2 : 
				return '#2AFF00'
			case 3 : 
				return '#FFFF00'
			case 4 : 
				return '#FF6E00'
			case 5 : 
				return '#FF0000'
			default :
				return '#FFFFFF'
		}
	}
	
	//서울 반경 및 이벤트 등록
	$(function(){

		var seoullocation = "resources/json/seoulorigin.json";
		var sigungucdlocation = "resources/json/Sgncd.json";
		
		$.getJSON(sigungucdlocation, function(sgncdarray){
			
		var sigungucdarray = sgncdarray;
		
		$.getJSON(seoullocation, function(data) {
			$(data.features).each(function (index,item) {
				
				var latlngarray = item.geometry.coordinates[0];
				var polygonPath = new Array;
				$(latlngarray).each(function (index2,item2){
					polygonPath.push(new kakao.maps.LatLng(item2[1],item2[0]));	
				});
				
				$(sigungucdarray).each(function(index3,cd) {
					if (item.properties.SIG_CD == cd.SIG_CD) {
						$(dangerarray).each(function (index4,dg){
							if (dg.SIGUNGU_CD == item.properties.SIG_CD) {
								
								var colortemp = colorcheck (dg.DANGER_CD); 
								
								var polygon = new kakao.maps.Polygon({
								    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
								    strokeWeight: 1, // 선의 두께입니다
								    strokeColor: '#FFFFFF', // 선의 색깔입니다
								    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
								    strokeStyle: 'solid', // 선의 스타일입니다
								    fillColor: colortemp, // 채우기 색깔입니다
								    fillOpacity: 0.7, // 채우기 불투명도 입니다
								    flag : cd.SIG_KOR_NM
								});
							/*
								var iwContent = '<div>' + cd.SIG_KOR_NM + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								iwContent += '<div>' + dg.DANGER_CD + '<div/>'
								iwContent += '<div>' + dg.DANGER_POINT + '<div/>'
								iwPosition = new kakao.maps.LatLng(cd.LAT, cd.LNG) //인포윈도우 표시 위치입니다
								 
								var infowindow = new kakao.maps.InfoWindow({
								    map: map, // 인포윈도우가 표시될 지도
								    position : iwPosition, 
								    content : iwContent,
								    removable : true
								});
								*/
								polygon.setMap(map);
								
								// 다각형에 마우스오버 이벤트가 발생했을 때 변경할 채우기 옵션입니다
								var mouseoverOption = { 
								    fillColor: '#FFFFFF', // 채우기 색깔입니다
								    fillOpacity: 0.7 // 채우기 불투명도 입니다        
								};

								// 다각형에 마우스아웃 이벤트가 발생했을 때 변경할 채우기 옵션입니다
								var mouseoutOption = {
								    fillColor: colortemp, // 채우기 색깔입니다 
								    fillOpacity: 0.7 // 채우기 불투명도 입니다        
								};
								
								// 다각형에 마우스오버 이벤트를 등록합니다
								kakao.maps.event.addListener(polygon, 'mouseover', function() { 
								 // 다각형의 채우기 옵션을 변경합니다
									polygon.setOptions(mouseoverOption);
									
									
								});
								
								kakao.maps.event.addListener(polygon, 'click' , function() {
									polygon.setOptions(mouseoverOption);
									kakao.maps.event.addListener(searchmarker, 'mouseover', function() {
										polygon.setOptions(mouseoverOption);
									});
									kakao.maps.event.addListener(searchmarker, 'mouseout', function() {
										polygon.setOptions(mouseoutOption);
									});
								});
								
								kakao.maps.event.addListener(polygon, 'mouseout', function() { 

								    // 다각형의 채우기 옵션을 변경합니다
								    polygon.setOptions(mouseoutOption);
								}); 
								
							}	
						});
				    
					}
				});
				
				
				});
			});
		});
	});