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
   
	 function pagingFormSubmit(currentPage) {		
			var form = document.getElementById('pagingForm');	
			var page = document.getElementById('page');	
			page.value = currentPage;	
			form.submit();	
		} 
 
	</script>
  <style type="text/css">
  	.navigatorbox{
  		
  		text-align: center;
  	}
  		.jsfontsize{
  		font-size:16px;
  		color:#3F8C85; /*#0D5673*/
  	}
  /*	.tableform th{
			height:45px;
			text-align: center;
			font-size:17px;
			font-weight: bold;
			letter-spacing:2px;
			background-color:#E6E9F2;
		}
		
		.tableform{
			
			width:700px;
			margin: auto;
			text-decoration:none;
		}
		

		.tableform td{
			padding: 10px;
			background-color:#F2F2F0;
			text-align: left;
		}
		
		.tableform td a{
			text-decoration:none;
		}
		
		.tableform tbody tr td:hover { background: #FFFEF9;}*/
		
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
                        <li class="has-sub active ">
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
                        <li class="has-sub expand active"><a class="sidenav-item-link"> 
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
                          <div class="card card-default" id="user-activity">
                            <div class="row no-gutters">
                              <div class="col-xl-12">
                                <div class="border-right">
                                  <div class="card-header justify-content-between py-5">
                                    <h2>Notice</h2>
                                  </div>
                                  
                                  
                                <!-- 여기 -->
                                  <div class="card-body">
                                    <c:if test="${sessionScope.admin != null }">
											<input type="button" value="글쓰기" onClick="location.href='noticetowrite';" class="mb-1 btn btn-info" style="float:right;">
										</c:if>
			                      <table class="table">
									<tr><th class="boardnum">번호</th>
								    	<th class="title">제목</th>
								    	<th class="id">작성자</th>
								    	<th class="hits">조회수</th>
								    	<th class="inputdate">등록일</th></tr>
								    <tbody> 
										<c:forEach var="item" items="${boardlist }">
										<tr><td class="boardnum">${item.boardnum}</td>
								    	<td class="title"><a href="noticeboardPagereadingEachBoard?boardnum=${item.boardnum }">${item.title}</a></td> 
								    	<td class="id">${item.id }</td>
								    	<td class="hits">${item.hits }</td>
								    	<td class="inputdate">${item.inputdate }</td></tr>
								  		</c:forEach>
								    	</tbody>				    	
								</table>							
									<!-- here -->
									
									<div class="navigatorbox">
										<div id="navigator">			
											<!-- 페이지 이동 부분 -->		
											<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})"  class="jsfontsize">◁◁		
											</a>		
											&nbsp;&nbsp;		
											<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})"  class="jsfontsize">◀</a>		
											&nbsp;&nbsp;		
											<c:forEach var="counter" begin="${navi.startPageGroup}"		
												end="${navi.endPageGroup}">	
												<c:if test="${counter == navi.currentPage}">	
													<b  class="jsfontsize">${counter}</b>&nbsp;	
												</c:if>	
												<c:if test="${counter != navi.currentPage}">
													<a href="javascript:pagingFormSubmit(${counter})"  class="jsfontsize">${counter}</a>&nbsp;	
												</c:if>	
											</c:forEach>		
											&nbsp;&nbsp;		
											<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})"  class="jsfontsize">▶</a>		
											&nbsp;&nbsp;		
											<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})"  class="jsfontsize">▷▷</a>		
										</div>	</br>		
										<!-- /페이지 이동 끝 -->	
										
										<form id="pagingForm" method="get" action="noticeboardPage">
											<input type="hidden" name="page" id="page"></br>
											<!-- 제목 : -->
											<input type="text" name="searchText" value="${searchText}" style="height:40px; width:350px;" /> &nbsp&nbsp
											<input type="button" onclick="javascript:pagingFormSubmit(1)" value="검색"  class="mb-1 btn btn-info">
										</form>
										
										
										
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
            $('#login_btn').on('click', function(){
    			location.href="userlogin";
    		});
    		
            
               $(function(){
            	   $('#notice').on('click', function(){
            			location.href="noticeboardPage";
            		})
               })
            </script>
          </footer>

      </div>
    </div>




  </body>
</html>
