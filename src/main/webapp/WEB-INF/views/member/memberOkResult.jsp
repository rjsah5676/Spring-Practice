<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<c:if test="${result == 1}">
	<script type='text/javascript'>
		alert("가입성공");
		location.href="${pageContext.request.contextPath}/member/login";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type='text/javascript'>
		alert("가입실패");
		location.href="${pageContext.request.contextPath}/member/form";
	</script>
</c:if>