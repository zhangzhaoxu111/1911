<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="webapp/img/apple.jpg">
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">阿里MaMa</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img 
						src="img/jinmao.jpg" class="layui-nav-img">${sessionScope.login_user.username}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="outlogin">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" url="sys/role">角色管理</a>
							</dd>
							<dd>
								<a href="javascript:;" url="sys/user">用户管理</a>
							</dd>
							
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" url="customer">客户管理</a> -->
<!-- 							</dd> -->
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" url="perm">权限管理</a> -->
<!-- 							</dd> -->
							<dd>
								<a href="javascript:;" url="bumen">部门管理</a>
							</dd>
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" url="gonghai">公共客户</a> -->
<!-- 							</dd> -->
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" url="private">私人客户</a> -->
<!-- 							</dd> -->
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" url="visit">回访管理</a> -->
<!-- 							</dd> -->
<!-- 							<dd> -->
<!-- 								<a href="javascript:;" url="annontion">批注管理</a> -->
<!-- 							</dd> -->
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">客户</a>
						<dl class="layui-nav-child">
					<dd>
								<a href="javascript:;" url="customer">客户管理</a>
							</dd>
<dd>
								<a href="javascript:;" url="gonghai">公共客户</a>
							</dd>
							<dd>
								<a href="javascript:;" url="private">私人客户</a>
							</dd>
							<!-- <dd>
								<a href=""> </a>
							</dd> -->
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">回访</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" url="visit">回访管理</a>
							</dd>
							<dd>
								<a href="javascript:;" url="annontion">批注管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">云市场</a></li>
					<li class="layui-nav-item"><a href="">发布商品</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body" >
			<iframe style="height: 98%; width: 100%" src="" > </iframe>
		</div>

		<div class="layui-footer">
			
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js"></script>
	<script type="text/javascript">
	var $=layui.jquery;
	$("[url]").click(function(){
		$("iframe").attr("src",$(this).attr("url"));
	});
	</script>
</body>
</html>