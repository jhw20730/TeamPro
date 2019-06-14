<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<style>
table {
	border: 1px solid black;
	width: 60%;
	margin: 0 auto;
}

tr {
	text-align: center;
}

td {
	border: 1px solid black;
	margin: 10px;
	padding-top: 10px;
}
#btns {
	display: block;
	width: 212px;
	margin: 0 auto;
	margin-top: 15px;
	font-size: 110%;
}
</style>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">공지사항</h2>
				</div>
			</div>

			<table>
				<tr>
					<td>${no.noticeNo }</td>
					<td>${no.id }</td>
				</tr>
				<tr>
					<td colspan='2'>${no.title }</td>
				</tr>
				<tr>
					<td colspan='2'>${no.content }</td>
				</tr>
				<tr>
					<td colspan='2'>${format.format(no.noticeDate) }</td>
				</tr>
			</table>
			<div id="btns">
				<button
					onclick="location.href='/notice/updateForm?noticeNo=${no.noticeNo}'">
					<b>update</b>
				</button>
				<button
					onclick="location.href='/notice/delete?noticeNo=${no.noticeNo}'">
					<b>delete</b>
				</button>
				<button
					onclick="location.href='/notice/list'">
					<b>목록으로</b>
				</button>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>