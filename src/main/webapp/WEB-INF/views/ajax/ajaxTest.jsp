<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	$(function(){
		$("#ajaxString").click(function(){
			var params="no=3344&name=이순신";
			var params2 = {
					no:5566,
					name:'이순신'
			};
			$.ajax({
				url:'/myapp/ajax/ajaxString',
				data:params,
				success:function(args) {
					$("#view").html(args);
				}, error:function(e){
					alert(e);
				}
			});
		});
		$("#memberForm").on('submit', function(){
			var url = "/myapp/ajax/ajaxObject";
			
			var params = $("#memberForm").serialize();
			console.log(params);
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(results) {
					console.log(results);
					var tag = "<table class='table'>";
					tag +="<tr><td>아이디</td><td>"+ results.userid+"</td></tr>";
					tag +="<tr><td>이름</td><td>"+ results.username+"</td></tr>";
					tag +="<tr><td>연락처</td><td>"+ results.tel+"</td></tr>";
					tag +="<tr><td>등록일</td><td>"+ results.writedate+"</td></tr></table>";
					
					$("#view").append(tag);
				}, error:function(e){
					console.log(e);
				}
			});
			event.preventDefault();
		});
		$("#bbsList").submit(function(){
			event.preventDefault();
			var params = $("#bbsList").serialize();
			console.log(params);
			$.ajax({
				url : "/myapp/ajax/ajaxList",
				data : params,
				type : "GET",
				success:function(results){
					console.log(results);
					
					var tag = "<table class='table table-dark'>";
					//each() : 배열을 반복처리하는 함수
					//					index, 값(vo)
					$(results).each(function(i, obj){
						tag += "<tr><td>"+obj.news_no +"</td>";
						tag += "<td>"+obj.subject +"</td>";
						tag += "<td>"+obj.userid +"</td>";
						tag += "<td>"+obj.hit +"</td>";
						tag += "<td>"+obj.writedate +"</td></tr>";
					});
					tag += "</table>";
					$("#view").append(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			});
			
		});
		$("#ajaxMap").click(function(){
			var param = $("#bbsList").serialize();
			$.ajax({
				url : "/myapp/ajax/ajaxMap",
				data : param,
				type : "GET",
				success : function(results){
					console.log(results);
					var tag = "<div>총레코드수: "+results.totalRecord+"개</div>";
					tag+="<div>현재페이지:"+results.page.nowPage+", 검색어:"+results.page.searchWord+"</div><table class='table table-dark'>";
					$(results.bbsList).each(function(i, obj){
						tag += "<tr><td>"+obj.news_no +"</td>";
						tag += "<td>"+obj.subject +"</td>";
						tag += "<td>"+obj.userid +"</td>";
						tag += "<td>"+obj.hit +"</td>";
						tag += "<td>"+obj.writedate +"</td></tr>";
					});
					tag += "</table>";
					$("#view").append(tag);
				}, error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>

<div class="container">
	<h1>ajax</h1>
	<button id="ajaxString">string</button>
	<hr/>
	<form method="post" id="memberForm">
		아이디: <input type="text" name="userid" id="userid"/><br>
		비번: <input type="password" name="userpwd" id="userpwd"/><br>
		이름: <input type="text" name="username" id="username"/><br>
		연락처: <input type="text" name="tel1" id="tel1"/><br>
		 <input type="text" name="tel2" id="tel2"/><br>
		 <input type="text" name="tel3" id="tel3"/><br>
		 <input type="submit" value="제출"/>
	</form>
	<div>
		<form method="post" id="bbsList">
			<select name="nowPage">
				<script>
					for(var i=1; i<=10; i++){
						document.write("<option>"+i+"</option>");
					}
				</script>
			</select>
			<input type="text" name="searchKey" value="subject"/>
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색"/>
			<input type="button" value="AJAX-Map" id="ajaxMap" />
		</form>
	</div>
	<div id="view" style="background:#ddd;padding:10px;"></div>
</div>