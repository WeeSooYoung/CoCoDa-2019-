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
    <script src="<c:url value = "/resources/page/plugins/jquery-mask-input/jquery.mask.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/select2/js/select2.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/jvectormap/jquery-jvectormap-world-mill.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/daterangepicker/moment.min.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/plugins/daterangepicker/daterangepicker.js"/>"> </script> 
    <%-- <script src="<c:url value = "/resources/page/plugins/jekyll-search.min.js"/>"> </script> --%>
    <script src="<c:url value = "/resources/page/js/sleek.js"/>"></script>
    <script src="<c:url value = "/resources/page/js/chart.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/js/date-range.js"/>"> </script> 
    <script src="<c:url value = "/resources/page/js/map.js"/>"> </script>
    <script src="<c:url value = "/resources/page/js/custom.js"/>"> </script> 
    
    
    <script src = "<c:url value = "/resources/js/raphael.js"/>"></script>
    <script src = "<c:url value = "/resources/js/tui-code-snippet.js"/>"></script>
    <script src = "<c:url value = "/resources/js/tui-chart.min.js"/>"></script>

 
 
	<link rel="stylesheet" href="<c:url value = "/resources/css/tui-chart.min.css"/>">
	<link rel="stylesheet" href="<c:url value = "/resources/css/else.css"/>">

    
    <script src = "<c:url value = "/resources/js/justgage.1.0.1.js"/>"></script>
    <script src = "<c:url value = "/resources/js/attraction.js"/>"></script>
    <script src = "<c:url value = "/resources/js/offer.js"/>"></script>
    <script src = "<c:url value = "/resources/js/total.js"/>"></script>
    <script src = "<c:url value = "/resources/js/population.js"/>"></script>
    
    
</head> 
	<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
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
                        <span class="brand-name">CoCoDa</span>
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
                                    <li><a class="sidenav-item-link" href="/boardPage"> <span class="nav-text">자유게시판</span>
                                        </a></li>
                                    <li><a class="sidenav-item-link" href="/qaboardPage"> <span class="nav-text">Q/A</span>
                                            
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
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div data-scroll-height="800">
                                                <div class="card-header justify-content-between py-20">
                                                    <h2>상권 결과</h2>
                                                </div>
                                            <div class="border-bottom"></div>
                                            <div class="card-body">
                                                <ul class="nav nav-tabs">
                                                
													<li class="nav-item">
														<a class="nav-link active" id="Total"> 종합 분석</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" id = "Population">인구 분석</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" id = "Sales">매출 분석</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" id = "Facility">집객 시설</a>
													</li>
													
												</ul>
                                                	
                             					<div id = "result"></div>
                             					
                             					<div id = "focustable"></div>
                             					
                             					<div id = "defaulttable"></div>
                                                
                                                <!-- Body Main Close -->
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
	var cx = ${cx};
	var cy = ${cy};
	var sales_num = ${sales_num};
	var sigungu_cd = ${sigungu_cd};
	var sigungu_nm = '${sigungu_nm}';
	var address = '${address}';
	var sales_divison_s_cd = '${sales_division_s_cd}';
	var sales_division_s_nm = '${division_nm}';
	var sales_nm = '${sales_nm}';
		var temp = {
			'sigungu_cd' : sigungu_cd,
			'sales_divison_s_cd' : sales_divison_s_cd,
			'cx' : cx,
			'cy' : cy,
			'indsLclsCd' : sales_divison_s_cd.substring(0,1),
			'indsMclsCd' : sales_divison_s_cd.substring(0,3),
			'indsSclsCd' : sales_divison_s_cd,
			'indeSclsNm' : sales_division_s_nm
	};
	
	
	var temp2 = {
			'sigungu_cd' : sigungu_cd,
			'wgsx' : cy,
			'wgsy' : cx
	};
	
	var temp3 = {

			'sigungu_cd' : sigungu_cd,
			'sales_divison_s_cd' : sales_divison_s_cd
	};
	
	$(function(){
		$('#notice').on('click', function(){
			location.href="/noticeboardPage";
		})
		
		$('#login_btn').on('click', login);
		
		$('.nav-link').on('click', change_nav);
		
		$('#Total').on('click', total_func);
		
		$('#Population').on('click', pop_func)
		
		$('#Sales').on('click', sale_func)
		
		$('#Facility').on('click', fac_func)
		
	});
	
	function change_nav(){
		$('.nav-link').attr('class', 'nav-link');
		$(this).attr('class', 'nav-link active');
	}
	
	function total_func(){
		 total(temp3);
	}
	
	function pop_func(){
		population(temp);
	}
	
	function sale_func(){
		offer(temp);
	}
	
	function fac_func(){
		attraction(temp2);
	}
	
	function reset(){
		$('#defaulttable').empty();
		
		$('#focustable').empty();
		
		$('#result').empty();
	}
	function login(){
		location.href="userlogin";
	}
	
	
	
</script>

</html>