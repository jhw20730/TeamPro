<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section-title -->
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">USER JOIN</h2>
				</div>
			</div>
			<!-- /section-title -->

			<form role="form" action="/join" method="post" style="margin:80px 0px 0px 25px;">
					<div class="form-group">
						<label>아이디</label>
						<input class="form-control" name="id">
					</div>
					
					<div class="form-group">
						<label>패스워드</label>
						<input class="form-control" type="password" name="password">
					</div>
					
					<div class="form-group">
						<label>이름</label>
						<input class="form-control" name="name">
					</div>
					
					<div class="form-group">
						<label>주소</label>
						<input class="form-control" name="address">
					</div>
					
					<div class="form-group">
						<label>연락처</label>
						<input class="form-control" name="contact">
					</div>
					
					<div class="form-group">
						<label>이메일</label>
						<input class="form-control" name="email">
					</div>

					<button type="submit" class="btn btn-default">회원가입</button>
					<button type="reset" class="btn btn-default">RESET</button>
					<button type="button" class="btn btn-default" onclick="location.href=/product/list">취소</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->


</div>
<!-- /section -->

<%@include file="includes/footer.jsp"%>