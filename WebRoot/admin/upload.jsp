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
    <title>新书上传</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
    <script type="text/javascript" src="<%=basePath%>admin/js/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/js/upfile.js"></script>
<script>
	var uploader = uploadJSSDK;
    function upload(e){
        var files = e.target.files;
        //上传
		var id=e.target.id;  
		var  myselect=document.getElementById("type");
		var index=myselect.selectedIndex ; 
		var selectvalue = myselect.options[index].value;
		for(var i=0;i<files.length;i++){
            uploader({
                file: files[i],   //文件，必填,html5 file类型，不需要读数据流，        
                token: document.getElementById('token').value,  //token，必填
                dir: selectvalue,
                callback: function (percent, result) {
					var div;
					if(percent==100){
						if(id=="file"){
							document.getElementById('download').value=result.url;
							div = document.getElementById('hiddpdf');
						}else{
							document.getElementById('img').value=result.url;
							div = document.getElementById('hiddimg');
						}	
					}
                    div.innerHTML = result.url;
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
    <div class="topbar-inner clearfix">
    </div>
</div>
<div class="container clearfix">
    <%@ include file="sidebar.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="">新书上传</a></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="Upload.action" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody>
						<tr>
                            <th><i class="require-red">*</i>书籍名：</th>
                            <td>
								<input class="common-text required" id="bookname" name="bookname" size="50" value="" type="text">
							</td>
                        </tr>
						
						<tr>
                            <th><i class="require-red">*</i>作者：</th>
                            <td>
								<input class="common-text required" id="author" name="author" size="50" value="" type="text">
                            </td>
                        </tr>
						
						<tr>
                            <th width="120"><i class="require-red">*</i>类别：</th>
                            <td>
                                <select name="type" id="type" class="required">
                                    <option value="e">请选择</option>
                                    <option value="Java">Java</option>
									<option value="Javascript">Javascript</option>
                                    <option value="Python">Python</option>
                                    <option value="PHP">PHP</option>
                                    <option value="Hadoop">Hadoop</option>
                                    <option value="DataMining">数据挖掘</option>
                                    <option value="MachineLearning">机器学习</option>
                                    <option value="R">R</option>  
                                    <option value="Novel">文学</option>   
                                </select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>出版社：</th>
                                <td>
                                    <input class="common-text required" id="press" name="press" size="50" value="" type="text">
                                </td>
                            </tr>
							
							<tr>
                                <th><i class="require-red">*</i>摘要：</th>
                                <td>
                                    <textarea class="common-text required" style="height:120px;" name="abstracts" rows="0" cols="50"></textarea>
                                </td>
                            </tr>
                            
							<tr>
                                <th><i class="require-red">*</i>书籍文档：</th>
                                <td><input id="token" type="hidden" value="${token}" />
                                    <input type="file" value="请选择" id="file" multiple onchange="upload(event)" /><input type="hidden" id="download" name="download" value="" ><p id="hiddpdf"></p>
                                </td>
                            </tr>

							<tr>
                                <th><i class="require-red">*</i>封面图：</th>
                                <td>
                                    <input type="file" value="请选择" id="picture" multiple onchange="upload(event)" /><input type="hidden" id="img" name="img" value="" ><p id="hiddimg"></p>
                                </td>
                            </tr>
							
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        	</tbody>
                	</table>
                </form>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>
