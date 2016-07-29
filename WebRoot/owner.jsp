<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="xyz.baal.orm.Book"%>
<%@page import="xyz.baal.service.DownloadService"%>
<%@page import="xyz.baal.service.CommentService"%>
<%@page import="xyz.baal.service.ApplaudService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<head>
<title>阅读|追逐内心的平和</title>

<meta name="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="admin/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/info.css">
</head>
<body>
	<div class="top">
		<div class="top-nav-info">
			<a href="update.jsp" id="modaltrigger" class="nav-login" rel="nofollow">个人信息</a>
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
		<!-- 看过的书 -->
		<div id="left">
	
			<div id="looked">
			
				<hr style="width:95%;margin:35px 5px 0px 0;" />
				<h2>
					<span class=""
						style="color: #007722;font: 20px Arial, Helvetica, sans-serif ;line-height: 250%;">已下载的书籍</span>
					&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
				</h2>
				<ul class="list-col list-col5 list-express slide-item">
				<c:forEach items="${dlBooks}" var="info">
					<li class="">
						<div class="cover">
							<a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}"> <img
								src="${info.img}" class=""
								width="106px" height="158px" alt="${info.author}">
							</a>
						</div>
						<div class="info">
							<div class="title">
								<a class="" href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">${info.bookname}</a>
							</div>
							<div class="author">${info.author}</div>

						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
			<!-- 已下载的书 end -->
			<!-- 赞过的书 -->
			<div id="bookcontent">
				<h2>
					<span class=""
						style="color: #007722;font: 20px Arial, Helvetica, sans-serif;line-height: 250%;">您点过的赞</span>
					&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
				</h2>
				<div class="intro">
					<c:forEach items="${apBooks}" var="info">
					<li class="">
						<div class="cover">
							<a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}"> <img
								src="${info.img}" class=""
								width="106px" height="158px" alt="${info.bookname}">
							</a>
						</div>
						<div class="info">
							<div class="title">
								<a class="" href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">${info.bookname}</a>
							</div>
							<div class="author">${info.author}</div>
						</div>
					</li>
				</c:forEach>
				</div>
			</div>
			<!-- 评论过的书-->
			<div id="othercomment">
				<h2>
					<span class=""
						style="color: #007722;font: 20px Arial, Helvetica, sans-serif;line-height: 250%;">您写过的评论</span>
					&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
				</h2>
				<div class="comment-list hot show">
					<ul>
						<c:forEach items="${commentLists}" var="info">
						<li class="comment-item"><span class="comment-info"> <a
								href="">${info.username}</a>书籍：<a href="#">${info.bookname}</a><span>${info.time}</span><a
								href="#content" class="answer">回复</a>
						</span>
							<p class="comment-content">${info.content}</p></li>
						</c:forEach>	
					</ul>
				</div>
			</div>
			<!-- 用户评论框 -->
		
		</div>

		<!-- left end -->
		<!-- start right -->
		<div id="right">
			<div id="dianzan">

				<div class="hd">
					<h2>
						<span class="righttitle">推荐排行榜</span>
					</h2>
				</div>
				<hr style="width:90%;margin-bottom:10px;" />
				<div class="bd">
					<ul class="list list-ranking">

					<c:forEach items="${apbooklist}" var="info" varStatus="vs"> 
	                <li class="item">                  
	                    <div class="book-info">
							<span class="rank-num">${vs.index+1}.</span>
	                        <a href="GetBook.action?bookid=${info.bookid}" class="name" target="_blank">${info.bookname}</a>
	                        <div class="author">${info.author}</div>
	                    </div>
	                </li>              
					</c:forEach>      
					</ul>
				</div>
			</div>

			<!-- dianzan end -->
			<!-- start download -->
			<div id="download">
				<div class="hd">
					<h2>
						<span class="righttitle">下载排行榜</span>
					</h2>
				</div>
				<hr style="width:90%;margin-bottom:10px;" />
				<div class="bd">
					<ul class="list list-ranking">
		              <c:forEach items="${dlbooklist}" var="info" varStatus="vs">   
		                <li class="item">                  
		                    <div class="book-info">
								<span class="rank-num">${vs.index+1}.</span>
		                        <a href="GetBook.action?bookid=${info.bookid}" class="name" target="_blank">${info.bookname}</a>
		                        <div class="author">${info.author}</div>
		                    </div>
		                </li>
					</c:forEach>  
					</ul>

				</div>
			</div>
			<!-- download end -->

			<!-- start pinglun -->
			<div id="pinglun">

				<div class="hd">
					<h2>
						<span class="righttitle">最新评论</span>
					</h2>
				</div>
				<hr style="width:90%;margin-bottom:10px;" />
				<div class="bd">
					<ul class="list list-ranking">
					   <c:forEach items="${cmbooklist}" var="info" varStatus="vs">
		                <li class="item">                  
		                    <div class="book-info">
								<span class="rank-num">${vs.index+1}.</span>
		                        <a href="GetBook.action?bookid=${info.bookid}" class="name" target="_blank">${info.bookname}</a>
		                        <div class="author">${info.author}</div>
		                    </div>
		                </li>
		              </c:forEach>    
					</ul>
				</div>
			</div>
			<!-- pinglun end -->
		</div>
		<!-- right end -->
	</div>
	</div>
	<!-- body end -->
	<div id="footer">
		<div class="extra"></div>
		<span id="icp" class="fleft gray-link"><center> © 2015－2016 echzu.com,
			all rights reserved </center></span>
	</div>
</body>
</html>
