<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>评论管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/pager.css"/>
    <script type="text/javascript" src="<%=basePath%>admin/js/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/js/jquery-1.9.1.min.js"></script>
	<style type="text/css">
		td {text-align: center;} 
		.result-content .result-tab th {text-align: center;} 
	</style>	
<script type="text/javascript">
	function check(){
		var key = $("#key").val();
		if(key==null||key==""){
			alert("请输入关键字");
			return false;
		} else {
			return true;
		}
	}
	function delInfo(obj) {
		if (confirm("确认要删除？")) {
			var id = $(obj).attr("id");
			id = document.getElementById("table").rows[id].cells[0].innerText;
			$.ajax({
				type : "post",
				url : "<%=basePath%>DeleteComment.action?id="+id,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result) {
					location.reload();  
				}
			});
		}
	}	
</script>
</head>
<body>
<%
	if(request.getSession().getAttribute("usid")==null){
		response.sendRedirect(basePath+"admin/login.jsp"); 
	}
 %>
<div class="topbar-wrap white">
    <!--<div class="topbar-inner clearfix">-->
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="<%=basePath%>admin/index.jsp" class="navbar-brand">管理员中心</a></h1>
        </div>
    </div>
</div>
<div class="container clearfix">
    <%@ include file="sidebar.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/index.jsp" color="#white">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="">评论管理</a></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="SelectCommentByKey.action" method="post" onsubmit="return check()">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="评论人" name="key" value="" id="key" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
             <!-- <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a> -->
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>刷新列表</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" id="table" width="100%">
                        <tr>
                            <th>ID</th>
                            <th>评论人</th>
                            <th>书籍名</th>
                            <th>评论内容</th>
                            <th>评论时间</th>
							<th>处理</th>
                        </tr>
                        <c:forEach items="${list}" var="info" varStatus="vs">
	                        <tr>
	                            <td>${info.id}</td> 
	                            <td>${info.username}</td>
	                            <td>${info.bookname}</td> 
	                            <td>${info.content}</td>
	                            <td>${info.time}</td>
								<td><input class="btn btn-danger" id="${vs.index+1}" onclick="delInfo(this)" value="删除" type="button"></td> 
	                        </tr>                        
                        </c:forEach>
                    </table>
                    <div class="navigation">
					  <ol  class="wp-paginate">
					  <c:forEach var="i" begin="1" end="${allpager}" step="1">
						<c:if test="${i==page||(page==0&&i==1)}">
						<li><a href="CommentPage.action?page=${i}" title="2" class="page current">${i}</a></li>
						</c:if>
						<c:if test="${(i!=page&&i!=1)||(page!=0&&page!=1&&i==1)}">
						<li><a href="CommentPage.action?page=${i}" title="2" class="page">${i}</a></li>
						</c:if>
					  </c:forEach>
					  <c:if test="${allpager>=(page+1)}">
					    <li><a href="CommentPage.action?page=${page+1}" class="next">&gt;</a></li>
					  </c:if>
					  </ol>
					</div><br/><br/>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>
