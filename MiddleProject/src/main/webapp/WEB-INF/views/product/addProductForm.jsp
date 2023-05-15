<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 #container{
  text-align: center;
  justify-content: center;
	margin: 20px;
 }

 #container th{
	padding: 13px;
	padding-right: 60px;
	font-size: large;
 }
 .w3-input w3-border{
	width: 280px;
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

	<form action="addProduct.do" method="post" name="addform">
		<!-- Add Product -->
			<div class="w3-row-padding">
				<div class="w3-col s4">
					<h4 style="font-weight: bold;">상 품 등 록</h4>
				<table style="margin-left:auto;margin-right:auto;">
						<tr>
						<th>상품 이름</th>
						<td><input class="w3-input w3-border" type="text" placeholder="제품이름" name="pname" required></td>
						</tr>
						<tr>
						<th>가격</th>
						<td><input class="w3-input w3-border" type="text" placeholder="가격" name="price" required></td>
						</tr>
						<tr>
						<th>수량</th>
						<td><input class="w3-input w3-border" type="text" placeholder="수량" name="pcount" required></td>
						</tr>
						<tr>
						<th>분 류</th>
						<td><input type="radio" id="bed" checked name="subNo" value="1">
				  <label for="bed">침대</label>
				  <input type="radio" id="sofa" name="subNo" value="2">
				  <label for="sofa">소파</label>
				  <input type="radio" id="chair" name="subNo" value="3">
				  <label for="chair">의자</label>
				  <input type="radio" id="chair" name="subNo" value="4">
				  <label for="desk">책상</label><br>
				  <input type="radio" id="chair" name="subNo" value="5">
				  <label for="closet">옷장</label>
				  <input type="radio" id="chair" name="subNo" value="6">
				  <label for="storage">수납장</label>
				  <input type="radio" id="chair" name="subNo" value="7">
				  <label for="dressing">화장대</label>
				  <input type="radio" id="chair" name="subNo" value="8">
				  <label for="table">식탁</label><br>
				  <input type="radio" id="chair" name="subNo" value="9">
				  <label for="light">조명</label>
				  <input type="radio" id="chair" name="subNo" value="10">
				  <label for="curtain">커튼</label>
				  <input type="radio" id="chair" name="subNo" value="11">
				  <label for="clock">시계</label>
				  <input type="radio" id="chair" name="subNo" value="12">
				  <label for="etc">소품</label>
				</td>
						</tr>
						<tr>
						<th>Theme</th>
						<td>
				  <input type="radio" id="chair" checked name="tno" value="1">
				  <label for="modern">modern</label>
				  <input type="radio" id="chair" name="tno" value="2">
				  <label for="natural">natural</label>
				  <input type="radio" id="chair" name="tno" value="3">
				  <label for="noreurope">noreurope</label><br>
				  <input type="radio" id="chair" name="tno" value="4">
				  <label for="classic">classic</label>
				  <input type="radio" id="chair" name="tno" value="5">
				  <label for="romantic">romantic</label>
				  <input type="radio" id="chair" name="tno" value="6">
				  <label for="vintage">vintage</label>
				</td>
				</tr>
						<tr style="display: none;"><td>${id}</td></tr>
						<tr style="display: none;"><td><input name="companyNo" value="${companyNo}"></td></tr>
						<tr>
							<td colspan="2">
								<button type="submit" class="button button1" style="padding-top: 10px;">등록</button>
								<button type="reset" class="button button2" style="padding-top: 10px;">취소</button>
							</td>
						</tr>
				</table>
				</div>
			</div>
	</form>
</div>

<script>

document.addform.addEventListener('submit', function(e) {
	//e.preventDefault();
	let subNo = document.querySelector('input[name="subNo"]').value;
	let tNo = document.querySelector('input[name="tno"]').value;
	let id='${id}';
	let cno='${companyNo}';
	console.log(subNo, tNo);
	if(!subNo || !tNo || !id || !cno){
		alert('값을 입력하세요');
		return false;
	}
	
})

</script>