<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	/*

TemplateMo 589 lugx gaming

https://templatemo.com/tm-589-lugx-gaming

*/

	/* ---------------------------------------------
Table of contents
------------------------------------------------
01. font & reset css
02. reset
03. global styles
04. header
05. banner
06. features
07. testimonials
08. contact
09. footer

--------------------------------------------- */
	/* 
---------------------------------------------
font & reset css
--------------------------------------------- 
*/
	@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900");

	/* 
---------------------------------------------
reset
--------------------------------------------- 
*/
	html,
	body,
	div,
	span,
	applet,
	object,
	iframe,
	h1,
	h2,
	h3,
	h4,
	h5,
	h6,
	p,
	blockquote,
	div pre,
	a,
	abbr,
	acronym,
	address,
	big,
	cite,
	code,
	del,
	dfn,
	em,
	font,
	img,
	ins,
	kbd,
	q,
	s,
	samp,
	small,
	strike,
	strong,
	sub,
	sup,
	tt,
	var,
	b,
	u,
	i,
	center,
	dl,
	dt,
	dd,
	ol,
	ul,
	li,
	figure,
	header,
	nav,
	section,
	article,
	aside,
	footer,
	figcaption {
		margin: 0;
		padding: 0;
		border: 0;
		outline: 0;
	}

	.clearfix:after {
		content: ".";
		display: block;
		clear: both;
		visibility: hidden;
		line-height: 0;
		height: 0;
	}

	.clearfix {
		display: inline-block;
	}

	html[xmlns] .clearfix {
		display: block;
	}

	* html .clearfix {
		height: 1%;
	}

	ul,
	li {
		padding: 0;
		margin: 0;
		list-style: none;
	}

	header,
	nav,
	section,
	article,
	aside,
	footer,
	hgroup {
		display: block;
	}

	* {
		box-sizing: border-box;
	}

	html,
	body {
		font-family: 'Poppins', sans-serif;
		-ms-text-size-adjust: 100%;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}

	a {
		text-decoration: none !important;
	}

	h1,
	h2,
	h3,
	h4,
	h5,
	h6 {
		color: #1e1e1e;
		margin-top: 0px;
		margin-bottom: 0px;
		font-weight: 700;
	}

	ul {
		margin-bottom: 0px;
	}

	p {
		font-size: 14px;
		line-height: 28px;
		color: #4a4a4a;
	}

	img {
		width: 100%;
		overflow: hidden;
	}

	/* 
---------------------------------------------
Shop Page Style
--------------------------------------------- 
*/
	.trending ul.trending-filter {
		list-style: none;
		text-align: center;
		margin-bottom: 70px;
	}

	.trending ul.trending-filter li {
		display: inline-block;
		margin: 5px 8px;
	}

	.trending ul.trending-filter li a {
		display: inline-block;
		text-align: center;
		font-size: 15px;
		text-transform: uppercase;
		font-weight: 600;
		color: #1e1e1e;
		background-color: #eee;
		padding: 8px 20px;
		border-radius: 25px;
		transition: all .3s;
	}

	.trending ul.trending-filter li a.is_active {
		background-color: #ee626b;
		color: #fff;
	}

	.trending ul.trending-filter li a.is_active:hover {
		color: #fff;
	}

	.trending ul.trending-filter li a:hover {
		color: #ee626b;
	}

	.trending-box .item {
		background-color: #eeeeee;
		position: relative;
		overflow: hidden;
		border-radius: 25px;
		margin-bottom: 30px;
	}

	.trending-box .item .thumb {
		position: relative;
		border-radius: 25px;
		overflow: hidden;
	}

	.trending-box .item span.price em {
		font-style: normal;
		font-weight: 400;
		font-size: 14px;
		text-decoration: line-through;
		display: block;
	}

	.trending-box .item span.price {
		text-align: right;
		position: absolute;
		right: 20px;
		top: 20px;
		border-radius: 10px;
		background-color: #008af8;
		font-size: 17px;
		text-transform: uppercase;
		font-weight: 600;
		color: #fff;
		padding: 8px 15px 6px 15px;
	}

	.trending-box .item .down-content {
		padding: 25px;
	}

	.trending-box .item .down-content span.category {
		font-size: 14px;
		color: #7a7a7a;
		margin-bottom: 5px;
		display: inline-block;
	}

	.trending-box .item .down-content h4 {
		font-size: 17px;
		font-weight: 600;
		transition: all .3s;
	}

	.trending-box .item .down-content a {
		position: absolute;
		display: inline-block;
		text-align: center;
		line-height: 40px;
		width: 40px;
		height: 40px;
		background-color: #ee626b;
		color: #fff;
		border-radius: 50%;
		right: 25px;
		bottom: 25px;
		transition: all .3s;
	}

	.trending-box .item:hover .down-content h4 {
		color: #0071f8;
	}

	.trending-box .item:hover .down-content a {
		background-color: #0071f8;
	}

	.trending ul.pagination {
		margin-top: 50px;
		text-align: center;
		width: 100%;
		display: inline-block;
	}

	.trending ul.pagination li {
		display: inline-block;
		margin: 0px 5px;
	}

	.trending ul.pagination li a {
		display: inline-block;
		width: 40px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		background-color: #eee;
		color: #1e1e1e;
		font-size: 15px;
		font-weight: 600;
		border-radius: 50%;
		transition: all .3s;
	}

	.trending ul.pagination li a:hover,
	.trending ul.pagination li a.is_active {
		background-color: #0071f8;
		color: #fff;
	}
</style>

<div class="section trending">
	<div class="container">
		<ul class="trending-filter">
			<li><a class="is_active" href="#!" data-filter="*">Show All</a>
			</li>
			<li><a href="#!" data-filter=".adv">Adventure</a></li>
			<li><a href="#!" data-filter=".str">Strategy</a></li>
			<li><a href="#!" data-filter=".rac">Racing</a></li>
		</ul>
		<div class="row trending-box">
			<div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
			<c:forEach var="product" items="${prodlist }"></c:forEach>
					<div class="item">
						<div class="thumb">
							<a href="product-details.html"><img src="assets/images/trending-01.jpg" alt=""></a> <span
								class="price"><em>$36</em>$24</span>
						</div>
						<div class="down-content">
							<span class="category">Action</span>
							<h4>Assasin Creed</h4>
							<a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
						</div>
					</div>
			</div>
			
		</div>
	
	</div>
	<div class="row">
		<div class="col-lg-12">
			<ul class="pagination">
				<li><a href="#"> &lt; </a></li>
				<li><a href="#">1</a></li>
				<li><a class="is_active" href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#"> &gt; </a></li>
			</ul>
		</div>
	</div>
</div>