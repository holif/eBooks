<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="xyz.baal.orm.Book"%>
<%@page import="xyz.baal.service.CommentService"%>
<%@page import="xyz.baal.service.ApplaudService"%>
<%@ page import="xyz.baal.service.BookService"%>
<%@page import="xyz.baal.service.DownloadService"%>
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
<link rel="stylesheet" type="text/css" media="all" href="css/style.css">
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
//start 	
	List<Book> pybooklist = BookService.getBookinfoByType("python");
	request.setAttribute("pybooklist", pybooklist);
	
	List<Book> javabooklist = BookService.getBookinfoByType("java");
	request.setAttribute("javabooklist", javabooklist);
	
	List<Book> hadoopbooklist = BookService.getBookinfoByType("hadoop");
	request.setAttribute("hadoopbooklist", hadoopbooklist);
	
	List<Book> mahoutbooklist = BookService.getBookinfoByType("mahout");
	request.setAttribute("mahoutbooklist", mahoutbooklist);
/* 	
	List<Book> jsbooklist = BookService.getBookinfoByType("javascript");
	request.setAttribute("jsbooklist", jsbooklist);
	
	List<Book> androidbooklist = BookService.getBookinfoByType("android");
	request.setAttribute("androidbooklist", androidbooklist);
	
	List<Book> nbooklist = BookService.getBookinfoByType("novel");
	request.setAttribute("nbooklist", nbooklist); */
//end 	
	
	List<Book> dlbooklist = DownloadService.getBooksByDL();
	request.setAttribute("dlbooklist", dlbooklist);
	
	List<Book> apbooklist = ApplaudService.getBooksByAP();
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
		<a  href="<%=basePath%>"><img src="img/log.png" width="100px" /></a>
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
<div class="extra" style="width:95%;margin:10px 0px 15px 0px;border: 1px dashed #DBDBDB"></div>
<%
	if(request.getAttribute("listBookInfo")==null){
	%>
<span style="width:95%;font-seiz:24"><b>Python类书籍:</b></span><br/>
<div class="extra" style="width:95%;margin:10px 0px;border: 1px dashed #DBDBDB"></div>
    <ul class="list-col list-col5 list-express slide-item">
		<c:forEach items="${pybooklist}" var="info" varStatus="vs">
		<li class="bookli">
            <div class="cover">
              <a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">
                <img src="${info.img}" class=""
                  width="106px" height="158px" alt="${info.bookname}">
              </a>
            </div>
            <div class="info">
              <div class="title">
                <a class="" href="GetBook.action?bookid=${info.bookid}"
                  title="${info.bookname}">${info.bookname}</a>
              </div>
              <div class="author">${info.author}</div>
            </div>
          </li>
        </c:forEach>  
    </ul><br/><br/>
    <span style="width:95%;font-seiz:24"><b>Java类书籍:</b></span><br/>
   <div class="extra" style="width:95%;margin:10px 0px;border: 1px dashed #DBDBDB"></div>
    <ul class="list-col list-col5 list-express slide-item">

		<c:forEach items="${javabooklist}" var="info" varStatus="vs">
		<li class="bookli">
            <div class="cover">
              <a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">
                <img src="${info.img}" class=""
                  width="106px" height="158px" alt="${info.bookname}">
              </a>
            </div>
            <div class="info">
              <div class="title">
                <a class="" href="GetBook.action?bookid=${info.bookid}"
                  title="${info.bookname}">${info.bookname}</a>
              </div>
              <div class="author">${info.author}</div>
            </div>
          </li>
        </c:forEach>  
    </ul><br/><br/>
   
    <span style="width:95%;font-seiz:24"><b>Hadoop类书籍:</b></span><br/>
    <div class="extra" style="width:95%;margin:10px 0px;border: 1px dashed #DBDBDB"></div>
    <ul class="list-col list-col5 list-express slide-item">

		<c:forEach items="${hadoopbooklist}" var="info" varStatus="vs">
		<li class="bookli">
            <div class="cover">
              <a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">
                <img src="${info.img}" class=""
                  width="106px" height="158px" alt="${info.bookname}">
              </a>
            </div>
            <div class="info">
              <div class="title">
                <a class="" href="GetBook.action?bookid=${info.bookid}"
                  title="${info.bookname}">${info.bookname}</a>
              </div>
              <div class="author">${info.author}</div>
            </div>
          </li>
        </c:forEach>  
    </ul><br/><br/>
    
<span style="width:95%;font-seiz:24"><b>Mahout类书籍:</b></span><br/>
<div class="extra" style="width:95%;margin:10px 0px;border: 1px dashed #DBDBDB"></div>
    <ul class="list-col list-col5 list-express slide-item">
		<c:forEach items="${mahoutbooklist}" var="info" varStatus="vs">
		<li class="bookli">
            <div class="cover">
              <a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">
                <img src="${info.img}" class=""
                  width="106px" height="158px" alt="${info.bookname}">
              </a>
            </div>
            <div class="info">
              <div class="title">
                <a class="" href="GetBook.action?bookid=${info.bookid}"
                  title="${info.bookname}">${info.bookname}</a>
              </div>
              <div class="author">${info.author}</div>
            </div>
          </li>
        </c:forEach>  
    </ul><br/><br/> 
    <%} else{%>
        <ul class="list-col list-col5 list-express slide-item">
		<c:forEach items="${listBookInfo}" var="info" varStatus="vs">
		<li class="bookli">
            <div class="cover">
              <a href="GetBook.action?bookid=${info.bookid}" title="${info.bookname}">
                <img src="${info.img}" class=""
                  width="106px" height="158px" alt="${info.bookname}">
              </a>
            </div>
            <div class="info">
              <div class="title">
                <a class="" href="GetBook.action?bookid=${info.bookid}"
                  title="${info.bookname}">${info.bookname}</a>
              </div>
              <div class="author">${info.author}</div>
            </div>
          </li>
        </c:forEach>  
    </ul><br/><br/> 
    <%} %>
    
</div>
<!-- left end -->

<!-- start right -->
<div id="right">
	<div id="dianzan">
		
	<div class="hd">
        <h2><span class="righttitle">推荐排行榜</span></h2>
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
	<div class="extra">     
    </div>
	<span id="icp" class="fleft gray-link">
    <center>© 2015－2016 echzu.com, all rights reserved</center>
	</span>
</div>
</body>
</html>