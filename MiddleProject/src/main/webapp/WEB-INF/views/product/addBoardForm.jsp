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
        <h4>게시글 등록</h4>
        <!-- 
             <select id="mainCategoryName">
                 <option value="">대분류</option>
             </select>
             <select id="subCategoryName">
                 <option value="">소분류</option>
             </select>
             <select id="productName" name="pno">
                 <option value="">상품 이름</option>
             </select>
 -->
		<br>
  
      </div>
		<div id="productList"></div>
      <div>
    	  
	    </div>
    </div>
<div id="top">
    <!-- <button type="button" id="add-row-btn" class="renew-row-btn">항목추가</button> -->
    <div id="productSelector"></div>
    <table id="myTable" style="margin-left:auto;margin-right:auto;">
  <thead>
    <tr>
      <th>제목</th>
      <th>내용</th>
      <th>Thumbnail</th>
      <th>Attach</th>
      <!-- <td>제거</td> -->
      <th>MemberNo</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input class="w3-input w3-border" type="text" placeholder="제목" name="title" required></td>
      <td><input class="w3-input w3-border" type="text" placeholder="내용" name="content" required></td>
      <td><input class="w3-input w3-border" type="file" placeholder="thumbnail" name="thumbnail" required></td>
      <td><input class="w3-input w3-border" type="file" placeholder="attach" name="attach" required></td>
      <!-- <td><button type="button" class="remove-row-btn">항목제거</button></td> -->
      <td><input class="w3-input w3-border" type="text" name="mno" value="${list.memberNo}" style="display: none;"></td>
    </tr>
  </tbody>
</table>
</div>
<div>
	<button type="submit" class="button button1">등록</button>
	<button type="reset" class="button button2">취소</button>
</div>

    
</form>

</div>


<script>

createProductSelector();
function createProductSelector() {
	let Adiv = document.createElement('div');
	Adiv.className="selector";
	  let productSelector = document.getElementById("productSelector");

	  let mainCategoryNameSelect = document.createElement("select");
	  mainCategoryNameSelect.className = "mainCategoryName";

	  let mainCategoryDefaultOption = document.createElement("option");
	  mainCategoryDefaultOption.value = "";
	  mainCategoryDefaultOption.innerText = "대분류";
	  mainCategoryNameSelect.appendChild(mainCategoryDefaultOption);

	  let subCategoryNameSelect = document.createElement("select");
	  subCategoryNameSelect.className = "subCategoryName";

	  let subCategoryDefaultOption = document.createElement("option");
	  subCategoryDefaultOption.value = "";
	  subCategoryDefaultOption.innerText = "소분류";
	  subCategoryNameSelect.appendChild(subCategoryDefaultOption);

	  let productNameSelect = document.createElement("select");
	  productNameSelect.className = "productName";
	  productNameSelect.name = "pno";

	  let productNameDefaultOption = document.createElement("option");
	  productNameDefaultOption.value = "";
	  productNameDefaultOption.innerText = "상품 이름";
	  productNameSelect.appendChild(productNameDefaultOption);

	  Adiv.appendChild(mainCategoryNameSelect);
	  Adiv.appendChild(subCategoryNameSelect);
	  Adiv.appendChild(productNameSelect); 
	  Adiv.appendChild(document.createElement("br"));
	  
	  productSelector.appendChild(Adiv); 

	  let url1 = 'ctgMain.do';
	  let url2 = 'ctgSub.do';
	  let url3 = 'ctgProd.do';
	  let mainName = document.querySelector('.mainCategoryName');
	  let subName = document.querySelector('.subCategoryName');
	  let prodName = document.querySelector('.productName');

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
	  
	  mainCategoryNameSelect.addEventListener('change',function(){
	    subCategoryNameSelect.innerHTML = "";
	    let mainNo = mainCategoryNameSelect.value;
	    if (mainNo) {
	      fetch(url2+"?mctgNo="+mainNo , {
	        method : "GET",
	      })
	      .then(sresolve=>sresolve.json())
	      .then(sresult=>{
	        subCategoryNameSelect.innerHTML="";
	        let subCategoryDefaultOption = document.createElement("option");
	        subCategoryDefaultOption.value = "";
	        subCategoryDefaultOption.innerText = "소분류";
	        subCategoryNameSelect.appendChild(subCategoryDefaultOption);
	        sresult.forEach(sub=>{
	          let opt = document.createElement('option');
	          opt.value = sub.subCategoryNo;
	          opt.innerText = sub.subCategoryName;
	          subCategoryNameSelect.append(opt);
	        })
	      })
	    }
	  })

	  subCategoryNameSelect.addEventListener('change', function(){
	    productNameSelect.innerHTML = "";
	    let mainNo = mainCategoryNameSelect.value;
	    let subNo = subCategoryNameSelect.value;
	    if (subNo) {
	      fetch(url3+"?mctgNo="+mainNo+"&sctgNo="+subNo , {
	        method : "GET",
	      })
	      .then(response=>response.json())
	      .then(presult=>{
	        productNameSelect.innerHTML="";
	        let productNameDefaultOption = document.createElement("option");
	        productNameDefaultOption.value = "";
	        productNameDefaultOption.innerText = "상품 이름";
	        productNameSelect.appendChild(productNameDefaultOption);
	        presult.forEach(prod=>{
	          let opt = document.createElement('option');
	          opt.value = prod.productNo;
	          opt.innerText = prod.productName;
	          productNameSelect.append(opt);
	        })
	      })
	    }
	  })
	}



// Add row button 클릭 시, 새로운 행을 추가
 const addRowBtn = document.getElementById("add-row-btn");
  addRowBtn.addEventListener("click", function() {
    createProductSelector();
    const tbody = document.querySelector("#myTable tbody");

    const newRow = document.createElement("tr");
    newRow.innerHTML = `
      <td><input class="w3-input w3-border" type="text" placeholder="제목" name="title" required></td>
      <td><input class="w3-input w3-border" type="text" placeholder="내용" name="content" required></td>
      <td><input class="w3-input w3-border" type="file" placeholder="thumbnail" name="thumbnail" required></td>
      <td><input class="w3-input w3-border" type="file" placeholder="attach" name="attach" required></td>
      //<td><button type="button" class="remove-row-btn">항목제거</button></td>
      <td><input class="w3-input w3-border" type="text" name="mno" value="${list.memberNo}" style="display: none;"></td>
    `;

    tbody.appendChild(newRow);
  });

  /*
  const table = document.getElementById("myTable");
  table.addEventListener("click", function(e) {
	  if (e.target.className === "remove-row-btn") {
	    const row = e.target.parentNode.parentNode;
	    const div = row.querySelector("div");
	    if (div) {
	      div.parentNode.removeChild(div);
	    }
	    row.parentNode.removeChild(row);
	  }
	});*/
</script>
