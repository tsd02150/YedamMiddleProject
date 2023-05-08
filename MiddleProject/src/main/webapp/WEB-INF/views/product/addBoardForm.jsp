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
</style>

<div id="container">

<form action="addBoard.do" method="post" enctype="multipart/form-data">
	 <!-- Add Product -->
    <div class="w3-row-padding">
      <div class="w3-col s4">
        ${id}<br>
        ${companyNo}<br>
        
             <select id="mainCategoryName">
                 <option value="">대분류</option>
             </select>
             <select id="subCategoryName">
                 <option value="">소분류</option>
             </select>
             <select id="productName" name="pno">
                 <option value="">상품 이름</option>
             </select>

		<br>
        
        <h4>게시글 등록</h4>
        <table style="margin-left:auto;margin-right:auto;">
	        <tr>
	        	<th>제목</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="제목" name="title" required></td>
	        </tr>
	        <tr>
	        	<th>내용</th>
	        	<td><input class="w3-input w3-border" type="text" placeholder="내용" name="content" required></td>
	        </tr>
	        <tr>
	        	<th>Thumbnail</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="thumbnail" name="thumbnail" required></td>
	        </tr>
	        <tr>
	        	<th>Attach</th>
	        	<td><input class="w3-input w3-border" type="file" placeholder="attach" name="attach" required></td>
	        </tr>
	        <tr>
	        	<th>MemberNo</th>
	        	<td><c:forEach var="list" items="${myProductList }"><input class="w3-input w3-border" type="text" name="mno" value="${list.memberNo}" style="display: none;"></c:forEach></td>
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

var mainCategoryNameSelect = document.getElementById("mainCategoryName");
var mainCategoryNames = [];
let url1 = 'ctgMain.do';
let url2 = 'ctgSub.do';
let url3 = 'ctgProd.do';
let mainName = document.getElementById('mainCategoryName');
let subName = document.getElementById('subCategoryName');
let prodName = document.getElementById('productName');

fetch(url1)
.then(mresolve=>mresolve.json())
.then(mresult=>{
	mresult.forEach(main=>{
		let opt = document.createElement('option');
		opt.value = main.mainCategoryNo;
		opt.innerText = main.mainCategoryName;
		mainName.append(opt);
	})	
})
.catch(error=>console.log(error));

mainName.addEventListener('change',function(){
	let mainNo = mainName.children[mainName.selectedIndex].value;
	console.log(mainNo);

	fetch(url2+"?mctgNo="+mainNo , {
		method : "GET",
	})
	.then(sresolve=>sresolve.json())
	.then(sresult=>{
		subName.innerHTML="";
		sresult.forEach(sub=>{
			let opt = document.createElement('option');
			opt.value = sub.subCategoryNo;
			opt.innerText = sub.subCategoryName;
			subName.append(opt);
		})
	})
})

subName.addEventListener('change', function(){
	let mainNo = mainName.children[mainName.selectedIndex].value;
    let subNo = subName.children[subName.selectedIndex].value;
    console.log(mainNo);
    console.log(subNo);
    
    fetch(url3+"?mctgNo="+mainNo+"&sctgNo="+subNo , {
    	method : "GET",
    })
    .then(response=>response.json())
    .then(presult=>{
    	prodName.innerHTML="";
    	presult.forEach(prod=>{
    		let opt = document.createElement('option');
    		opt.value = prod.productNo;
    		opt.innerText = prod.productName;
    		prodName.append(opt);
    	})
    })
})

</script>