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
              <a href="/index.html">
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
                              <a class="sidenav-item-link" href="index.html">
                                <span class="nav-text">Ecommerce</span>
                                
                              </a>
                            </li>
                            <li class="active" >
                              <a class="sidenav-item-link" href="analytics.html">
                                <span class="nav-text">Analytics</span>
                                
                                <span class="badge badge-success">new</span>
                                
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
                <ul class="nav navbar-nav">
                  
           
                  <!-- User Account -->
                  <li class="dropdown user-menu" style = "text-align : right">
                    <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                      <img src="<c:url value = "/resources/page/img/user/user.png"/>" class="user-image" alt="User Image" />
                      <span class="d-none d-lg-inline-block">Abdus Salam</span>
                    </button>
                    
                    <ul class="dropdown-menu dropdown-menu-right">
                      <!-- User image -->
                      
                      <li>
                        <a href="profile.html">
                          <i class="mdi mdi-account"></i> My Profile
                        </a>
                      </li>

                      <li class="dropdown-footer">
                        <a href="signin.html"> <i class="mdi mdi-logout"></i> Log Out </a>
                      </li>
                      
                    </ul>
                  </li>
                  
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
                                  
                                  <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                      <div class="tab-pane fade show active" id="user" role="tabpanel" aria-labelledby="home-tab">
                                          <%-- <canvas id="activity" class="chartjs"></canvas> --%>
                                          <form action="location" method="post" id="Mainform">
											<table class="centered">
												<tr>
													<td colspan="2">
														<div id="map" style="width: 100%; height: 500px;"></div>
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
											
						
						<!-- Large modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>
							
							<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg">
							    <div class="modal-content">
							      ...
							    </div>
							  </div>
							</div>
						
											

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
                                  </div>
                                  
                                </div>
                              </div>
                  <!-- col-md-12 -->      
				</div>
				<!-- row -->
			</div>

			<div class="row">
				<div class="col-xl-6 col-12">
					                        
                          <!-- User Acquisition Statistics -->
                          <div class="card card-default" id="user-acquisition">
                            <div class="card-header justify-content-between pb-5">
                              <h2>User Acquisition</h2>
                            </div>

                            <ul class="nav nav-tabs nav-style-border justify-content-between justify-content-lg-start border-bottom" role="tablist">
                              <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#traffic-channel" role="tab" aria-controls="" aria-selected="true">Traffic Channel</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#source-medium" role="tab" aria-controls="" aria-selected="false">Source / Medium </a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#referrals" role="tab" aria-controls="" aria-selected="false">Referrals</a>
                              </li>
                            </ul>
                            <div class="tab-content p-3 p-lg-5" id="myTabContent">
                              <div class="tab-pane fade show active pb-4" id="source-medium" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="mb-5" style=" height:32vh">
                                  <canvas id="acquisition" class="chartjs2"></canvas>
                                  <div id="acqLegend" class="customLegend mb-2"></div>
                                </div>
                              </div>
                            </div>
                            <div class="card-footer d-flex flex-wrap bg-white">
                              <a href="#" class="text-uppercase py-3">Audience Overview</a>
                            </div>
                          </div>

				</div>
				<div class="col-xl-6 col-12">
					
                          <!-- World Chart -->

                          <div class="card card-default" id="analytics-country">
                            <div class="card-header justify-content-between">
                              <h2>Sessions by Country</h2>
                              <div class="date-range-report ">
                                <span></span>
                              </div>
                            </div>
                            <div class="card-body vector-map-world-2">
                              <div id="analytic-world" style="height: 100%; width: 100%;"></div>
                            </div>
                            <div class="border-top">
                              <div class="row no-gutters">
                                <div class="col-lg-6">
                                  <div class="world-data-chart border-bottom py-4">
                                    <canvas id="hbar1" class="chartjs"></canvas>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <div class="world-data-chart py-4 ">
                                    <canvas id="hbar2" class="chartjs"></canvas>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="card-footer d-flex flex-wrap bg-white">
                              <a href="#" class="text-uppercase py-3">Audience Overview</a>
                            </div>
                          </div>

				</div>
			</div>

			<div class="row">
				<div class=" col-xl-4 ">
					               
                          <!-- Sessions By device Chart -->
                          <div class="card card-default" id="analytics-device" data-scroll-height="580">
                            <div class="card-header justify-content-between">
                              <h2>Sessions by Device</h2>
                            </div>
                            <div class="card-body">
                              <div class="pb-5">
                                <canvas id="deviceChart"></canvas>
                              </div>
                              <div class="row no-gutters justify-content-center">
                                <div class="col-4 col-lg-3">
                                  <div class="card card-icon-info text-center border-0">
                                    <i class="mdi mdi-desktop-mac"></i>
                                    <p class="pt-3 pb-1">Desktop</p>
                                    <h4 class="text-dark pb-1">60.0%</h4>
                                    <span class="text-danger">1.5% <i class="mdi mdi-arrow-down-bold"></i></span>
                                  </div>
                                </div>
                                <div class="col-4 col-lg-3">
                                  <div class="card card-icon-info text-center border-0">
                                    <i class="mdi mdi-tablet-ipad"></i>
                                    <p class="pt-3 pb-1">Tablet</p>
                                    <h4 class="text-dark pb-1">15.0%</h4>
                                    <span class="text-success">1.5% <i class="mdi mdi-arrow-up-bold"></i></span>
                                  </div>
                                </div>
                                <div class="col-4 col-lg-3">
                                  <div class="card card-icon-info text-center border-0">
                                    <i class="mdi mdi-cellphone-android fa-3x"></i>
                                    <p class="pt-3 pb-1">Mobile</p>
                                    <h4 class="text-dark pb-1">25.0%</h4>
                                    <span class="text-success">1.5% <i class="mdi mdi-arrow-up-bold"></i></span>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

				</div>
				<div class=" col-xl-4 ">
					
                          <!-- Page Views  -->
                          <div class="card card-default table-borderless" id="page-views" data-scroll-height="580">
                            <div class="card-header justify-content-between">
                              <h2>Page Views</h2>
                              <div class="date-range-report ">
                                <span></span>
                              </div>
                            </div>
                            <div class="card-body slim-scroll py-0">
                              <table class="table page-view-table ">
                                <thead>
                                  <tr>
                                    <th>Page</th>
                                    <th>Page Views</th>
                                    <th>Value</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="analytics.html">/analytics.html</a></td>
                                    <td>521</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="email-inbox.html">/email-inbox.html</a></td>
                                    <td>356</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="email-compose.html">/email-compose.html</a></td>
                                    <td>254</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="charts-chartjs.html">/charts-chartjs.html</a></td>
                                    <td>126</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="profile.html">/profile.html</a></td>
                                    <td>50</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="general-widgets.html">/general-widgets.html</a></td>
                                    <td>50</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="card.html">/card.html</a></td>
                                    <td>590</td>
                                    <td>$0.00</td>
                                  </tr>
                                  <tr>
                                    <td class="text-primary"><a class="link" href="email-inbox.html">/email-inbox.html</a></td>
                                    <td>29</td>
                                    <td>$0.00</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                            <div class="card-footer bg-white py-4">
                              <a href="#" class="text-uppercase">Audience Overview</a>
                            </div>
                          </div>

				</div>
				<div class=" col-xl-4 ">
					<!-- Notification Table -->
					<div class="card card-default" data-scroll-height="580">
						<div class="card-header justify-content-between">
							<h2>Latest Notifications</h2>
							<div>
								<button class="text-black-50 mr-2 font-size-20"><i class="mdi mdi-cached"></i></button>
								<div class="dropdown show d-inline-block widget-dropdown">
									<a class="dropdown-toggle icon-burger-mini" href="#" role="button" id="dropdown-notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static"></a>
									<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-notification">
										<li class="dropdown-item"><a href="#">Action</a></li>
										<li class="dropdown-item"><a href="#">Another action</a></li>
										<li class="dropdown-item"><a href="#">Something else here</a></li>
									</ul>
								</div>
							</div>

						</div>
						<div class="card-body slim-scroll py-4">
							<div class="media pb-4 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
									<i class="mdi mdi-cart-outline font-size-20"></i>
								</div>
								<div class="media-body pr-3 ">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="#">New Order</a>
									<p >Selena has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 10 AM</span>
							</div>

							<div class="media py-3 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-success text-white">
									<i class="mdi mdi-email-outline font-size-20"></i>
								</div>
								<div class="media-body pr-3">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="#">New Enquiry</a>
									<p >Phileine has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 9 AM</span>
							</div>


							<div class="media py-3 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-warning text-white">
									<i class="mdi mdi-stack-exchange font-size-20"></i>
								</div>
								<div class="media-body pr-3">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="#">Support Ticket</a>
									<p >Emma has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 10 AM</span>
							</div>

							<div class="media py-3 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-primary text-white">
									<i class="mdi mdi-cart-outline font-size-20"></i>
								</div>
								<div class="media-body pr-3">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="#">New order</a>
									<p >Ryan has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 10 AM</span>
							</div>

							<div class="media py-3 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-info text-white">
									<i class="mdi mdi-calendar-blank font-size-20"></i>
								</div>
								<div class="media-body pr-3">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="">Comapny Meetup</a>
									<p >Phileine has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 10 AM</span>
							</div>

							<div class="media py-3 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-warning text-white">
									<i class="mdi mdi-stack-exchange font-size-20"></i>
								</div>
								<div class="media-body pr-3">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="#">Support Ticket</a>
									<p >Emma has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 10 AM</span>
							</div>

							<div class="media py-3 align-items-center justify-content-between">
								<div class="d-flex rounded-circle align-items-center justify-content-center mr-3 media-icon iconbox-45 bg-success text-white">
									<i class="mdi mdi-email-outline font-size-20"></i>
								</div>
								<div class="media-body pr-3">
									<a class="mt-0 mb-1 font-size-15 text-dark" href="#">New Enquiry</a>
									<p >Phileine has placed an new order</p>
								</div>
								<span class=" font-size-12 d-inline-block"><i class="mdi mdi-clock-outline"></i> 9 AM</span>
							</div>

						</div>
						<div class="mt-3"></div>
					</div>

				</div>
			</div>
</div>

          


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
