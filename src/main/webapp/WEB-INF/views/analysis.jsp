<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>COCODA</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500" rel="stylesheet" />
    <link href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css" rel="stylesheet" />
    <!-- PLUGINS CSS STYLE -->
    <link href="<c:url value = "/resources/page/plugins/toaster/toastr.min.css"/>" rel="stylesheet" />
    <link href="<c:url value = "/resources/page/plugins/nprogress/nprogress.css"/>" rel="stylesheet" />
    <link href="<c:url value = "/resources/page/plugins/flag-icons/css/flag-icon.min.css"/>" rel="stylesheet" />
    <link href="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>" rel="stylesheet" />
    <link href="<c:url value = "/resources/page/plugins/ladda/ladda.min.css"/>" rel="stylesheet" />
    <link href="<c:url value = "/resources/page/plugins/select2/css/select2.min.css"/>" rel="stylesheet" />
    <link href="<c:url value = "/resources/page/plugins/daterangepicker/daterangepicker.css"/>" rel="stylesheet" />
    <!-- SLEEK CSS -->
    <link id="sleek-css" rel="stylesheet" href="<c:url value = "/resources/page/css/sleek.css"/>" />
    <!-- FAVICON -->
    <link href="<c:url value = "/resources/page/icon.png"/>" rel="shortcut icon" />
    <script src="<c:url value = "/resources/page/plugins/nprogress/nprogress.js"/>"> </script> 
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"> </script>
     <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddea40514a36c7dd14200b5ab87a04ba&libraries=services"></script>
    <script src="<c:url value = "/resources/page/plugins/jquery/jquery.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/toaster/toastr.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/slimscrollbar/jquery.slimscroll.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/charts/Chart.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/ladda/spin.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/ladda/ladda.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/jquery-mask-input/jquery.mask.min.js"/>"> 
    </script> <script src="<c:url value = "/resources/page/plugins/select2/js/select2.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-world-mill.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/daterangepicker/moment.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/daterangepicker/daterangepicker.js"/>"> </script> <%-- <script src="<c:url value = "/resources/page/plugins/jekyll-search.min.js"/>"> </script> --%>
        <script src="<c:url value = "/resources/page/js/sleek.js"/>"></script>
    <script src="<c:url value = "/resources/page/js/chart.js"/>">  </script>
     <script src="<c:url value = "/resources/page/js/date-range.js"/>">
     </script> <script src="<c:url value = "/resources/page/js/map.js"/>">
     </script> <script src="<c:url value = "/resources/page/js/custom.js"/>">
     </script> 


      </head> 	<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
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
                    	<img src="<c:url value = "/resources/page/icon.png"/>" style="height: 33px; width: 33px">
                        <g fill="none" fill-rule="evenodd">
                            <path class="logo-fill-blue" fill="#7DBCFF" d="M0 4v25l8 4V0zM22 4v25l8 4V0z" />
                            <path class="logo-fill-white" fill="#FFF" d="M11 4v25l8 4V0z" />
                        </g> 
                        <span class="brand-name">	</span>
                    </a>
                </div>
                <!-- begin sidebar scrollbar -->
                <div class="sidebar-scrollbar">
                    <!-- sidebar menu -->
                    <ul class="nav sidebar-inner" id="sidebar-menu">
                        <li class="has-sub active expand">
                        	<a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#charts" aria-expanded="false" aria-controls="charts">  
                        		<i class="mdi mdi-chart-pie"></i>
                        		<span class="nav-text">상권분석</span>
                        		<b class="caret"></b>
                                
                            </a>
                            <ul class="collapse show" id="charts" data-parent="#sidebar-menu">
                                <div class="sub-menu">
                                    <li>
                                    	<a class="sidenav-item-link" href="seoul_analysis">
                                            <span class="nav-text">서울시 상권분석</span>
                                        </a>
                                    </li>
                                </div>
                            </ul>
                        </li>
                        <li class="has-sub"><a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#dashboard" aria-expanded="false" aria-controls="dashboard"> <i class="mdi mdi-view-dashboard-outline"></i> <span class="nav-text"> 유저 게시판</span> <b class="caret"></b>
                            </a>
                            <ul class="collapse " id="dashboard" data-parent="#sidebar-menu">
                                <div class="sub-menu">
                                    <li><a class="sidenav-item-link" href="boardPage"> <span class="nav-text">자유게시판</span>
                                        </a></li>
                                    <li><a class="sidenav-item-link" href="qaboardPage"> <span class="nav-text">Q/A</span>
                                            
                                        </a></li>
                                </div>
                            </ul>
                        </li>
                        <li class="has-sub"><a class="sidenav-item-link"> 
                        	<i class="mdi mdi-folder-multiple-outline"></i> <span class="nav-text" id = "notice">공지사항</span> 
                        	<!-- <b class="caret"></b> -->
                            </a>
                           
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
                        <ul class="nav navbar-nav">
                        	<c:if test = "${sessionScope.userid != null}">
                            <!-- User Account -->
                            <li class="dropdown user-menu" style="text-align: right">
                                <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
 				
                                    <span class="d-none d-lg-inline-block"> ${sessionScope.userid} </span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <!-- User image -->
                                    <li class="dropdown-footer">
                                    	<a href="logout">
                                    	<i class="mdi mdi-logout"></i> Log Out
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            </c:if>
                            <c:if test = "${sessionScope.admin != null}">
                            <!-- User Account -->
                            <li class="dropdown user-menu" style="text-align: right">
                                <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
 				
                                    <span class="d-none d-lg-inline-block"> ${sessionScope.admin} </span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <!-- User image -->
                                    <li class="dropdown-footer">
                                    	<a href="logout">
                                    	<i class="mdi mdi-logout"></i> Log Out
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            </c:if>
                            <c:if test = "${sessionScope.userid == null && sessionScope.admin == null}">
                            	<button type="button" id = "login_btn" class="btn btn-default btn-lg btn-block">Login</button>
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- 스타트 컨텐츠 -->
            <div class="content-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- User activity statistics -->
                            <div class="card card-default">
                                <div class="row no-gutters">
                                    <div class="col-xl-4">
                                        <div data-scroll-height="800">
                                            <div class="card-header pt-3 flex-column align-items-start">
                                                <div class="card-header justify-content-between py-20">
                                                    <h2>Trade analysis</h2>
                                                </div>
                                            </div>
                                            <div class="border-bottom"></div>
                                            <div class="card-body">
                                                <form action="result" method="post" id="Mainform">
                                                    <table class="table" valign=middle>
                                                    	<tr>
                                                    		<td style = "text-align : center">
                                                    			<span >
                                                    				주소 찾기
                                                    			</span>
                                                    		</td>
                                                    		<td>
                                                    			<input type = "text" class="form-control" id="search" placeholder=" 주소를 입력해주세요">
                                                    			<button type="button" onclick="searchwhere()">검색</button>
                                                    		</td>
                                                    	</tr>
                                                        <!-- 분석 상권 지정 -->
                                                        <tr>
                                                            <td><span style="font-size: 1em">
                                                                    분석 상권 지정 </span></td>
                                                            <td>
                                                                <div class="result_address" id="result_address"></div>
                                                            </td>
                                                        </tr>
                                                        <!-- 업종 지정 -->
                                                        <tr class="text-center">
                                                            <td style="font-size: 1em"><span style="font-size: 1em">  업종 지정 </span></td>
                                                            <td>
                                                                <div id="sales">
                                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Sales">업종
                                                                        선택</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="text-center">
                                                            <td><span style="font-size: 1em"> 반경</span></td>
                                                            <td><span>500M</span></td>
                                                        </tr>
                                                        <tr class="text-center">
                                                            <td colspan="2">
                                                                <button type="button" class="btn btn-outline-primary" id="analysis">분석하기</button>
                                                                <button type="reset" class="btn btn-outline-primary" id="cancel">취소</button>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!-- Large modal -->
                                                    <div id="Sales" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog  modal-lg modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <ul class="nav nav-tabs">
                                                                        <li class="nav-item"><a value="Q" class="nav-link active" href="#food" id="start">음식</a></li>
                                                                        <li class="nav-item"><a value="F" class="nav-link" href="#service">생활서비스</a></li>
                                                                        <li class="nav-item"><a value="D" class="nav-link" href="#retail">소매</a></li>
                                                                        <li class="nav-item"><a value="N" class="nav-link" href="#entertain">관광/여가/오락</a></li>
                                                                        <li class="nav-item"><a value="P" class="nav-link" href="#sports">스포츠</a></li>
                                                                        <li class="nav-item"><a value="R" class="nav-link" href="#education">학문/교육</a></li>
                                                                        <li class="nav-item"><a value="O" class="nav-link" href="#staying">숙박</a></li>
                                                                        <li class="nav-item"><a value="L" class="nav-link" href="#estate">부동산</a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div id="result"></div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-primary" data-dismiss="modal">선택</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="secret"></div>
                                                </form>
                                                <!-- Body Main Close -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8">
                                        <div class="border-right">
                                            <div class="card-body">
                                                <div id="map" style="width: 90%; height: 700px;"></div>
                                                <div class="tab-content" id="myTabContent"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- col-md-12 -->
                                </div>
                                <!-- row -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    </body>
    <script>
    var dangerarray = ${dangerresult};
    </script>
	<script src="resources/js/mapscript.js"></script>
	<script src="resources/js/polygonscript.js"></script>
	<script>
	$(function(){
		$('#login_btn').on('click', function(){
			location.href="userlogin";
		});
		
		$('.nav-link').on('click', function(){
			$('.nav-link').attr('class', 'nav-link');
			$(this).attr('class', 'nav-link active');
		});
		
		$('#notice').on('click', function(){
			location.href="noticeboardPage";
		})
	})
	
	</script>
</html>