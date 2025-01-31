<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.total {
		overflow:auto;
		padding: 10px 0px;
	}
	.total>div:first-child {
		float:left;
	}
	.total>div:last-child {
		float:right;
	}
	.list>li {
		float:left;
		line-height:50px;
		border-bottom: 1px solid gray;
		width:10%;
		text-align:center;
	}
	.list {
		overflow:auto;
		padding: 30px 0px;
	}
	.list>li:nth-child(5n+2) {
		width:60%;
		text-align:left;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.search{
		text-align:center;
		padding:30px;
	}
</style>

<div class="container">
	<h1>뉴스목록</h1>
	
	<c:if test="${logStatus =='Y'}">
		<div><a href="${pageContext.request.contextPath}/bbs/write">글등록</a></div>
	</c:if>
	
	<div class="total">
		<div>총 레코드 수: ${pVO.totalRecord}개</div>
		<div>전체페이지: ${pVO.nowPage}/${pVO.totalPage}</div>
	</div>
	<ul class="list">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>조회수</li>
		<li>등록일자</li>
		<c:forEach var="vo" items="${list}">
            <li>${vo.news_no}</li>
            <li>${vo.subject}</li>
            <li>${vo.userid}</li>
            <li>${vo.hit}</li>
            <li>${vo.writedate}</li>
        </c:forEach>
	</ul>
	
	  <ul class="pagination pagination">
	  	<li><a href="#">Prev</a></li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li><a href="#">Next</a></li>
	  </ul>
	
	<div class="search">
		<form>
			<select name="searchKey">
				<option>제목</option>
				<option>작성자</option>
				<option>글내용></option>
			</select>
			<input type="text" id="searchWord" name="searchWord"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>