<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
 #container{
  text-align: center;
  justify-content: center;
 }
 .button {
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {background-color: #3b5d50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */


	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

	.rate {
		display: inline-block;
		border: 0;
		margin-right: 15px;
	}

	.rate>input {
		display: none;
	}

	.rate>label {
		float: right;
		color: #ddd
	}

	.rate>label:before {
		display: inline-block;
		font-size: 1rem;
		padding: .3rem .2rem;
		margin: 0;
		cursor: pointer;
		font-family: FontAwesome;
		content: "\f005 ";
	}

	.rate .half:before {
		content: "\f089 ";
		position: absolute;
		padding-right: 0;
	}

	.rate input:checked~label,
	.rate label:hover,
	.rate label:hover~label {
		color: #f73c32 !important;
	}

	.rate input:checked+.rate label:hover,
	.rate input input:checked~label:hover,
	.rate input:checked~.rate label:hover~label,
	.rate label:hover~input:checked~label {
		color: #f73c32 !important;
	}
</style>

<div id="container">

<form action="addReview.do" method="post" enctype="multipart/form-data">
	 <!-- Add Product -->
    <div class="w3-row-padding">
      <div class="w3-col s4">
        ${id}<br>
        ${companyNo}<br>
        ${mno}<br>
        <h4>후기 등록</h4>
             <select id="porductName">
                 <option value="">상품 이름</option>
                 <c:forEach var="my" items="${myOrder }"><option value="${my.productNo }">${my.productName }</option></c:forEach>
             </select>
             <select id="orderDate">
                 <option value="">구매 날짜</option>
                 <c:forEach var="my" items="${myOrder }"><option value="${my.orderDate }">${my.orderDate }</option></c:forEach>
             </select>
		<br>

        
        <table style="margin-left:auto;margin-right:auto;">
	        <tr>
	        	<th>내용</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="내용" name="rcontent" required></td>
	        </tr>
	        <tr>
	        	<th>평점</th>
	        	<td><fieldset class="rate">
			      <input type="radio" id="rating5" name="score" value="5"><label for="rating5" title="5점"></label>
			      <input type="radio" id="rating4" name="score" value="4"><label for="rating4" title="4점"></label>
			      <input type="radio" id="rating3" name="score" value="3"><label for="rating3" title="3점"></label>
			      <input type="radio" id="rating2" name="score" value="2"><label for="rating2" title="2점"></label>
			      <input type="radio" id="rating1" name="score" value="1"><label for="rating1" title="1점"></label>
			  	</fieldset></td>
	        </tr>
	        
	        <tr>
	        	<th>Attach</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="attach" name="attach" required></td>
	        </tr>
	        <tr>
	        	<th>MemberNo</th>
	        	<td><c:forEach var="list" items="${myOrder }"><input class="w3-input w3-border" type="text" name="mno" value="${list.memberNo}" 
	        	readonly></c:forEach></td>
	        	<!-- style="display: none;" -->
	        </tr>
	        <tr>
	        	<th>boardNo</th>
	        	<td><c:forEach var="list" items="${myOrder }"><input class="w3-input w3-border" type="text" name="bno" value="${list.boardNo}" 
	        	readonly></c:forEach></td>
	        	<!-- style="display: none;" -->
	        </tr>
	        <tr>
	        	<td>
		          <button type="submit" class="button button1">등록</button>
		          <button type="reset" class="button button2">취소</button>
	         	</td>
	        </tr>
        </table>
      </div>
    </div>
</form>
</div>



<script>

const ratingInputs = document.querySelectorAll('input[name="score"]');

ratingInputs.forEach((input) => {
  input.addEventListener("change", () => {
    console.log(input.value);
  });
});

const productNameSelect = document.getElementById("porductName");
const orderDateSelect = document.getElementById("orderDate");

productNameSelect.addEventListener("change", () => {
  console.log(productNameSelect.value);
});

orderDateSelect.addEventListener("change", () => {
  console.log(orderDateSelect.value);
});

const fileInput = document.querySelector('input[type="file"]');
fileInput.addEventListener('change', function() {
  const fileList = this.files;
  for (let i = 0; i < fileList.length; i++) {
    console.log(fileList[i].name);
  }
});

</script>