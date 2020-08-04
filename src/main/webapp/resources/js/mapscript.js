
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {   
	        center: new daum.maps.LatLng(37.56409564726936,126.99094585236259), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();
	
	// 지도 타입 컨트롤을 지도에 표시합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}
	
	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	var cx = 0;
	var cy = 0;
	var searchflag = true;
	var icon = new daum.maps.MarkerImage(
	        'http://i1.daumcdn.net/dmaps/apis/n_local_blit_04.png',
	        new daum.maps.Size(31, 35));
	var searchmarker = new daum.maps.Marker({
		image : icon
	});
	searchmarker.setPosition(new daum.maps.LatLng(37.56683546512344,126.97865225560894));
	var searchinfowindow = '';
	var infowindow = '';
	var geocoder = new daum.maps.services.Geocoder();

	$(function() {
 	//Map Close
 	$('#analysis').on('click', MapInfo);

 	$('.nav-link').on('click', Division);

 	$('#sure').on('click', inputRadio);
 
	});
	

    daum.maps.event
        .addListener(
            map,
            'click',
            function(mouseEvent) {
                searchDetailAddrFromCoords(
                    mouseEvent.latLng,
                    function(result, status) {
                        if (status === daum.maps.services.Status.OK) {
                            address = !!result[0].road_address ? result[0].road_address.address_name :
                                '';
                            address += result[0].address.address_name;

                            console.log(address);

                            // 클릭한 위도, 경도 정보를 가져옵니다 
                            var latlng = mouseEvent.latLng;

                            // 마커 위치를 클릭한 위치로 옮깁니다
                            searchmarker.setPosition(latlng);

                            cy = latlng.getLat(); // 위도
                            cx = latlng.getLng(); // 경도 
                            var contents = '';
                            contents += '<input type="hidden" name = "cx" value = "' + cx + '">';
                            contents += '<input type="hidden" name = "cy" value = "' + cy + '">';

                            document
                                .getElementById('secret').innerHTML = contents;
                        }
                    })
            });

       
	//주소로 검색
	function searchwhere() {
		if (searchinfowindow != '') {
		searchinfowindow.close();
		}
		$('#result_address').empty();
		var search = document.getElementById('search').value;	
		
		if (search == '') {
			alert('주소를 입력해주세요');
			return;
		}
		
		geocoder.addressSearch(search, function(result, status) {
		 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        
		        if (!searchflag) {
		        	
		        	searchflag = true;
		        	
		        	searchmarker.setPosition(coords);
		        	
		        	searchmarker.setMap(map);
		        	
		        } else {
		        searchflag = false;
		        
		        searchmarker.setPosition(coords);
		        
		        searchmarker.setMap(map);
		        }
		        
		        searchinfowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:100px;text-align:center;padding:6px 0;">' + search + '</div>',
		            removable : true
		        });
		        if (status === daum.maps.services.Status.OK) {
                    address = !!result[0].road_address ? result[0].road_address.address_name :
                        '';
                    address += result[0].address.address_name;

                    console.log(address);
		        }
		        
		        cy = result[0].y;
		        cx = result[0].x;

		        map.setCenter(coords);
		        
		        var contents = '';
                contents += '<input type="hidden" name = "cx" value = "' + cx + '">';
                contents += '<input type="hidden" name = "cy" value = "' + cy + '">';

                document
                    .getElementById('secret').innerHTML = contents;
                searchinfowindow.open(map, searchmarker);
		    } else {
		    	alert('검색 결과가 없습니다.');
		    }
		});    
	}
	
	//클릭시 주소 표시
	//var infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
    daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
    		if (status === daum.maps.services.Status.OK) {
    			if (searchinfowindow!='') {
    				searchinfowindow.close();
    			}
    			var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
    			detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
             
    			var content = '<div class="bAddr">' +
    					'<span class="title">법정동 주소정보</span>' + 
    						detailAddr + '</div>';

    			// 마커를 클릭한 위치에 표시합니다
    			searchmarker.setPosition(mouseEvent.latLng);
    			searchmarker.setMap(map);
    			
    			$('#result_address').html(detailAddr);
    			
    			// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
    			//infowindow.setContent(content);
    			//infowindow.open(map, searchmarker);
    		}   
    	});
    });

    	function searchAddrFromCoords(coords, callback) {
    		// 좌표로 행정동 주소 정보를 요청합니다
    		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
    	}

    	function searchDetailAddrFromCoords(coords, callback) {
    		// 좌표로 법정동 상세 주소 정보를 요청합니다
    		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    	}
	
	// 지도에 마커를 표시합니다
	
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		var mousetemp = searchmarker.m.mouseover;
		
		if (mousetemp.length > 1) {
			mousetemp[0] = mousetemp[1];
			mousetemp.pop();
		}
		searchmarker.setMap(map);
		
		if (searchinfowindow != '') {
			searchinfowindow.close();
			}
		
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    searchmarker.setPosition(latlng);
	    
		cy = latlng.getLat(); // 위도
		cx = latlng.getLng(); // 경도 
		var contents = '';
		contents += '<input type="hidden" name = "cx" value = "' + cx + '">';
		contents += '<input type="hidden" name = "cy" value = "' + cy + '">';

		document
			.getElementById('secret').innerHTML = contents;
	});
	
	
	
    // Analsis : 경도, 위도, 상권번호   
    function MapInfo() {
        if (cx == 0 || cy == 0) {
            alert('먼저 영역지정');
            return false;
        }

        var ServiceKey = 'zKK27PBQtqWr3tAKG4CG%2BSptcIqgwenD5aPNx2da%2Ff3b2KpFEbfDS0hNlFOpZIuKvdSRTf5V%2B1v4GSCw8X1qiw%3D%3D';
        var radius = 500;

        var url = 'http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRadius?radius=' +
            radius +
            '&cx=' +
            cx +
            '&cy=' +
            cy +
            '&type=json&ServiceKey=' + ServiceKey;

        var temp1;
        var temp2;
        var temp3;

        var temp1_nm;
        var temp2_nm;
        var temp3_nm;

        $
            .ajax({
                method: 'GET',
                dataType: 'json',
                url: url,

                success: function(result) {
					
				if (result.header.resultMsg == 'NODATA_ERROR') {
					alert('죄송합니다. 현재 데이터 수집 중인 지역입니다.');
					bringflag=false;
					return;
				}
                    console.log(result);
                    // 상권번호, 위도 경도
                    var inputTag = '';
                    var res = result.body.items;

                    console.log(res);

                    $(res)
                        .each(
                            function(i, item) {
                                // 상권코드
                                console.log('상권이름' + item.mainTrarNm);
                                if(i == 0){
                                	 inputTag += '<input type = "hidden" name = "sales_nm" value = "'+item.mainTrarNm+'">';
                                }
                               
                                console.log(item.trarNo);
                                inputTag += '<input type="hidden" name = "sales_num" value="' + item.trarNo + '">';

                                // 시군구코드
                                if (i == 0) {
                                    temp1 = res[i].signguCd;
                                    temp1_nm = res[i].signguNm;

                                    inputTag += '<input type="hidden" name = "sigungu_cd" value="' + temp1 + '">';
                                    inputTag += '<input type="hidden" name = "sigungu_nm" value="' + temp1_nm + '">';

                                } else if (temp1 != res[i].signguCd &&
                                    temp2 == null) {
                                    temp2 = res[i].signguCd;
                                    temp2_nm = res[i].signguNm;

                                    console.log('temp2 : ' +
                                        temp2)
                                    inputTag += '<input type="hidden" name = "sigungu_cd" value="' + temp2 + '">';
                                    inputTag += '<input type="hidden" name = "sigungu_nm" value="' + temp2_nm + '">';

                                } else if (temp2 != null &&
                                    temp2 != res[i].signguCd) {
                                    temp3 = res[i].signCd;
                                    temp2_nm = res[i].signCd;

                                    console.log('temp3 : ' +
                                        temp3)
                                    inputTag += '<input type="hidden" name = "sigungu_cd" value="' + temp3 + '">';
                                    inputTag += '<input type="hidden" name = "sigungu_nm" value="' + temp3_nm + '">';
                                }

                                console.log('시군구 코드 : ' +
                                    item.signguCd);
                                console.log('시군구 이름 : ' +
                                    item.signguNm);

                            });
                    console.log(address);
                    inputTag += '<input type="hidden" name = "address" value="' + address + '">';

                    $('#secret').append(inputTag);

                    $('#Mainform').submit();
                },

                error: function(e) {
                    console.log(e.responseText);
					alert(url);
					alert('서버의 응답이 늦어지고 있습니다. 잠시 후 다시 시도해주세요');
                }
            });

    }

    // Division : 대분류, 중분류, 소분류       
    function Division() {
        $('.nav-link').attr('class', 'nav-link');
        $(this).attr('class', 'nav-link active');
        var large_code = $(this).attr('value'); // 대 분류
        console.log(large_code);
        var output = '';
        var tmp = 0;
        $
            .ajax({
                url: 'middle',
                type: 'get',
                data: {
                    "sales_divison_l_cd": large_code
                },
                dataType: 'json',
                success: function(result) {
                    console.log(result);
                    //중분류
                    output += '<table style ="padding : 0px; border : 0px;">';
                    $(result)
                        .each(
                            function(i, item) {
                                if ((tmp % 4) == 0) {
                                    output += '<tr>';
                                }
                                if (i > 0) {
                                    if (result[i].SALES_DIVISON_M_CD != result[i - 1].SALES_DIVISON_M_CD) {
                                        output += '<td valign=top><div class="sales_division_m_cd"  id = "' + item.SALES_DIVISON_M_CD + '" value = "' + item.SALES_DIVISON_M_CD + '""><h3>' +
                                            item.SALES_DIVISON_M_NM + '</h3></div></td>';
                                           
                                        tmp++;
                                    }
                                } else if (i == 0) {
                                    output += '<td valign=top><div class="sales_division_m_cd" id = "' + item.SALES_DIVISON_M_CD + '" value = "' + item.SALES_DIVISON_M_CD + '"><h3>' +
                                        item.SALES_DIVISON_M_NM + '</h3></div></td>';
                                       
                                    tmp++;
                                }
                                if ((tmp % 4) == 0) {
                                    output += "</tr>";
                                }
                            })
                    output += "</table>";
                    $('#result').html(output);

                    //소분류
                    var context = '';
                    $
                        .each(
                            $(".sales_division_m_cd"),
                            function(index, item2) {

                                $(result)
                                    .each(
                                        function(i2,
                                            item3) {

                                            if ($(item2)
                                                .attr(
                                                    "value") == item3.SALES_DIVISON_M_CD) {

                                                context += '<div><input type="radio" name = "sales_division_s_cd" value = "' + item3.SALES_DIVISON_S_CD + '"><span>' +
                                                    item3.SALES_DIVISON_S_NM +
                                                    '</span></div>';
                                            }

                                        })

                                $(item2).after(context);
                                context = '';
                            });

                }
            })

    }

    function inputRadio() {
        var radioTag = '';
        var division_cd = $(':radio[name="sales_division_s_cd"]:checked').val();

        if (division != null) {
            radioTag += '<input type="hidden" name = "sales_division_s_cd" value = "' + division + '">';
        }

        $('#secret').append(radioTag);
    }

