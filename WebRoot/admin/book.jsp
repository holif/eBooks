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
<title>书籍管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/boot.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/pager.css"/>
<script type="text/javascript" src="<%=basePath%>admin/js/modernizr.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>admin/js/bootstrap-modal.js"></script>
<style type="text/css">
td {text-align: center;} 
.result-content .result-tab th {text-align: center;} 
</style>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/index.jsp" color="#white">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">书籍管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="<%=basePath%>SelectBookByKey.action" method="post" onsubmit="return check()">
                    <table class="search-tab" >
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="key" value="" id="key" type="text"></td>
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
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>刷新列表</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" id="table" width="100%">
                        <tr>
                            <th>ID</th>
                            <th>书籍名</th>
                            <th>作者</th>
                            <th>类型</th>
                            <th>出版社</th>
                            <th>处理</th>
                        </tr>
                        <c:forEach items="${list}" var="info" varStatus="vs">
	                        <tr>
	                            <td>${info.bookid}</td> 
	                            <td>${info.bookname}</td>
	                            <td>${info.author}</td> 
	                            <td>${info.type}</td>
	                            <td>${info.press}</td> 
	                            <td><input class="btn btn-warning" data-toggle="modal" href="#example"  onclick="editInfo(this)" id="${vs.index+1}" value="修改" type="button">  <input class="btn btn-danger" id="${vs.index+1}" onclick="delInfo(this)" value="删除" type="button"></td> 
	                        </tr>
                        </c:forEach>
                    </table>
                    <div class="navigation">
					  <ol  class="wp-paginate">
					  <c:forEach var="i" begin="1" end="${allpager}" step="1">
						<c:if test="${i==page||(page==0&&i==1)}">
						<li><a href="BookPage.action?page=${i}" title="2" class="page current">${i}</a></li>
						</c:if>
						<c:if test="${(i!=page&&i!=1)||(page!=0&&page!=1&&i==1)}">
						<li><a href="BookPage.action?page=${i}" title="2" class="page">${i}</a></li>
						</c:if>
					  </c:forEach>
					  <c:if test="${allpager>=(page+1)}">
					    <li><a href="BookPage.action?page=${page+1}" class="next">&gt;</a></li>
					  </c:if>
					  </ol>
					</div><br/><br/>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
	<!-- 模态框 -->    
	<div id="example" class="modal hide fade in" style="display: none; ">
		<div class="modal-header">	
			<h3>修改书籍信息</h3>
		</div>
		<div class="modal-body">
			<table class="insert-tab" width="100%">
            	<tbody>
					<tr>
                    	<th><i class="require-red">*</i>ID：</th>
                        <td>
							<input class="common-text required" id="updateid" readOnly="true"  type="text">
						</td>
                   	</tr>
					<tr>
                        <th><i class="require-red">*</i>书籍名：</th>
                        <td>
							<input class="common-text required" id="updatename" type="text">
						</td>
                    </tr>						
						<tr>
                            <th><i class="require-red">*</i>作者：</th>
                            <td>
								<input class="common-text required" id="updateauthor" type="text">
                            </td>
                        </tr>
						
						<tr>
                            <th ><i class="require-red">*</i>类别：</th>
                            <td>
                                <select  id="updatetype" class="required">
                                    <option value="">请选择</option>
                                    <option value="Java">Java</option>
									<option value="Javascript">Javascript</option>
                                    <option value="Python">Python</option>
                                    <option value="PHP">PHP</option>
                                    <option value="Hadoop">Hadoop</option>
                                    <option value="Mahout">Mahout</option>
                                    <option value="DataMining">数据挖掘</option>
                                    <option value="MachineLearning">机器学习</option>
                                    <option value="R">R</option>
                                    <option value="Lua">Lua</option>
                                    <option value="Android">Android</option>     
                                </select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>出版社：</th>
                                <td>
                                    <input class="common-text required" id="updatepress"  type="text">
                                </td>
                            </tr>
                        	</tbody>
                	</table>	        
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn-success" onclick="update()">确认修改</a>
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
		</div>
	</div>
	<!-- 模态框 -->
</div>
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
	function Change() {      
    	var type = $("#selectType").val();
        $.ajax({  
			type: "post",  
			url: "<%=basePath%>SelectBookByType.action?type="+type,  
			dataType: 'html',  
			contentType: "application/x-www-form-urlencoded; charset=utf-8",  
			success: function(result) {  
				location.reload();  
			}  
		});
        }
	function delInfo(obj) {
		if (confirm("确认要删除？")) {
			var id = $(obj).attr("id");
			var bookid = document.getElementById("table").rows[id].cells[0].innerText;
			$.ajax({
				type : "post",
				url : "<%=basePath%>DeleteBook.action?bookid="+bookid,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result) {
					location.reload();
				}
			});
		}
	}
	function editInfo(obj) {
		var id = $(obj).attr("id");
		var bookid = document.getElementById("table").rows[id].cells[0].innerText;
		var bookname = document.getElementById("table").rows[id].cells[1].innerText;
		var author = document.getElementById("table").rows[id].cells[2].innerText;
		var type = document.getElementById("table").rows[id].cells[3].innerText;
		var press = document.getElementById("table").rows[id].cells[4].innerText;
		$('#updateid').val(bookid);
		$('#updatename').val(bookname);
		$('#updateauthor').val(author);
		$('#updatetype').val(type);
		$('#updatepress').val(press);
	}
	function update() {
		var bookid = $('#updateid').val();
		var bookname = $('#updatename').val();
		var author = $('#updateauthor').val();
		var type = $('#updatetype').val();
		var press = $('#updatepress').val();
		$.ajax({
			type : "post",
			url : "<%=basePath%>UpdateBook.action",
			data : "bookid=" + bookid + "&bookname=" + bookname + "&author="
					+ author + "&type=" + type + "&press=" + press,
			dataType : 'html',
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result) {
				location.reload();
			}
		});
	}		
</script>
</body>
</html>