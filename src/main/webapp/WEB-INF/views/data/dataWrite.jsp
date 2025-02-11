<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/ckeditor/ckeditor.css"/>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<style>
	.btn {
		padding:30px;
		width:100%;
	}
</style>
<div class="container">
<script>
    window.onload = function() {
        CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
    }
    function bbsFormCheck(){
        if(document.getElementById("subject").value==""){
        alert("글제목을 입력하세요.");
        return false;
    	}
        if(document.getElementById("filename").value="") {
        	alert("파일을 넣어주세요");
        	return false;
        }
        
    	return true;
    }
</script>
    <h1>자료 올리기 폼</h1>

     <form method="post" action="<%= request.getContextPath()%>/data/dataWriteOk" 
    	onsubmit="return bbsFormCheck()" enctype="multipart/form-data">
        <div>제목</div>
        <div><input type="text" name="subject" id="subject"></div>
        <div>글내용</div>
        <div><textarea name="content" id="content"></textarea></div>
        <div>첨부파일</div>
        <div><input type="file" name="mf" id="fie"></div>
        <div class="btn">
            <input type="submit" value="업로드하기">
        </div>
    	</form>
</div>