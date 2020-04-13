<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>分配岗位</title>
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
.layui-btn{
position:relative;
margin-left: 310px;
margin-top: -50px;
}
</style>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>显示搜索框</legend>
	</fieldset>
	<input type="hidden" name='user_id' value="${user_id}" id='user_id'>
	<div id="test4" class="demo-transfer"></div>
	<div class="layui-btn-container">
		<button type="button" class="layui-btn"
			lay-demotransferactive="getData">保存</button>
		<button type="button" class="layui-btn"
			lay-demotransferactive="reload">取消</button>
	</div>

	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		layui
				.use(
						[ 'transfer', 'layer', 'util' ],
						function() {
							var $ = layui.$, transfer = layui.transfer, layer = layui.layer, util = layui.util;
							//模拟数据
							$.ajaxSettings.async = false;
							var data1,data2;
							$.post("positionlist", function(d) {

								data1 = d.data;
								console.log(d.data);
							});
							$.post("select_value",{"user_id":$("#user_id").val()},function(d) {

								data2 = d;
								console.log(d);
							});
							transfer.render({
								id : 'xxx',
								elem : '#test4',
								data : data1,
								title : [ '职位', '当前职位' ],
								value : data2,
							//showSearch : true,
							});
							//批量办法定事件
							util.event('lay-demoTransferActive', {
								getData : function(othis) {
									var getData = transfer.getData('xxx'); //获取右侧数据
									//layer.alert(JSON.stringify(getData));
									$.post("xxxUser",{
										"user_id":$("[name='user_id']").val(),
										"role_id":JSON.stringify(getData)
										})
										//layer.closeAll();
										//layer.msg("新增成功");
										//transfer.reload("xxx","userlist");
										window.location.href = "sys/user";
								},
								
							});
						})
	</script>

</body>
</html>