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
var test;
		$(document).ready(function(){
		    
			$('.replyupdateid').on('click', replyupdateid);
			$('.boardupdateid').on('click', boardupdateid);
			
			$("button.mbtn").click(function(){
				$(".b").toggle();
			});
			
			$("button.qareplyupdate").click(function(){
				$(this).parent().siblings(".a").toggle();
				$(this).parent().toggle();
			})
		});
		
		function boardupdateid(){
			var id= '${sessionScope.userid}';
			var title = document.getElementById("title").value; 
			var boardnum = '${eachBoard.boardnum}';	
			var content = document.getElementById("content").value;
				
			var ttt = {id:id, content:content, boardnum:boardnum, title:title};
			console.log(ttt);
				$.ajax({
					url:'qaupdate'
					,data:ttt
					,type:'get'
						, success: function(){
							location.href = "qareadingEachBoard?boardnum=" + boardnum;
							}
				})
		}
		
		function replyupdateid(){
			
			var id = '${sessionScope.admin}';
			var text = $(this).parent().prev().children().val();
			var boardnum='${eachBoard.boardnum}';
			var replynum = $(this).attr('replynum');
			
			$.ajax({
				url: 'qareplyupdate',
				data: {
					id : id
					,text:text
					,boardnum:boardnum
					,replynum:replynum
				},
				type: 'get'
				, success: function(){
				location.href = "qareadingEachBoard?boardnum=" + boardnum;
				}
			});
		}
		
		
		//function submit(){
			// $('modifytable').submit();
		//}
		
		function pagingFormSubmit(currentPage) {		
				var form = document.getElementById('pagingForm');	
				var page = document.getElementById('page');	
				page.value = currentPage;	
				form.submit();	
			}	
		

		function replyFormCheck() {
			var retext = document.getElementById('retext');
			if (retext.value.length < 5) {
				alert('리플 내용을 입력하세요.');
				retext.focus();
				retext.select();

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
  	
  /*	.tableform{
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
                          <div class="card card-default" id="user-activity">
                            <div class="row no-gutters">
                              <div class="col-xl-12">
                                <div class="border-right">
                                  <div class="card-header justify-content-between py-5">
                                    <h2>Trade analysis</h2>
                                  </div>
                                 
                                  
                                 <!-- 여기 -->
                                  <div class="card-body">
                                    
                                     <div class="card-body">
                                    <!--<div class="modifyForm">  -->
                                    <table class="table">
											<thead><tr><th class="boardnum">번호</th>
										    	<th class="title">제목</th>
										    	<th class="id">작성자</th>
										    	<th class="hits">조회수</th>
										    	<th class="inputdate">등록일</th></tr></thead>
										    	
											<tbody> 
												<tr><td class="boardnum">${eachBoard.boardnum}</td>
										    	<td class="b">${eachBoard.title}</td> 
										    		<td class="b" style="display: none">
														<input type="text"   value="${eachBoard.title}" name="title" id="title">
													</td>
										    	<td class="id">${eachBoard.id }</td>
										    	<td class="hits">${eachBoard.hits }</td>
										    	<td class="inputdate">${eachBoard.inputdate }</td></tr>
										    	
										    	<tr>
										    	<td colspan="5" class="b">
										    	 ${eachBoard.content }
										    	</td>
										    		<td class="b" style="display: none" colspan="5">
														<input type="text" value="${eachBoard.content }" name="content" id="content" style="width:670px; height:100px;" >     
													</td>
										    	</tr>
										    	<tr>
										    	<td colspan="5" class="b" >
										    		<c:if test="${sessionScope.userid == eachBoard.id }">
										    		<!--<c:choose>
										    			<c:when test="">삭제</c:when>
										    		</c:choose>-->
										    		<button class="mbtn mb-1 btn btn-info">수정</button>		    		
										    		<button class="del_button"><a href ="qadelete?boardnum=${eachBoard.boardnum }" class="mb-1 btn btn-info">삭제</a></button>
											    	</c:if>	
										    	</td>
										    		<td class="b" style="display: none" colspan="5">
														<input class="boardupdateid mb-1 btn btn-info" boardnum="${eachBoard.boardnum }" type="button" value="수정완료">
													</td> 
										    	</tr>
										    	</tbody>
										</table>
										<!-- </div> -->
		
		<!-- 리플테이블 -->
		<div class="modifyreply">
		<table class="table">
			<c:forEach var="reply" items="${replylist }">
				<tr>
					<td class="replyid">
						<b>${reply.id }</b>
					</td>
					<!-- <td class="modifyreply" hidden="true">
						<input type="text" value="${reply.text }" name="text">
						<input type="submit" value="수정완료">
					</td> -->
					<td class="a">
						${reply.text }
					</td>
				
					<td class="a">
						<c:if test="${sessionScope.admin != null}">
							<button><a href ="qareplydelete?replynum=${reply.replynum}&boardnum=${eachBoard.boardnum}" class="mb-1 btn btn-info">삭제</a></button>
							<button class="qareplyupdate mb-1 btn btn-info">수정</button>
						</c:if>
					</td> 
					<td class="a" style="display: none">
						<input type="text"   value="${reply.text }" name="text" id="text" class="mb-1 btn btn-info">
					</td>
					<td class="a" style="display: none">
				
						<input class="replyupdateid mb-1 btn btn-info" replynum="${reply.replynum}" type="button" value="수정완료">
					</td>
				
				</tr>
			</c:forEach>
				
		
		<!-- 리플 쓰는 곳 -->	
		<c:if test ="${sessionScope.admin ne null }">
			<tr>
			<td>
				
				<b>${sessionScope.admin }</b>
			</td>
			<td>
			<form id="replyform" action="qareplyWrite" method="post" onSubmit="return replyFormCheck();">
				<input type="hidden" name="boardnum" value="${eachBoard.boardnum}" />
				<input type="text" name="text" id="retext" style="width:500px;" />	
			<td>		
				<input type="submit" value="확인" class="mb-1 btn btn-info"/>		
			</td>
			</form>
			</td>
			</tr>
		</c:if>
		</table>
		
		</div>
		</div>
		
	<!-- <div class="modifyreply" hidden=true>
		<table class="tableform">
			<c:forEach var="reply" items="${replylist }">
				<tr>
					<td class="replyid">
						<b>${reply.id }</b>
					</td>
					<td>
						<input type="text" value="${reply.text }" name="text">
						<input type="submit" value="수정완료">
					</td> 
				</tr>
			</c:forEach>
			</table>
			</div>  -->
		
		
		
                                    
                                  </div>
                                    
                                  </div>
                                 <!-- 끝 -->
        
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
            $('#notice').on('click', function(){
    			location.href="noticeboardPage";
    		});
            
            $('#login_btn').on('click', function(){
    			location.href="userlogin";
    		});
    		
            </script>
          </footer>

      </div>
    </div>

    



  </body>
</html>
