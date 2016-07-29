<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎加入EBOOKS</title>
<link rel="stylesheet" href="css/register.css">  
<script src="http://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>  
</head>
<body>
<div class="header">
<div id="header">
  <div class="site-nav single-nav">
    <div class="site-nav-logo">
      <a href="">
          <img width=80px height=80px src="img/log.png" alt="EBOOKS">
      </a><br/><span style="font-size:18px;">EBOOKS</span>
    </div>
  </div>
</div>
</div>
<div class="wrapper"> 
<h1>
欢迎加入EBOOKS
</h1>
<div class="article">
    <form name="lzform" method="post" action="Register.action" onSubmit="return check()">
		<div class="item extra-tips">
            <label>名字</label>
            <input id="name" name="username" type="text"
            class="basic-input" maxlength="15" tabindex="1" onBlur="checkname()" /><span id="stname"></span>
        </div>
        <div class="suggestion">
            <span class="tips">第一印象很重要，起个响亮的名字吧</span>
        </div>
        <div class="item extra-tips">
            <label>密码</label>
            <input id="password" name="password" type="password" class="basic-input" tabindex="2" maxlength="20" onBlur="checkpass()"/><span id="stpass"></span>
        </div>
		
        <div class="item extra-tips">
            <label>邮箱</label>
            <input id="email" name="email" type="text" class="basic-input" maxlength="60" tabindex="3" onBlur="checkmail()"/><span id="stmail"></span>
        </div>
        <div class="suggestion">
            <div id="email_suggestion"></div>
        </div>

        <div class="item">
          <p class="agreement">
            <label for="agreement" class="agreement-label">
              <input type="checkbox" id="agreement" name="agreement"/>
              我已经认真阅读并同意《<a href="agreement.docx">使用协议</a>》。
            </label>
          </p>
        </div>
        <div class="item-submit">
            <label>&nbsp;</label>
            <input type="submit" name="register" value="注册" disabled="disabled" id="button" class="btn-submit disabled" tabindex="6" title="阅读并同意《使用协议》方可注册。"/>
        </div>
    </form>
    </div>
	<div class="aside">      
		<ul class="sidenav">
		  <li>&gt;&nbsp;已经拥有帐号? <a rel="nofollow" href="index.jsp">直接登录</a></li>
		  <li>&gt;&nbsp;<a href="index.jsp">我是游客，随便看看</a></li>
		</ul>
	</div>
</div>

<div class="footer">      
	<div id="footer">
		<span id="icp" class="fleft gray-link">
			&copy; 2015－2016 ebooks.com, all rights reserved
		</span>

		<span class="fright">
			<a href="">关于ebooks</a>
			· <a href="">联系我们</a>
			· <a href="">免责声明</a> 
			· <a href="">帮助中心</a>
		</span>
	</div>
</div>   
<script>
$(function(){   
	$("#agreement").click(function(){ 
		if($("#agreement").attr('checked', 'checked')){ 
			document.getElementById("button").disabled="";
			document.getElementById("button").style.background = "#3fa156";
			document.getElementById("button").style.color = "#fff";
		} else{ 
			document.getElementById("button").disabled="disabled";
			document.getElementById("button").style.background = "#f0f0f0";
			document.getElementById("button").style.color = "#999";
		} 
	}); 	 
});
function checkname(){
	var name = $("#name").val();
	var reg = /^[a-zA-Z\d]\w{3,11}/;
	if(name==''||name==null){
		$("#stname").html("用户名不能为空");
		$("#stname").css("color","red");
	} else {
		if(reg.test(name)){
			$("#stname").html("");
			$.ajax({
				type : "post",
				url : "CheckUsername.action?username="+name,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result) {
					if(result=="ok"){
						$("#stname").html("用户名可用");
						$("#stname").css("color","green");
					} else {
						$("#stname").html("用户名已被注册");
						$("#stname").css("color","red");
					}
				}
			});
		} else{
			$("#stname").html("请输入正确格式的用户名");
			$("#stname").css("color","red");
		}
	}
}
function checkmail(){
	var mail = $("#email").val();
	if(mail==''||mail==null){
		$("#stmail").html("邮箱地址不能为空");
		$("#stmail").css("color","red");
	} else {
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if(!reg.test(mail)){
			$("#stmail").html("请输入正确的邮箱地址");
			$("#stmail").css("color","red");
		}else{
			$("#stmail").html("");
		}
	}
}
function checkpass(){
	var pass = $("#password").val();
	if(pass==''||pass==null){
		$("#stpass").html("密码不能为空");
		$("#stpass").css("color","red");
	} else {
		if(pass.length<6){
			$("#stpass").html("密码长度不能少于6位字符");
			$("#stpass").css("color","red");
		} else {
			$("#stpass").html("");
		}
	}
}
function check(){
	var name = $("#name").val();
	var pass = $("#password").val();
	var mail = $("#email").val();
	if(pass.length<6||mail==''||mail==null||name==''||name==null){
		return false;
	} else {
		return true;
	}
}
</script>
  </body>
</html>