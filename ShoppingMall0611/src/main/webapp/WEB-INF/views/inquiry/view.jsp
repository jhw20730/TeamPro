<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<h2 class="title">VIEW INQUIRY</h2>
				</div>
			</div>
			<!-- /section-title -->
			<div class="container" style="padding: 15px">
				<div class="inquiry" style="padding-left: 15px">
					<h5>${inquiry.inquiryNo }번째문의글</h5>
					<table width="500px" style="border: 1px">
						<tr>
							<td><b>아이디</b></td>
							<td>${inquiry.id }</td>
						</tr>
						<tr>
							<td><b>이름</b></td>
							<td>${inquiry.name }</td>
						</tr>
						<tr>
							<td><b>작성일</b></td>
							<td>${inquiry.inquiryDate }</td>
						</tr>
						<tr>
							<td><b>제목</b></td>
							<td>${inquiry.title }</td>
						</tr>
						<tr>
							<td><b>내용</b></td>
							<td><textarea cols="30">${inquiry.content } </textarea></td>
						</tr>
					</table>
				</div>
				<button onclick="location.href='/inquiry/list'">Back to	list</button>
				<button onclick="location.href='/inquiry/delete'">Delete</button>
				<button onclick="location.href='/admin/inquiry/registerForm?inquiryNo=${inquiry.inquiryNo }'">답변</button>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->

<%@include file="../includes/footer.jsp"%>