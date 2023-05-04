<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/* Sidebar Styles */

.sidebar-nav {
  position: absolute;
  top: 0;
  width: 250px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.sidebar-nav li {
  text-indent: 20px;
  line-height: 40px;
}

.sidebar-nav li a {
  display: block;
  text-decoration: none;
  color: #999999;
}

.sidebar-nav li a:hover {
  text-decoration: none;
  color: #fff;
  background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
  text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
  height: 65px;
  font-size: 18px;
  line-height: 60px;
}

.sidebar-nav>.sidebar-brand a {
  color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
  color: #fff;
  background: none;
}

</style>

<form action="getBoard.do" method="GET">

	<div class="md-prod-page">
		<div class="md-prod-page-in">
			<div class="page-preview">
				<div class="preview">

					<div class="container px-4 px-lg-5 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-6">
								<h4 class="mb-1">${boardInfo.boardTitle } </h4>
								${boardInfo.subCategoryName}
								<img class="card-img-top" src="images/${boardInfo.boardAttach }" alt="..." />
							</div>
							<div class="col-md-6">
								<h3 class="display-5 fw-bolder">${boardInfo.productName}</h3>
								<div class="fs-5 mb-5">
									<span><fmt:formatNumber value="${boardInfo.price}" pattern="#,###" /></span>
								</div>
							</div>
							<a href="#"><i class="fa fa-star" aria-hidden="true"></i>장바구니</a>
							<div class="col-md-6">
								게시글 내용 : ${boardInfo.boardContent}
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div id="content">
		<button type="button" id="addBtn">판매 등록</button>
	</div>

	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
				<li class="sidebar-brand"> <a href="#"> Start Bootstrap </a> </li>
				<li> <a href="#">Dashboard</a> </li>
				<li> <a href="#">Shortcuts</a> </li>
				<li> <a href="#">Overview</a> </li>
				<li> <a href="#">Events</a> </li>
				<li> <a href="#">About</a> </li>
				<li> <a href="#">Services</a> </li>
				<li> <a href="#">Contact</a> </li>
		</ul>
</div> <!-- /#sidebar-wrapper -->
</form>
<script>
	
</script>