<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<h1>자료실 글 내용</h1>
	<ul class="list">
		<li>${vo.no }</li>
		<li>${vo.userid },${vo.hit },${vo.writedate }</li>
		<li>${vo.subject }</li>
		<li>${vo.content }</li>
		<li>첨부파일<br>
			<a href="${pageContext.request.contextPath }/uploadfile/${vo.filename}" download>
				<img src="${pageContext.request.contextPath }/uploadfile/${vo.filename}">
			</a>
		</li>
	</ul>
	<c:if test="${logid==vo.userid }">
		<a href="${pageContext.request.contextPath }/data/dataEdit?no=${vo.no}">수정</a> 삭제
	</c:if>
</div>