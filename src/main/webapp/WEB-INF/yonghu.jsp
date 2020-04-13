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
	<input type="hidden" name='bmid' value="${bmid}">
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
							var data1;
							$.post("positionli", function(d) {

								data1 = d.data;
								console.log(d.data);
							});
							transfer.render({
								id : 'xxx',
								elem : '#test4',
								data : data1,
								title : [ '用户', '当前用户' ],
								btn : [ "保存", "关闭" ],
							//showSearch : true,
							});
							//批量办法定事件
							util.event('lay-demoTransferActive', {
								getData : function(othis) {
									var getData = transfer.getData('xxx'); //获取右侧数据
									//layer.alert(JSON.stringify(getData));
									$.post("xxxBumen",{
										"bmid":$("[name='bmid']").val(),
										"user_id":JSON.stringify(getData),
										})
								},
								
							});
						})
	</script>

</body>
</html>