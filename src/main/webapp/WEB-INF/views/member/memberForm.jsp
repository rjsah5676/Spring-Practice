<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .container {
            margin:auto;
            width:600px;
            text-align: center;
        }
        .first-form {
            display: flex;
            flex-direction: column;
        }
        .form-col {
            display: flex;
            flex-direction: row;
            height:30px;
            border-bottom: 1px solid #aaaaaa;
            margin-top:10px;
        }
        .form-col > input {
            height:15px;
        }
        .form-col > button {
            height:25px;
            margin-left:10px;
        }
        .form-col > div {
            width:120px;
            text-align: left;
        }
        #col-addr {
            width:400px;
        }
        select {
            height:20px;
        }
        .call-detail {
            width:80px;
        }
        .form-submit {
            border-bottom: 1px solid #aaaaaa;
            padding: 8px;
        }
    </style>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
  		// 사용법 참고 - https://postcode.map.daum.net/guide
    	//우편번호찾기
    	function daumPostCodeSearch(){
    		new daum.Postcode({  //★★★다음 오픈소스에서 가져온 코드★★★
                oncomplete: function(data) {
                	console.log(data);
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        //document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        //document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("zipcode").value = data.zonecode;
                    document.getElementById("addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addrDetail").focus();
                }
            }).open();
  		} 	
    </script>
</head>
<body>
    <div class="container">
        <h1>회원가입 폼</h1>
        <form class="first-form" method="post" action="formOk" id="frm">
            <div class="form-col">
                <div>아이디</div><input type="text" name="userid"></input>
                <button>아이디중복검사</button>
            </div>
            <div class="form-col">
                <div>비밀번호</div><input type="password" name="userpwd"></input>
            </div>
            <div class="form-col">
                <div>비밀번호확인</div><input type="password" name="userpwchk"></input>
            </div>
            <div class="form-col">
                <div>이름</div><input type="text" name="username"></input>
            </div>
            <div class="form-col">
                <div>연락처</div>
                <select name="tel1">
                    <option value="010">010</option>
                    <option value="02">02</option>
                    <option value="070">070</option>
                </select>
                - 
                <input class="call-detail" type="text" name="tel2"></input>
                - 
                <input class="call-detail" type="text" name="tel3"></input>
            </div>
            <div class="form-col">
                <div>이메일</div><input type="text" name="email"></input>
            </div>
            <div class="form-col">
                <div>우편번호</div><input type="text" id="zipcode" name="zipcode"></input>
                <input type="button" style="height:25px;" value="우편번호찾기" onclick="daumPostCodeSearch()"/>
            </div>
            <div class="form-col">
                <div>주소</div><input id="addr" type="text" name="addr"></input>
            </div>
            <div class="form-col">
                <div>상세주소</div><input id="addrDetail" type="text" name="addrDetail"></input>
            </div>
            <div class="form-col">
                <div>취미</div>
                <input type="checkbox" name="hobby" value="야구">야구
                <input type="checkbox" name="hobby" value="바이크">바이크
                <input type="checkbox" name="hobby" value="등산">등산
                <input type="checkbox" name="hobby" value="쇼핑">쇼핑
                <input type="checkbox" name="hobby" value="자전거">자전거
                <input type="checkbox" name="hobby" value="걷기">걷기
                <input type="checkbox" name="hobby" value="영화감상">영화감상
            </div>
            <div class="form-submit">
                <input type="submit" value="회원가입하기"/>
            </div>
        </form>
    </div>
</body>
</html>