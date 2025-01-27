<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <style>
        .login-container{
            display:grid;
            width:500px;
            margin:auto;
        }
        .login-title {
            text-align: center;
            font-size: 25px;
            font-weight: 600;
            padding: 50px 0px 50px 0px;
        }
        .login-idpw {
            height:50px;
            margin: 5px 0px 5px 0px;
        }
        .login-button {
            background-color: blue;
            color:white;
            margin-top:10px;
            margin-bottom: 20px;
            height:50px;
            font-size:15px;
        }
        .login-two-button {
            display:grid;
            grid-template-columns: repeat(2, 1fr);
        }
        .signup-button {
            width:70px;
            height:25px;
        }
        .find-button {
            font-size: 15px;
            margin-left:auto;
        }
        input::placeholder {
            padding-left: 30px;
        }
        .find-button:hover {
            cursor:pointer;
        }
    </style>
    <form class="login-container" method="post" action="<%=request.getContextPath()%>/member/loginOk">
        <div class="login-title">로그인 폼</div>
        <input type="text" class="login-idpw" value="goguma" name="userid" placeholder="아이디(5~15자의 영문, 숫자만 가능)"/>
        <input type="text" class="login-idpw" value="12345678" name="userpwd" placeholder="비밀번호(입력 실패 5회 시 잠금 처리)"/>
        <input type="submit" class="login-button" value="로그인"/>
        <div class="login-two-button">
            <input class="signup-button" type="button" onclick="location.href='<%= request.getContextPath()%>/member/form'" value="회원가입"/>
            <div class="find-button">아이디/비밀번호 찾기</div>
        </div>
    </form>