<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
.layui-table-cell {
	height: auto !important;
	white-space: normal;
}
</style>
</head>
<body>

	<input class="layui-input"  type="text"
		id="checktext" placeholder="请输入需要查询的数据" />
	<script type="text/html" id="userlist_bar">
  <button class="layui-btn " lay-event="selete_item" onclick="user_sel()"><i class="layui-icon">&#xe615;</i>查询</button>
	
  <button class="layui-btn " lay-event="insert_item" data-method="offset" data-type="auto"  onclick="user_insert()"><i class="layui-icon">&#xe654;</i>新增</button>
	
<button class="layui-btn " lay-event="quanxian_item" onclick="jump()"><i class="layui-icon">&#xe620;</i>权限</button>
 <button class="layui-btn layui-btn-warm " lay-event="Refresh_item" onclick="user_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>
</script>

	<script type="text/html" id="rowbar1">
<button class="layui-btn layui-btn-warm " lay-event="delete_item"><i class="layui-icon">&#x1007;</i>删除</button>
<button class="layui-btn " lay-event="update_item"><i class="layui-icon">&#xe642;</i>修改</button>
</script>
	<table class='layui-table'
		lay-data="{url:'select_role',toolbar:'#userlist_bar',id:'role' ,page:true,method:'post'}"
		lay-filter="usertable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'role_id'}">id</th>
				<th lay-data="{field:'role_name'}">角色</th>
				<th lay-data="{toolbar:'#rowbar1'}">操作</th>
			</tr>
		</thead>
	</table>
	<!-- 弹出层 -->
	<div hidden id="update_role_div">
		<div class="layui-inline">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="role_name" autocomplete="off"
					id="update_name" class="layui-input">
			</div>
		</div>

	</div>


	<div hidden id="insert_role_div">

		<div class="layui-inline">
			<label class="layui-form-label">角色</label>
			<div class="layui-input-inline">
				<input type="juese" name="role_juese" autocomplete="off"
					id="insert_rolename" class="layui-input">
			</div>
		</div>

	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		var layer = layui.layer;
		var laydate = layui.laydate;
		laydate.render({
			elem : '#test5'
		});
		laydate.render({
			elem : '#test6'
		});
		table.on('tool(usertable)', function(obj) {
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.role_id;
			if (obj.event === "delete_item") {
				layer.confirm('确定要对角色为' + checkdata.role_name + '进行删除处理吗？', {
					icon : 3,
					title : '提示'
				}, function() {
					$.post("delRole", {
						"role_id" : checkid
					}, function() {
						layer.msg("删除成功");
						table.reload("role");
					});
					layer.close();
				})
			} else if (obj.event === "update_item") {
				$("#update_name").val(checkdata.role_name);
				layer.open({
					title : "修改信息",
					type : 1,
					content : $("#update_role_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updateRole", {
							"role_id" : checkid,
							"role_name" : $("#update_name").val(),
						}, function() {
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("role");
						});
					}
				})
			}

		});

		function user_insert() {
			//$("insert_roleid").val("");
			//$("insert_rolename").val("");
			//已选中
			//获取ID值
			//var checkid = checkdata[0].user_id;
			layer.open({
				title : "增加信息",
				type : 1,
				content : $("#insert_role_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("addRole", {
						//"role_id" : $("#insert_roleid").val(),
						"role_name" : $("#insert_rolename").val()
					}, function() {
						layer.closeAll();
						layer.msg("添加成功");
						table.reload("role");
					});
				}
			});
		}
		function user_sel() {
			var checktext = $("#checktext").val();
			table.reload("role", {
				url : "select_role",
				where : {
					"checktext" : checktext
				}
			});
		};
		function user_refresh() {
			var checktext = $("#checktext").val();
			window.location.href = "sys/role"
		}

		function jump() {
			var checkdata = table.checkStatus('role').data;
			if (checkdata.length > 0) {
				var role_id = checkdata[0].role_id;
				window.location.href = 'index/' + role_id + '';
			} else {
				layer.msg("未选中数据");
			}
		}
	</script>
</body>
</html>