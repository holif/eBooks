<%@page import="xyz.baal.util.BookRecommender"%>
<%@page import="xyz.baal.orm.CommentList"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="xyz.baal.orm.Book"%>
<%@ page import="xyz.baal.service.BookService"%>
<%@page import="xyz.baal.service.DownloadService"%>
<%@page import="xyz.baal.service.CommentService"%>
<%@page import="xyz.baal.service.ApplaudService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype>
<html>
<head>
<meta charset="utf-8" />
<title>阅读|追逐内心的平和</title>
<script type="text/javascript" src="<%=basePath%>admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/book_style.css">
<style type="text/css">
ul#nav li{list-style:none} 
ul#nav li a{color:#000000;text-decoration:none}  
ul#nav li a:hover{} 
ul#nav{ width:80%; height:40px; background:#fff;margin-top:15px;} 
ul#nav li{display:inline; height:40px} 
ul#nav li a{display:inline-block; padding:0 20px; height:40px; line-height:40px; 
color:#000; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#F5F5F5} 
</style>
<script type="text/javascript">
$(function(){
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
function check(){
	if($('#ukey').val()==0){
		alert("亲，你还没登录呢！");
		return false;
	} else {
		return true;
	}
}
function downl(){
	var ukey = $('#ukey').val();
	var bbook = $('#bbook').val();
			$.ajax({
				type : "post",
				url : "Download.action?ukey="+ukey+"&bbook="+bbook,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result) {
					location.reload();
				}
			});
}
function applaud(){
	var ukey = $('#ukey').val();
	if(ukey==0){
		alert("亲，你还没登录呢！");
	} else {
	var bbook = $('#bbook').val();
			$.ajax({
				type : "post",
				url : "Applaud.action?ukey="+ukey+"&bbook="+bbook,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result) {
					location.reload();
				}
			});
	}
}
function comment(){
	var ukey = $('#ukey').val();
	if(ukey==0){
		alert("亲，你还没登录呢！");
		return;
	} else {
	var bbook = $('#bbook').val();
	var content = $('#content').val();
			$.ajax({
				type : "post",
				url : "Comment.action?ukey="+ukey+"&bbook="+bbook+"&content="+content,
				dataType : 'html',
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				success : function(result) {
					location.reload();
				}
			});	
	
	}
}
function check(){
	var name = $("#username").val();
	var pass = $("#password").val();
	var reg = /^[a-zA-Z\d]\w{3,11}/;
	if(reg.test(name)&&reg.test(pass)){
		return true;
	} else {
		$("#username").val('');
		$("#password").val('');
		return false;
	}
}
</script>
</head>
<body>
<%
	List<Book> dlbooklist = DownloadService.getBooksByDL();
	request.setAttribute("dlbooklist", dlbooklist);
	
	List<Book> apbooklist = new ArrayList<Book>();
	if(request.getSession().getAttribute("usid")!=null){
		int usid = Integer.parseInt(request.getSession().getAttribute("usid").toString());
		apbooklist = BookRecommender.getBooks(usid);
	}
	else {
		apbooklist = ApplaudService.getBooksByAP();
	}
	request.setAttribute("apbooklist", apbooklist);
	
	List<Book> cmbooklist = CommentService.getBooksByCM();
	request.setAttribute("cmbooklist", cmbooklist);
 %>
  <div id="loginmodal" style="display:none;">
    <center><h2><span class="read_text">用户登录</span></h2></center><br/>
    <form id="loginform" name="loginform" method="post" action="UserLogin.action" onsubmit="return check()">     
	  <input type="text" name="username" id="username" class="txtfield" placeholder="用户名" >      
      <input type="password" name="password" id="password" class="txtfield" placeholder="密码" >           
      <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="登陆" ></div>
    </form>
  </div>
<div class="top">
<div class="top-nav-info">    
	<% if(request.getSession().getAttribute("usid")!=null){ %>
		<a href="Owner.action?usid=<%=request.getSession().getAttribute("usid")%>"  class="nav-login" rel="nofollow">个人中心</a>
		<a href="UserLogout.action" class="nav-register" rel="nofollow">退出</a>
	<%} else { %>
	   <a href="#loginmodal" id="modaltrigger" class="nav-login" rel="nofollow">登录</a>
	   <a href="register.jsp" class="nav-register" rel="nofollow">注册</a>
	<%} %>
</div>
</div>
<!-- start hender -->
<div id="header">
	<div class="log">
		<a class="log_a" href="<%=basePath%>"><img src="img/log.png" width="100px" /></a>
		<h2>BOOKS</h2>
	</div>
	<div class="nav-search">
		<h2><span class="read_text">阅读|追逐内心的平和</span></h2><br/>
		<form name="search" id="srch" class="hidden-xs hidden-sm" action="Search.action" method="GET">
			<center><input type="text" class="text" name="query" value="" placeholder="书名、分类"><button type="submit">搜索</button></center>
		</form>
	</div>
</div>
<!-- hender end -->
<!-- start body -->
<div id="body">
<ul id="nav">
	<li><a href="<%=basePath%>">首页</a></li> 
	<li><a href="Search.action?query=python">Python</a></li> 
	<li><a href="Search.action?query=java">Java</a></li> 
	<li><a href="Search.action?query=hadoop">Hadoop</a></li> 
	<li><a href="Search.action?query=mahout">Mahout</a></li> 
	<li><a href="Search.action?query=javascript">JavaScript</a></li> 
	<li><a href="Search.action?query=android">Android</a></li> 
	<li><a href="Search.action?query=novel">文学</a></li> 
</ul> 
<!-- start left -->
<div id="left">
<hr style="width:95%;margin:15px 5px 25px 0;" />
	<!-- 书籍的基本信息 -->
	<div id="bookinfo">
		<input type="hidden" name="bbook" id="bbook" value="${book.bookid}" />
		<span class="booktitle">${book.bookname}</span>
		<div class="bookimg">
			<a href="http://mozilla.github.io/pdf.js/web/viewer.html?file=${book.download}"><img width="107px" height="138px" src="${book.img}" /></a>
		</div>
		<div class="info">
			<span class="words">作者：${book.author} </span><br/>
			<span class="words">出版社：${book.press}</span><br/>
			<span class="words">类别：${book.type}</span><br/>
			<% if(request.getSession().getAttribute("usid")!=null){ %>
			<span class="words">下载：<a href="${book.download}" onclick="downl()"><img src="<%=basePath%>img/dl.jpg" class='dl' width="20" height="20" /></a>&nbsp;(${dl})</span><br/>
			<%}else{%>
			<span class="words">下载：<a href="javascript:void(0);" onclick="check()"><img src="<%=basePath%>img/dl.jpg" class='dl' width="20" height="20" /></a>&nbsp;(${dl})</span><br/>
			<%} %>
			<span class="words">点赞：<a href="#" onclick="applaud()"><img src="<%=basePath%>img/zan.png" class='zan' width="20" height="20" /></a>&nbsp;(${ap})</span><br/>
			<span class="words">评论：<a href="#content"><img src="<%=basePath%>img/comm.jpg" class='zan' width="20" height="20" /></a>&nbsp;(${cm})</span><br/>
		</div>
	</div>
		<!-- 内容简介 -->
	<div id="bookcontent">
		<h2>
		<span class="" style="color: #007722;font: 20px Arial, Helvetica, sans-serif;line-height: 250%;">内容简介</span>
		&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
		</h2>
		<div class="intro">
    <p>${book.abstracts}</p></div>
	</div>
		<!-- 本书评论内容 -->
	<div id="othercomment">
		<h2>
		<span class="" style="color: #007722;font: 20px Arial, Helvetica, sans-serif;line-height: 250%;">评论</span>
		&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
		</h2>
		<div class="comment-list hot show">
			<ul>
			<c:forEach items="${bookcmlist}" var="info" varStatus="vs"> 
				<li class="comment-item">
					<span class="comment-info">
						<a href="">${info.username}</a>
						<span>${info.time}</span><a href="#content" class="answer">回复</a>
					</span>
					<p class="comment-content">${info.content} </p>
				</li>
			</c:forEach>
								
			</ul>
		</div>
	</div>
		<!-- 用户评论框 -->
	<div id="usercomment">
		<h2>
		<span class="" style="color: #007722;font: 20px Arial, Helvetica, sans-serif;line-height: 250%;">写书评</span>
		&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
		</h2>
		<%
			if(request.getSession().getAttribute("usid")!=null){
		 %>
		 	<input type="hidden" name="ukey" id="ukey" value="<%=request.getSession().getAttribute("usid")%>"/>
		 <%} else{ %>
		 	<input type="hidden" name="ukey" id="ukey" value="0"/>
		 <%} %>
		<span class="info">您的每一条评论对他人都有借鉴意义 . . .</span>
		<textarea name="content" id="content" value="" style="width:680px; height:150px;" ></textarea>
		<div style="width:680px;margin-top:10px;">
			<input type="button" style="background:#3fa156;border: 1px solid #528641;color: #fff;font:15px Arial, Helvetica, sans-serif;float:right;width:55px;height:25px;" onclick="comment()" value="发表" />
		</div>	
	</div>		
</div>
<!-- left end -->

<!-- start right -->
<div id="right">
	<div id="dianzan">	
	<div class="hd">
        <span class="righttitle">推荐排行榜</span>
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
     <h2><span class="righttitle">下载排行榜</span></h2>
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
     <h2><span class="righttitle">最新评论</span></h2>
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
<!-- body end -->
<div id="footer">
<div class="extra"></div>
<span id="icp" class="fleft gray-link"><center>© 2015－2016 echzu.com, all rights reserved</center></span>
</div>
</body>
</html>
