<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<div class="sidebar-wrap">
		<div class="sidebar-title">
			<h1>后台管理</h1>
		</div>
		<div class="sidebar-content">
			<ul class="sidebar-list">
				<li><a href="<%=basePath%>Token.action"><i
						class="icon-font">&#xe028;</i>上传新书</a></li>
				<li><a href="<%=basePath%>SelectBook.action"><i
						class="icon-font">&#xe006;</i>书籍管理</a></li>
				<li><a href="<%=basePath%>SelectUser.action"><i
						class="icon-font">&#xe014;</i>用户管理</a></li>
				<li><a href="<%=basePath%>SelectComment.action"><i
						class="icon-font">&#xe012;</i>评论管理</a></li>
				<li><a href="<%=basePath%>admin/updatepswd.jsp"><i
						class="icon-font">&#xe018;</i>修改密码</a></li>
				<li><a href="<%=basePath%>Logout.action"><i
						class="icon-font">&#xe010;</i>退出系统</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
