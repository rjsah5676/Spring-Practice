<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function fetchGet(){
		console.log("!");
		fetch("/myapp/fetch/getTest?userid=gggg&username=홍길동",{method:'GET'})
		.then(response=>{
			return response.json();
		}).then(data=>{
			console.log(data);
			document.getElementById("fetchView").innerHTML=data.userid+","+data.username+","+data.email;
		}).catch(err =>{
			console.log(err);
		});
	}
	function fetchPost(){
		
		fetch("/myapp/fetch/fetchPostBbsList",{
			method:"POST",
			headers:{
				"Content-Type":"application/x-www-form-urlencoded"
			},
			body:"nowPage=5"
		}).then(response => {
			return response.json();
		}).then(data => {
			console.log(data);
			for(var i=0;i<data.length;i++)
				document.getElementById("fetchView").innerHTML+= data[i].news_no+","+data[i].subject+","+data[i].userid+"<br>";
		}).catch(err => {
			console.log(err);
		});
	}
</script>

<div class="container">
	<h1>fetch</h1>
	<button onclick="fetchGet()">get</button>
	<button onclick="fetchPost()">post</button>
	<div id="fetchView" style="background-color:pink;padding:10px;"></div>
</div>