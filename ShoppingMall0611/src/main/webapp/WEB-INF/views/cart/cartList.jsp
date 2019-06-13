<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>


<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Shopping Cart</li>
			</ol>
		</div>
		<div class="table-responsive cart_info">
			<!-- 			체크박스 모두 활성화 -->
			<div class="allCheck">
				<input type="checkbox" name="allCheck" id="allCheck" /><label
					for="allCheck">모두 선택</label>
				<script>
					$("#allCheck").click(function() {
						var chk = $("#allCheck").prop("checked");
						if (chk) {
							$(".chBox").prop("checked", true);
						} else {
							$(".chBox").prop("checked", false);
						}
					});
				</script>
			</div>

			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">상품</td>
						<td>이름</td>
						<td>코드</td>
						<td>설명</td>
						<td class="price">가격</td>
						<td class="quantity">재고</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cart }" var="cart">
						
						<tr>

							<td class="cart_product"><a href=""><img
									src="images/cart/one.png" alt=""></a></td>
							<td>
							<div class="checkBox">
								<input type="checkbox" name="chBox" class="chBox"
									data-cartNum="${cart.cartNo}" />
							</div>
								<p>${cart.productName }</p>
								
							</td>
							<td>
								<p>${cart.productCode }</p>
							</td>
							<td>
								<p>${cart.description }</p>
							</td>
							<td class="cart_price">
								<p>${cart.price }</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">

									<input class="cart_quantity_input" type="text" name="quantity"
										value="${cart.amount }" autocomplete="off" size="1"
										readonly="readonly">

								</div>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 			delete 버튼 -->
			<div class="delBtn">
				<button type="button" class="selectDelete_btn">선택 삭제</button>
				<script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();

							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-cartNum"));
							});

							$.ajax({
								url : "/cart/deleteCart",
								type : "post",
								data : {
									chbox : checkArr
								},
								success : function() {
									alert("삭제 성공");
										location.href = "/cart/cartList";
								},
								error : function(){
									alert("삭제 실패");
								}
							});
						}
					});
				</script>
			</div>
		</div>
	</div>
</section>
<!--/#cart_items-->



<%@include file="../includes/footer.jsp"%>