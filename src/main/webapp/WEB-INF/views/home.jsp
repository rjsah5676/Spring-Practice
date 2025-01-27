<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<P> 스프링 홈페이지 ${test} </P>
<img src="img/contact_img.png"/>
<div>
	<a href="/myapp/test1?num=1234&name=홍길동">접속하기</a>
	<a href="/myapp/test2?num=55&name=이순신">접속하기2</a>
	<a href="/myapp/test3?num=111&name=안중근&tel=010-1234-5678">접속하기3</a>
</div>
<div>
	un: ${username}<br>
	hi: ${hi}
</div>
</body>
</html>
