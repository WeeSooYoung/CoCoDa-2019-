<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>COCODA</title>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500" rel="stylesheet"/>
  <link href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="<c:url value = "/resources/page/plugins/toaster/toastr.min.css"/>" rel="stylesheet" />
  <link href="<c:url value = "/resources/page/plugins/nprogress/nprogress.css"/>" rel="stylesheet" />
  <link href="<c:url value = "/resources/page/plugins/flag-icons/css/flag-icon.min.css"/>" rel="stylesheet"/>
  <link href="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>" rel="stylesheet" />
  <link href="<c:url value = "/resources/page/plugins/ladda/ladda.min.css"/>" rel="stylesheet" />
  <link href="<c:url value = "/resources/page/plugins/select2/css/select2.min.css"/>" rel="stylesheet" />
  <link href="<c:url value = "/resources/page/plugins/daterangepicker/daterangepicker.css"/>" rel="stylesheet" />

  <!-- SLEEK CSS -->
  <link id="sleek-css" rel="stylesheet" href="<c:url value = "/resources/page/css/sleek.css"/>" />

  <!-- FAVICON -->
  <link href="<c:url value = "/resources/page/icon.png"/>" rel="shortcut icon" />

  <script src="<c:url value = "/resources/page/plugins/nprogress/nprogress.js"/>"></script>
  
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddea40514a36c7dd14200b5ab87a04ba&libraries=services"></script>
<script src="<c:url value = "/resources/page/plugins/jquery/jquery.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/toaster/toastr.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/slimscrollbar/jquery.slimscroll.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/charts/Chart.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/ladda/spin.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/ladda/ladda.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/jquery-mask-input/jquery.mask.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/select2/js/select2.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-world-mill.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/daterangepicker/moment.min.js"/>"></script>
<script src="<c:url value = "/resources/page/plugins/daterangepicker/daterangepicker.js"/>"></script>
<%-- <script src="<c:url value = "/resources/page/plugins/jekyll-search.min.js"/>"></script> --%>
<script src="<c:url value = "/resources/page/js/sleek.js"/>"></script>
<script src="<c:url value = "/resources/page/js/chart.js"/>"></script>
<script src="<c:url value = "/resources/page/js/date-range.js"/>"></script>
<script src="<c:url value = "/resources/page/js/map.js"/>"></script>
<script src="<c:url value = "/resources/page/js/custom.js"/>"></script>
  <script>
	//글쓰기폼 확인
	function formCheck() {
		var title = document.getElementById('title');
		var content = document.getElementById('content');
		
		if (title.value.length < 5) {
			alert("제목을 5자 이상 입력하세요.");
			title.focus();
			title.select();
			return false;
		}
		if (content.value.length < 5) {
			alert("내용을 5자 이상 입력하세요.");
			title.focus();
			title.select();
			return false;
		}
		
		return true;
	}
	</script>
  <style type="text/css">
  	.jsbutton{
  		  width:100px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
  	}
  	
  /*tableform{
			border: 1px solid black;
			width:700px;
			margin: auto;
		}
		
		.table th {
				width:90px;
				height: 40px;
				background-color: #cccccc;
				text-align: center;
				font-weight: bold;
			}

		.tableform td{
			padding: 10px;
			background-color: #eeeeee;
			text-align: left;
		}*/
  </style>
</head>

  <body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
    <script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>

    <div class="mobile-sticky-body-overlay"></div>

    <div class="wrapper">
        <!--
          ====================================
          ——— LEFT SIDEBAR WITH FOOTER
          =====================================
        -->
        <aside class="left-sidebar bg-sidebar">
          <div id="sidebar" class="sidebar sidebar-with-footer">
            <!-- Aplication Brand -->
            <div class="app-brand">
              <a href="seoul_analysis">
              <img src="<c:url value = "/resources/page/icon.png"/>" style = "height : 33px; width : 33px">
               <!--  <svg
                  class="brand-icon"
                  xmlns="http://www.w3.org/2000/svg"
                  preserveAspectRatio="xMidYMid"
                  width="30"
                  height="33"
                  viewBox="0 0 30 33"
                > -->
                  <g fill="none" fill-rule="evenodd">
                    <path
                      class="logo-fill-blue"
                      fill="#7DBCFF"
                      d="M0 4v25l8 4V0zM22 4v25l8 4V0z"
                    />
                    <path class="logo-fill-white" fill="#FFF" d="M11 4v25l8 4V0z" />
                  </g>
                </svg>
                
                <span class="brand-name">CoCoDa</span>
              </a>
            </div>
            <!-- begin sidebar scrollbar -->
            <div class="sidebar-scrollbar">

              <!-- sidebar menu -->
              <ul class="nav sidebar-inner" id="sidebar-menu">
                
				 <li  class="has-sub active expand" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#charts"
                      aria-expanded="false" aria-controls="charts">
                      <i class="mdi mdi-chart-pie"></i>
                      <span class="nav-text">상권분석</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse show"  id="charts"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                          
                            <li >
                              <a class="sidenav-item-link" href="chartjs.html">
                                <span class="nav-text">서울시 상권분석</span>
                                
                              </a>
                            </li>
                      </div>
                    </ul>
                  </li>


                
                  <li  class="has-sub " >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#dashboard"
                      aria-expanded="false" aria-controls="dashboard">
                      <i class="mdi mdi-view-dashboard-outline"></i>
                      <span class="nav-text">Dashboard</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse "  id="dashboard"
                      data-parent="#sidebar-menu">
                      		 <div class="sub-menu">
                            <li >
                              <!-- <a class="sidenav-item-link" href="index.html"> -->
                              	<a href="boardPage" class="sidenav-item-link">
                                <span class="nav-text">자유게시판</span>
                                </a>
                            
                            </li>
                            <li class="active" >
                              <a class="sidenav-item-link" href="analytics.html">
                              <a href="qaboardPage" class="sidenav-item-link">
                                <span class="nav-text">Q&A</span>
                                
                              </a>
                            </li>
                            <li class="active" >
                              <a class="sidenav-item-link" href="analytics.html">
                              <a href="noticeboardPage" class="sidenav-item-link">
                                <span class="nav-text">공지사항</span>
                                
                              </a>
                            </li>
                      </div>
                    </ul>
                  </li>
                

                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#ui-elements"
                      aria-expanded="false" aria-controls="ui-elements">
                      <i class="mdi mdi-folder-multiple-outline"></i>
                      <span class="nav-text">UI Elements</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="ui-elements"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#widgets"
                            aria-expanded="false" aria-controls="widgets">
                            <span class="nav-text">Widgets</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="widgets">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="general-widget.html">General Widget</a>
                              </li>
                              
                              <li >
                                <a href="chart-widget.html">Chart Widget</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        
                      </div>
                    </ul>
                  </li>
                

                

                
                 
                

                

                
                  <li  class="has-sub" >
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#pages"
                      aria-expanded="false" aria-controls="pages">
                      <i class="mdi mdi-image-filter-none"></i>
                      <span class="nav-text">Pages</span> <b class="caret"></b>
                    </a>
                    <ul  class="collapse"  id="pages"
                      data-parent="#sidebar-menu">
                      <div class="sub-menu">
                        
                          
                            <li >
                              <a class="sidenav-item-link" href="user-profile.html">
                                <span class="nav-text">User Profile</span>
                                
                              </a>
                            </li>
                          
                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#authentication"
                            aria-expanded="false" aria-controls="authentication">
                            <span class="nav-text">Authentication</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="authentication">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="sign-in.html">Sign In</a>
                              </li>
                              
                              <li >
                                <a href="sign-up.html">Sign Up</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        
                        
                        <li  class="has-sub" >
                          <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#others"
                            aria-expanded="false" aria-controls="others">
                            <span class="nav-text">Others</span> <b class="caret"></b>
                          </a>
                          <ul  class="collapse"  id="others">
                            <div class="sub-menu">
                              
                              <li >
                                <a href="invoice.html">invoice</a>
                              </li>
                              
                              <li >
                                <a href="error.html">Error</a>
                              </li>
                              
                            </div>
                          </ul>
                        </li>
                        

                        
                      </div>
                    </ul>
                  </li>
                

              </ul>
<!-- SideBar Finish  -->
            </div>

            <hr class="separator" />
          </div>
        </aside>

      

      <div class="page-wrapper">
                  <!-- Header -->
          <header class="main-header " id="header">
            <nav class="navbar navbar-static-top navbar-expand-lg">
              <!-- Sidebar toggle button -->
              <button id="sidebar-toggler" class="sidebar-toggle">
                <span class="sr-only">Toggle navigation</span>
              </button>
             
            	<div class="search-form d-none d-lg-inline-block"></div> 
             
			
              		    <div class="navbar-right ">
                            
              	<c:if test="${sessionScope.userid == null && sessionScope.admin == null}" > 
              		<a href="userlogin" class="jsbutton">로그인</a> 
              		<a href="userjoin" class="jsbutton">회원가입</a> 
              	</c:if> 
              	<c:if test ="${sessionScope.userid ne null || sessionScope.admin != null}">
                <ul class="nav navbar-nav">
                  <!-- User Account -->
                  <li class="dropdown user-menu" style = "text-align : right">
                  
                    <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                      	<c:choose>
                      		<c:when test ="${sessionScope.userid ne null}">
                      			${sessionScope.userid}님 환영합니다.
                      		</c:when>
                      		<c:when test ="${sessionScope.admin ne null}">
                      			관리자로 로그인하셨습니다.
                      		</c:when>
                      	</c:choose>
                      	
                    </button>
                    
                    <ul class="dropdown-menu dropdown-menu-right">
                      <!-- User image -->
                      
                      <li>
                        <a href="profile.html">
                          <i class="mdi mdi-account"></i>
                        </a>
                      </li>

                      <li class="dropdown-footer">
                      	<a href="logout"> <i class="mdi mdi-logout"></i>Log Out </a>
                        <!-- <a href="signin.html"> <i class="mdi mdi-logout"></i> </a>  -->
                      </li>
                      
                    </ul>
                  </li>
                  
                </ul>
                </c:if>
              </div>
              
            </nav>

          </header>

<!-- 스타트 컨텐츠 -->
        <div class="content-wrapper">
          <div class="content">			
          	<div class="row">
				<div class="col-md-12">
					
                          <!-- User activity statistics -->
                          <div class="card card-default" id="user-activity">
                            <div class="row no-gutters">
                              <div class="col-xl-12">
                                <div class="border-right">
                                  <div class="card-header justify-content-between py-5">
                                    <h2>Trade analysis</h2>
                                  </div>
                                  <!-- <ul class="nav nav-tabs nav-style-border justify-content-between justify-content-xl-start border-bottom" role="tablist">
                                    <li class="nav-item">
                                      <a class="nav-link active pb-md-0" data-toggle="tab" href="#user" role="tab" aria-controls="" aria-selected="true">
                                        <span class="type-name">User</span>
                                        <h4 class="d-inline-block mr-2 mb-3">5248</h4>
                                        <span class="text-success ">5%
                                          <i class="mdi mdi-arrow-up-bold"></i>
                                        </span>
                                      </a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link pb-md-0" data-toggle="tab" href="#session" role="tab" aria-controls="" aria-selected="false">
                                        <span class="type-name">Sessions</span>
                                        <h4 class="d-inline-block mr-2 mb-3">638</h4>
                                        <span class="text-success ">20%
                                          <i class="mdi mdi-arrow-up-bold"></i>
                                        </span>
                                      </a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link pb-md-0" data-toggle="tab" href="#bounce" role="tab" aria-controls="" aria-selected="false">
                                        <span class="type-name">Bounce Rate</span>
                                        <h4 class="d-inline-block mr-2 mb-3">36.9%</h4>
                                        <span class="text-danger ">7%
                                          <i class="mdi mdi-arrow-down-bold"></i>
                                        </span>
                                      </a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link pb-md-0" data-toggle="tab" href="#session-duration" role="tab" aria-controls="" aria-selected="false">
                                        <span class="type-name">Session Duration</span>
                                        <h4 class="d-inline-block mr-2 mb-3">4m 49s</h4>
                                        <span class="text-success ">15%
                                          <i class="mdi mdi-arrow-up-bold"></i>
                                        </span>
                                      </a>
                                    </li>
                                  </ul> -->
                                  
                                  <!-- 여기 -->
                                  <div class="card-body">
                                    
                                    <form id="writeform" action="noticewrite" method="post"
												onsubmit="return formCheck();">
									
												<table class="table">
													<tr>
														<th>제목</th>
														<td>
															<input type="text" name="title" id="title" style="width: 400px;">
														</td>
													</tr>
													<tr>
														<th>내용</th>
														<td>
															<textarea name="content" id="content"
																style="width: 400px; height: 200px; resize: none;"></textarea>
														</td>
													</tr>
												
													<tr>
														<td colspan="2" class="white center">
															<input type="submit" value="저장" class="mb-1 btn btn-info" />
														</td>
													</tr>
												</table>
											</form>
                                    <!-- end -->
                                    
                                  </div>
        
                  <footer class="footer mt-auto">
            <div class="copyright bg-white">
              <p>
                &copy; <span id="copy-year">2019</span> Copyright Sleek Dashboard Bootstrap Template by
                <a
                  class="text-primary"
                  href="http://www.iamabdus.com/"
                  target="_blank"
                  >Abdus</a
                >.
              </p>
            </div>
            <script>
                var d = new Date();
                var year = d.getFullYear();
                document.getElementById("copy-year").innerHTML = year;
            </script>
          </footer>

      </div>
    </div>
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
    



  </body>
</html>
