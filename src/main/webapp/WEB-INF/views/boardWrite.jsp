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
  	
  /*	tableform{
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
                                    	<a class="sidenav-item-link" href="/seoul_analysis">
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
                                    	<a href="/logout">
                                    	<i class="mdi mdi-logout"></i> Log Out
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            </c:if>
                            <c:if test = "${sessionScope.userid == null && sessionScope.admin}">
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
                                    
                                    <form id="writeform" action="write" method="post"
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
															<input type="submit" value="저장" class="mb-1 btn btn-info"/>
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
            
          </footer>

      </div>
    </div>
<script>
$('#notice').on('click', function(){
	location.href="/noticeboardPage";
})

</script>
    



  </body>
</html>
