<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    
<%@include file="../includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">
						관리자 화면
					</h2>
				</div>
			</div>

			<h2><sec:authentication property="principal.user.name"/>님입니다.</h2>
			<h2>상품정보</h2>
			<a href="/admin/list">상품 정보 확인</a><br>
			<h2>회원정보</h2>
			<a href="/admin/list">회원 정보 확인</a><br>
			<h2>결제정보</h2>
			<a href="/admin/list">결제 정보 확인</a><br>
			
		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->
<%@include file="../includes/footer.jsp"%>