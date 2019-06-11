<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>
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
			<div style="padding: 15px">
				<table width="500" style="border: 1px; padding:5px;">
					<tr>
						<td><b>작성일</b></td>
						<td>${reply.replyDate }</td>
					</tr>
					<tr>
						<td><b>제목</b></td>
						<td>${reply.title }</td>
					</tr>
					<tr>
						<td><b>내용</b></td>
						<td><textarea cols="30">${reply.content } </textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->


<%@include file="../../includes/footer.jsp"%>