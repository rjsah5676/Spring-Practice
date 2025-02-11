<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function loadDocument(){
		var xHttp = new XMLHttpRequest();
		
		xHttp.onreadystatechange = function(){
			console.log("readeState",this.readyState);
			console.log("status",this.status);
			console.log("responseText", this.responseText);
			
			if(this.readyState ==4 && this.status==200) {
				document.getElementById("view").innerHTML = this.responseText;
			} else {
				document.getElementById("view").innerHTML = "자료가 없습니다.";
			}
		}
		
		xHttp.open("GET","../resources/data.txt",true);
		
		xHttp.send();
	}
	function loadDocument2(){
		var xHttp = new XMLHttpRequest();
		
		xHttp.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200) {
				var jsonData=JSON.parse(this.responseText);
				console.log(jsonData);
				
				var tag = "<table class='table'>";
				
				tag+="<tr><td>이름</td><td>"+jsonData.username+"</td></tr>";
				tag+="<tr><td>연락처</td><td>"+jsonData.tel1+"</td></tr>";
				tag+="<tr><td>이메일</td><td>"+jsonData.email+"</td></tr>";
				tag+="<tr><td>주소</td><td>"+jsonData.addr +" "+jsonData.addrDetail+"</td></tr></table>";
				
				document.getElementById("view").innerHTML = tag;
				
			}
		}
		xHttp.open("GET","/myapp/ajax/xmlHttpTest?userid=goguma");
		xHttp.send();
	}
	function loadDocument3(){
		var xHttp = new XMLHttpRequest();
		
		xHttp.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200) {
				console.log(this.responseText);
				var jsonData = JSON.parse(this.responseText);
				console.log(jsonData);
				var tag = "<table class='table'>";
				for(var i=0;i<jsonData.length;i++){
					tag+="<tr><td>"+jsonData[i].news_no+"</td>";
					tag+="<td>"+jsonData[i].subject+"</td>";
					tag+="<td>"+jsonData[i].userid+"</td>";
					tag+="<td>"+jsonData[i].hit+"</td>";
					tag+="<td>"+jsonData[i].writedate+"</td></tr>";
				}
				tag+="</table>";
				document.getElementById("view").innerHTML = tag;
			}
		}
		xHttp.open("POST","/myapp/ajax/xmlHttpPost",true);
		xHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xHttp.send("subject=ajaxtext&content=ajaxcontents");
	}
</script>

<div class="container">
	<h1>xmlhttprequest로 비동기 처리</h1>
	<button onclick="loadDocument()">서버에서 txt문서의 내용을 가져온다.</button>
	<button onclick="loadDocument2()">서버에 get</button>
	<button onclick="loadDocument3()">post</button>
	
	<div id="view" style="background-color:beige; padding:10px;"></div>
</div>