<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改管理密码</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/modernizr.min.js"></script>
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
    <%@ include file="sidebar.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="">修改密码</a></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="<%=basePath%>UpdatePswd.action" method="post" id="myform" name="myform" >
                    <table class="insert-tab" width="100%">
						<span style="font-size:18px;margin-left:25%;">修改管理密码</span>
                        <tbody>

						<tr>
                                <th><i class="require-red">*</i>原密码：</th>
                                <td>
                                    <input class="common-text required" id="oldpswd" name="oldpswd" size="50" type="password">
                                </td>
                        </tr>
						
						<tr>
                                <th><i class="require-red">*</i>新密码：</th>
                                <td>
                                    <input class="common-text required" id="newpswd" name="newpswd" size="50" type="password">
                                </td>
                        </tr>
							
                            <tr>
                                <th><i class="require-red">*</i>确认密码：</th>
                                <td>
                                    <input class="common-text required" id="conpswd" size="50" type="password">
                                </td>
                            </tr>
							
							
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr><br/><br/>
                        </tbody>
					
					</table><br/><br/>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>
