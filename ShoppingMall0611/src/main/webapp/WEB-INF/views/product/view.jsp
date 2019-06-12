<%@page import="come.team.domain.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!--  Product Details -->
			<div class="product product-details clearfix">
				<div class="col-md-6">
					<div id="product-main-view">
						<div class="product-view">
							<img src="../../../resources/img/main.jpg" alt="">
						</div>
					</div>
					<div id="product-view"></div>
				</div>
				<div class="col-md-6">
					<div class="product-body">
						<div class="product-label">
							<span>${board.productCode }</span>
						</div>
						<h2 class="product-name">${board.productName }</h2>
						<h3 class="product-price">${board.price }</h3>
						<div>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
							<a href="#">3 Review(s) / Add Review</a>
						</div>
						<p>
							<strong>제조사: </strong>${board.manufacturer }</p>
						<p>
							<strong>사용용도: </strong>${board.usability }</p>
						<div class="product-options">
							<ul class="size-option">
								<li><span class="text-uppercase">운영체제:</span></li>
								<li class="active"><a href="#">${board.os }</a></li>


							</ul>
						</div>

						<div class="product-btns">
							<p>
								<strong>재고</strong>${board.stock }</p>
								개수 : <input type="number" name="amount" id="amount" size="1"><br><br>
							<button type="button" class="primary-btn add-to-cart" id="addCart">
								<i class="fa fa-shopping-cart"></i> 장바구니 담기
							</button>
							
							<script>
								$("#addCart").on("click", function(e) {
									e.preventDefault();
									var productCode = "<c:out value='${board.productCode}'/>";
									var amount = $("#amount").val();
									
									var cart = {
										amount : amount,	
										productCode : productCode
										/* id : id */
									};

									$.ajax({
										url : "/cart/add",
										type : "post",
										data : cart,	
										success : function() {
											alert("카트 담기 성공");
											window.location.href = '/cart/list';
										},
										error : function() {
											alert("카트 담기 실패");
										}
									});
								});
							
								
							</script>
							<div class="pull-right">
								<button class="main-btn icon-btn">
									<i class="fa fa-heart"></i>
								</button>
								<button class="main-btn icon-btn">
									<i class="fa fa-exchange"></i>
								</button>
								<button class="main-btn icon-btn">
									<i class="fa fa-share-alt"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="product-tab">
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">사양</a></li>
							<li><a data-toggle="tab" href="#tab1">Details</a></li>
							<li><a data-toggle="tab" href="#tab2">Reviews</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab1" class="tab-pane fade in active">
								<p>${board.description }</p>
							</div>
							<div id="tab2" class="tab-pane fade in">

								<div class="row">
									<div class="col-md-6">
										<div class="product-reviews">
											<div class="reviewList"> <!-- single review : review content -->
											
											</div> <!-- end single review -->

											<div class="panel-footer"> <!-- pagination of review -->
											
											</div>
											
										</div>
									</div>
									<div class="col-md-6">
										<h4 class="text-uppercase">Write Your Review</h4>
										<p> 고객만 리뷰를 작성할 수 있습니다. </p>
										<form class="review-form" action="/reviews/register" method="post">
											<div class="form-group">
												<input class="input" type="text" name="productCode" name="productCode" value="${board.productCode }" readonly="readonly" />
											</div>											
											<div class="form-group">
												<textarea class="input" placeholder="Write your review" name="content"></textarea>
											</div>
											<div class="form-group">
												<div class="input-rating">
													<strong class="text-uppercase">Your Rating: </strong>
													<div class="stars">
														<input type="radio" id="star5" name="reviewPoint" value="5" /><label	for="star5"></label> 
														<input type="radio" id="star4" name="reviewPoint" value="4" /><label for="star4"></label>
														<input type="radio" id="star3" name="reviewPoint" value="3" /><label for="star3"></label> 
														<input type="radio" id="star2" name="reviewPoint" value="2" /><label for="star2"></label> 
														<input type="radio" id="star1" name="reviewPoint" value="1" /><label for="star1"></label>
													</div>
												</div>
											</div>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<sec:authorize access="isAuthenticated()">
												<button id="submitReview" class="primary-btn">Submit</button>
											</sec:authorize>
											
											<sec:authorize access="isAnonymous()">
												<button onclick="location.href='/customLogin'" class="primary-btn">Submit</button>
											</sec:authorize>
											
										</form>
										
										<script>
											$("#submitReview").on("click", function(){
												$.ajax({
													url : "/reviews/register",
													type : "post",
													data : (".review-form").serialize(),
													success : function(){
														alert("리뷰를 작성하셨습니다.");
													},
													error : function(){
														alert("error");
													}
												});
											});
										</script>
									
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /Product Details -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->

<script type="text/javascript" src="../../../resources/js/review.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						
						//review
						var productCode = "<c:out value='${board.productCode}'/>";
						var replyUL = $(".reviewList");

						console.log("showList(1)");
						showList(1);
						
						function showList(page){
							reviewService.getList({productCode:productCode, page:page}, function(reviewCnt, list){
								
								console.log("reviewCnt: " + reviewCnt);
								console.log("list: " + list);
								
								if(page == -1){
									pageNum = Math.ceil(reviewCnt/10.0);
									showList(pageNum);
									return;
								}
								
								var str = "";
								if(list == null || list.length == 0){
									replyUL.html("");
									return;
								}
								for(var i = 0, len = list.length || 0; i < len; i++){
									
									str += "<div class='single-review'>";
									str += "<div class='review-heading'>";
									str += "<div><b> No. " + list[i].reviewNo + "</b></div>";
									str += "<div><i class='fa fa-user-o'></i>" + list[i].id + "</a></div>";
									str += "<div><i class='fa fa-clock-o'></i>" + reviewService.displayTime(list[i].reviewDate) + "</a></div>";
									str += "</div>";
									
									str += "<div class='review-rating pull-right'>";
										for(var j = 0; j < list[i].reviewPoint; j++){
											str += "<i class='fa fa-star'></i>";
										}
										for(var k = list[i].reviewPoint; k < 5; k++){
											str += "<i class='fa fa-star-o empty'></i>";
										}
									str += "</div>";
									
									str += '<div class="review-body">';
									str += '<p>' + list[i].content + '</p>';
									str += "</div>";
									str += "</div>";
								}
								replyUL.html(str);
								showReviewPage(reviewCnt);
								
								}); //end function
						}//end showList()
						
						var pageNum = 1;
						var reviewPageFooter = $(".panel-footer");
						
						function showReviewPage(reviewCnt){
							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;
							
							var prev = startNum != 1;
							var next = false;
							
							if(endNum * 10 >= reviewCnt){
								endNum = Math.ceil(reviewCnt/10.0);
							}
							if(endNum * 10 < reviewCnt){
								next = true;
							}
							
							var str = "<ul class='pagination pull-right'>";
							
							if(prev){
								str += "<li class='page-item'><a class='page-link' href='" + (startNum-1) + "'>Previous</a></li>'";
							}
							
							for (var i = startNum ; i <=endNum; i++){
								var active = pageNum == i ? "active" : "";
								str += "<li class=page-item " + active + "><a class='page-link' href='" + i + "'> " + i + "</a></li>";
							}
							
							if(next){
								str += "<li class='page-item'> <a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
							}
							str += "</ul>";
							console.log(str);
							reviewPageFooter.html(str);
						} //end showReviewPage
						
						reviewPageFooter.on("click", "li a", function(e){
							e.preventDefault();
							var targetPageNum = $(this).attr("href");
							console.log("targetPageNum : " + targetPageNum);
							pageNum = targetPageNum;
							showList(pageNum);
						});
						
						
						//actionForm
						var actionForm = $("#actionForm");
						//pageinate_button이라는 클래스에 존재하는 a 태그를 클랙했을 때
						$(".paginate_button a").on(
								"click",
								function(e) {
									//현재 이벤트의 기본 이벤트를 중단한다.
									e.preventDefault();
									console.log('click');
									//actionForm의 하위 요소를 찾아서 href라는 속성의 값을 대입한다.
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						//상세히 보기
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											//선택한 요소 끝에 내용을 추가한다.
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();
										});

					});
</script>

<%@include file="../includes/footer.jsp"%>