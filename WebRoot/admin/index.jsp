<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
    <script type="text/javascript" src="<%=basePath%>admin/js/modernizr.min.js"></script>
</head>
<body>
<%
	if(request.getSession().getAttribute("usid")==null){
		response.sendRedirect(basePath+"admin/login.jsp"); 
	}
 %>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>后台管理</h1>
        </div>
        <div class="sidebar-content">
           <ul class="sidebar-list">
				<li>
                    <a href="<%=basePath%>Token.action"><i class="icon-font">&#xe028;</i>上传新书</a>
                    
                </li>
				<li>
                    <a href="<%=basePath%>SelectBook.action"><i class="icon-font">&#xe006;</i>书籍管理</a>                  
                </li>
                <li>
                    <a href="<%=basePath%>SelectUser.action"><i class="icon-font">&#xe014;</i>用户管理</a>
                </li>
                <li>
                    <a href="<%=basePath%>SelectComment.action"><i class="icon-font">&#xe012;</i>评论管理</a>
                </li>
                <li>
                    <a href="<%=basePath%>admin/updatepswd.jsp"><i class="icon-font">&#xe018;</i>修改密码</a>
                </li>                
				<li>
                    <a href="<%=basePath%>Logout.action"><i class="icon-font">&#xe010;</i>退出系统</a>      
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin">首页</a></div>
        </div><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<h1><center><span style="font-weight:500;color:#BBB;font-size:24pt;">EBOOKS</span></center></h1>
    </div>
    <!--/main-->
</div>
</body>
</html>