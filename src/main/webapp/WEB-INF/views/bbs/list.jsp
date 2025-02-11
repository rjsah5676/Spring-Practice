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
<script>
	function searchForm() {
		if(document.getElementById("searchWord").value==""){
			alert("입력해주세요");
			return false;
		}
	}
</script>
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
            <li><a href="${pageContext.request.contextPath}/bbs/view?news_no=${vo.news_no}">${vo.subject}</a></li>
            <li>${vo.userid}</li>
            <li>${vo.hit}</li>
            <li>${vo.writedate}</li>
        </c:forEach>
	</ul>
	
	  <ul class="pagination pagination">
	  	<c:if test="${pVO.nowPage==1 }">
	  		<li><a href="#">Prev</a></li>
	  	</c:if>
	  	<c:if test="${pVO.nowPage>1}">
	  		<li><a href="${pageContext.request.contextPath}/bbs/list?nowPage=${pVO.nowPage-1}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">Prev</a></li>
	  	</c:if>
	  	<c:forEach var="p" begin="${pVO.startPageNum }" end="${pVO.startPageNum+pVO.onePageCount-1}">
	  		<c:if test="${p<=pVO.totalPage }">
	  		<li><a href="${pageContext.request.contextPath}/bbs/list?nowPage=${p}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">${p}</a></li>
	  		</c:if>
	  	</c:forEach>
	  	<c:if test="${pVO.nowPage>=pVO.totalPage }">
	    	<li><a href="#">Next</a></li>
	    </c:if>
	  	<c:if test="${pVO.nowPage<pVO.totalPage }">
	    	<li><a href="${pageContext.request.contextPath}/bbs/list?nowPage=${pVO.nowPage+1}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">Next</a></li>
	    </c:if>
	  </ul>
	
	<div class="search">
		<form action="${pageContext.request.contextPath }/bbs/list" onSubmit="return searchForm()">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option>작성자</option>
				<option>글내용></option>
			</select>
			<input type="text" id="searchWord" name="searchWord"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
</div>