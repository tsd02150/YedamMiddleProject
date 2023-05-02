<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#search {
	margin: 0 auto;
	text-align: center;
	background-color: #3B5D50;
	color: #ffffff;
}

#search input {
	width: 500px;
}

#searchDetail {
	margin: 0 auto;
	width: 800px;
}

#mainBody {
	text-align: center;
}

#carouselExample {
	margin: 0 auto;
	margin-top: 50px;
	width: 1200px;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">

</head>
<body id="mainBody">
<div style="background-color: #3B5D50;">
	<div id="search">
		<div id="searchDetail">
			<table>
				<td><p style="margin-right: 20px;">Category</p></td>
				<td><input type="text"></td>
				<td><button type="submit">검색</button></td>
			</table>
		</div>
	</div>
	<div style="width: 1200px; margin: 0 auto;">
		<div>
			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<svg
							class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
							width="800" height="400" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: First slide"
							preserveAspectRatio="xMidYMid slice" focusable="false" style="border-radius: 10px">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#777"></rect>
							<text x="50%" y="50%" fill="#555" dy=".3em">First slide</text></svg>
					</div>
					<div class="carousel-item">
						<svg
							class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
							width="800" height="400" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: Second slide"
							preserveAspectRatio="xMidYMid slice" focusable="false" style="border-radius: 10px">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#666"></rect>
							<text x="50%" y="50%" fill="#444" dy=".3em">Second slide</text></svg>
					</div>
					<div class="carousel-item">
						<svg
							class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
							width="800" height="400" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: Third slide"
							preserveAspectRatio="xMidYMid slice" focusable="false" style="border-radius: 10px">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#555"></rect>
							<text x="50%" y="50%" fill="#333" dy=".3em">Third slide</text></svg>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExample" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExample" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
</div>
</div>
<div style="width: 1200px; margin: 0 auto;">
		<div style="height: 500px">
			<div class="card" style="width: 18rem;">
				<svg class="bd-placeholder-img card-img-top" width="100%"
					height="180" xmlns="http://www.w3.org/2000/svg" role="img"
					aria-label="Placeholder: Image cap"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<title>Placeholder</title><rect width="100%" height="100%"
						fill="#868e96"></rect>
					<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
				<div class="card-body">
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
		</div>
	
	<div class="footer-section" style="background-color: #eff2f1">
		<div class="row g-5 mb-5">
			<div class="col-lg-4">
				<div class="mb-4 footer-logo-wrap">
					<a href="#" class="footer-logo">고객센터</a>
				</div>
				<p class="mb-4">
					전화상담 : 0000-0000<br>온라인 상담 : 1:1 문의
				</p>

				<ul class="list-unstyled custom-social">
					<li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
					<li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
					<li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
					<li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
				</ul>
			</div>

			<div class="col-lg-4">
				<div class="mb-4 footer-logo-wrap">
					<a href="#" class="footer-logo">공지사항</a>
				</div>
				<ul class="list-unstyled">
					<li><a href="#">test1</a></li>
					<li><a href="#">test2</a></li>
					<li><a href="#">test3</a></li>
					<li><a href="#">test4</a></li>
				</ul>
			</div>
			<div class="col-lg-4">
				<div class="mb-4 footer-logo-wrap">
					<a href="#" class="footer-logo">자주보는 질문</a>
				</div>
				<ul class="list-unstyled">
					<li><a href="#">test1</a></li>
					<li><a href="#">test2</a></li>
					<li><a href="#">test3</a></li>
					<li><a href="#">test4</a></li>
				</ul>
			</div>


		</div>
	</div>
	</div>
</body>
</html>