<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link href="css/tiny-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Furni Free Bootstrap 5 Template for Furniture and
	Interior Design Websites by Untree.co</title>
</head>


<div class="untree_co-section product-section before-footer-section">
	<div class="container">
		<div class="row">

			<!-- Start Column 1 -->
			<c:forEach var="board" items="${boardList }">
				<div class="col-12 col-md-4 col-lg-3 mb-5">
					<a class="product-item" href="#"> <img src="images/${board.boardThumbnail}"
						class="img-fluid product-thumbnail">
						<h3 class="product-title">${board.boardTitle}</h3> <strong
						class="product-price">${board.price}</strong> <span
						class="icon-cross"> <img src="images/cross.svg"
							class="img-fluid">
					</span>
					</a>
				</div>
			</c:forEach>
			<!-- End Column 1 -->

		</div>
	</div>
</div>

