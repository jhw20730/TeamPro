<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../includes/header.jsp"%>
    
    <form action="/inquiry/list" method="post">
    	<input type="number" value="${inquiryNo }" name="inquiryNo" id="inquiryNo">	번째 질문의 답
		<table width="500">
			<tr>			
				<td>답변 제목</td>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			<tr>
				<td>답변 내용</td>
				<td><textarea id="content" name="content"></textarea></td>
			</tr>
			</table>
		<button cols id="submit" type="submit">작성</button>
	</form>
		<script>
		//댓글 달기		
		$("#submit").on("click", function(e){
			e.preventDefault();
			
			var title = $("#title").val();
			var content = $("#content").val();
			var inquiryNo = $("#inquiryNo").val();
			
			var replyVO = {
					title : title,
					content : content,
					inquiryNo : inquiryNo
			};
			
			$.ajax({
				url : "/admin/inquiry/register",
				type : "post",
				data : replyVO,
				success : function(){
					alert("답변 달기 성공");
					window.location.href ='/inquiry/list';
				},
				error : function(){
					alert("답변 달기 실패");
				}
			});
		});
		
		</script>

<%@include file="../../includes/footer.jsp"%>