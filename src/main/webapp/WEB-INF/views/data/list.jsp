<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.list>li {
		float:left;
		line-height:50px;
		border-bottom: 1px solid gray;
		width:13.3%;
		text-align:center;
	}
	.list {
		overflow:auto;
		padding: 30px 0px;
	}
	.list>li:nth-child(4n+2) {
		width:60%;
		text-align:left;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
<div class="container">
	<h1>자료실 목록</h1>
	<c:if test="${logStatus =='Y'}">
		<div><a href="${pageContext.request.contextPath}/data/dataWrite">글등록</a></div>
	</c:if>
	<ul class="list">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>첨부파일</li>
		<c:forEach var="vo" items="${list}">
			<li>${vo.no }</li>
			<li><a href="${pageContext.request.contextPath }/data/dataView?no=${vo.no}">${vo.subject }</a></li>
			<li>${vo.userid }</li>
			<li>
				<a href="${pageContext.request.contextPath }/uploadfile/${vo.filename}" download>
					<img src="/myapp/uploadfile/${vo.filename }" width="60" height="60"/>
				</a>
				<button style="height:30px; line-height:30px; padding:0;">수정</button>
				<button style="height:30px; line-height:30px; padding:0;">삭제</button>
			</li>
		</c:forEach>
	</ul>
</div>