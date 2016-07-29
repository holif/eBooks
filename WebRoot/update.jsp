<%@page import="xyz.baal.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	int usid = (Integer)request.getSession().getAttribute("usid");
	String name = UserService.getUserinfoByUsid(usid).getUsername();
 %>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<head>
<title>阅读|追逐内心的平和</title>
<meta name="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="admin/js/jquery-1.9.1.min.js"></script>
<style type="text/css"> 
* {margin: 0px;padding: 0px;}
#header .log a:hover {color: ;text-decoration: none;background: none;}
#header .log a:active {color: ;text-decoration: none;background: none;}
a {cursor: pointer;}
a:link {color: #37a;text-decoration: none;}
a:visited {color: #666699;text-decoration: none;}
a:hover {color: #FFFFFF;text-decoration: none;background: #37a;}
a:active {color: #FFFFFF;text-decoration: none;background: #FF9933;}
a img {border-width: 0;vertical-align: middle;}
.nav-search {float: left;margin-top: 30px;margin-left: 150px;}
.nav-search .read_text {line-height: 1.5em;overflow: visible;font-size: 22px;text-shadow: #f3f3f3 1px 1px 0px, 
#b2b2b2 1px 2px 0}
#srch input {width: 400px;height: 23px;padding: 3px 5px;font-size: 14px;line-height: 20px;border: 2px solid #ccc;
border-right: none;border-radius: 0;margin-right: 0px;float: left;}
#srch button {width: 80px;height: 33px;overflow: hidden;right: 0;top: 0;margin-left: 0px;font-size: 14px;
border: 2px solid #ccc;float: left;}
.log {margin-left: 150px;float: left;}
.top {width: 100%;height: 29px;background-color: #545652;}
#header {width 100%;height: 140px;background-color: #FCFCFC;}
#body {width: 1100px;margin: 0 auto;background-color:;}
#footer #icp {font-size: 14px;color: #ABABAB;}
.top-nav-info {float: right;margin: 0 12px 0 0;line-height: 28px;}
.top-nav-info a {color: #d5d5d5;font: 12px Helvetica, Arial, sans-serif;display: inline-block;zoom: 1;margin: 0;
padding: 0 12px;height: 28px;}
.top-nav-info a:hover,.top-nav-info a:active {color: #FFF;}
.top-nav-info a:visited,.top-nav-info a:hover,.top-nav-info a:focus {background-color: transparent;}
h2 { color: #555; margin: 0 0 20px 0; }			
#body label {font-size: 20px;color: #666; }	
#body form { padding: 0px 40px 0px 40px; margin: 5px 0 0 150px;width: 505px;background: #fff;}	
fieldset { border: none; }	
#user-details { float: left;width: 230px; }
#body input { padding: 8px; margin: 4px 0 20px 0; background: #fff; width: 220px; font-size: 14px; color: #555; 
border: 1px #ddd solid;width:300px;-webkit-box-shadow: 0px 0px 4px #aaa;-moz-box-shadow: 0px 0px 4px #aaa; 
box-shadow: 0px 0px 4px #aaa;-webkit-transition: background 0.3s linear;}
#body input:hover{ background: #eee; }		
#body input.submit { 	width: 150px; color: #eee; text-transform: uppercase; margin-top: 10px;background-color: #18a5cc;
border: none;-webkit-transition: -webkit-box-shadow 0.3s linear;-moz-border-radius: 4px; -webkit-border-radius: 4px;
border-radius: 4px;background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#18a5cc), to(#0a85a8)); 
background: -moz-linear-gradient(25% 75% 90deg,#0a85a8, #18a5cc);} 					
</style> 
</head>
<body>
	<div class="top">
		<div class="top-nav-info">
			<a href="javascript:history.go(-1)" id="modaltrigger" class="nav-login" rel="nofollow">个人中心</a>
			<a href="UserLogout.action" class="nav-register" rel="nofollow">退出</a>
		</div>
	</div>
	<!-- start hender -->
	<div id="header">
		<div class="log">
			<a  href="<%=basePath%>"><img src="img/log.png" width="100px" /></a>
			<h2>BOOKS</h2>
		</div>
		<div class="nav-search">
			<h2>
				<span class="read_text">阅读|追逐内心的平和</span>
			</h2>
			<br />
			<form name="search" id="srch" class="hidden-xs hidden-sm" action="Search.action"
				method="GET">
				<center>
					<input type="text" class="text" name="query" value="" placeholder="书名、分类">
					<button type="submit">搜索</button>
				</center>
			</form>
		</div>
	</div>
	<!-- hender end -->
	<!-- start body -->
	<div id="body">
		<div id="left"><br/><br/>
		<hr />
			<form action="UpdateUserPswd.action" method="post"><br/><br/>
			<p><h2><%=name%>,您可以在此修改登录密码：</h2></p>				
			<fieldset id="user-details">		
				<label for="password">原密码:</label>
				<input type="password" name="oldpswd" id="oldpswd" value="" /> 
			
				<label for="password">新密码:</label> 
				<input type="password" name="newpswd" id="newpswd" value=""  /> 
			
				<label for="password">确认:</label> 
				<input type="password" id="conpswd" value=""  /> 
				
				<input type="submit" value="修改" name="submit" class="submit" />		
				<br/><br/>
			</fieldset>
			</form>
			<hr style="clear:left;" />
		</div>
		<!-- left end -->		
	</div>
	</div>
	<!-- body end -->
	<div id="footer">
		<center><span id="icp" class="fleft gray-link"> © 2015－2016 echzu.com,
			all rights reserved </span></center>
	</div>
</body>
</html>