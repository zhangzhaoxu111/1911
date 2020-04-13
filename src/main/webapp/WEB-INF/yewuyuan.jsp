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
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>业务员列表</title>

<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<input class="layui-input" style="width: 260px" type="text"
		id="checktext" placeholder="请输入需要查询的数据" />
 <script type="text/html" id="userlist_bar">
  <button class="layui-btn " lay-event="selete_item"  onclick="yw_sel()"><i class="layui-icon">&#xe615;</i> 查询</button>
  <button class="layui-btn data-method="offset" data-type="auto"  onclick="yw_insert()"><i class="layui-icon">&#xe654;</i> 新增</button>
  
 <button class="layui-btn layui-btn-warm" lay-event="Refresh_item" onclick="yw_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>

</script>

 <script type="text/html" id="rowbar1">
<button class="layui-btn layui-btn-warm" lay-event="delete_item"><i class="layui-icon">&#x1007;</i>删除</button>
<button class="layui-btn " lay-event="update_item"><i class="layui-icon">&#xe642;</i>修改</button>
</script>
 <table class='layui-table'
  lay-data="{url:'select_yewu',toolbar:'#userlist_bar',id:'yewuyuan' ,page:true,method:'post'}"
  lay-filter="usertable">
  <thead>
   <tr>
    <th lay-data="{type:'checkbox'}"></th>
    <th lay-data="{field:'customer_id',width:100}" >id</th>
    <th lay-data="{field:'customer_name',width:100}">姓名</th>
    <th lay-data="{field:'customer_man',width:100}">业务员</th>
    <th lay-data="{field:'customer_tel',width:130}">电话</th>
    <th lay-data="{field:'customer_email',width:220}">邮箱</th>
    <th lay-data="{field:'customer_addr'}">地址</th>
    <th lay-data="{field:'customer_public',width:100}">公海用户</th>
    <th lay-data="{field:'customer_garde',width:100}">等级</th>
    <th lay-data="{field:'customer_time',width:130}">顾客时间</th>
    <th lay-data="{field:'customer_user',width:100}">顾客用户</th>
    <th lay-data="{toolbar:'#rowbar1'}">操作</th>
   </tr>
  </thead>
 </table>
	<!-- 弹出层 -->
	<div hidden id="update_user_div">
		<div class="layui-inline">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="username" autocomplete="off"
					id="update_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" name="tel" autocomplete="off" 
				class="layui-input"
					oninput="value=value.replace(/[^\d]/g,'')" maxlength="11"
					id="update_tel" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input type="text" name="username" autocomplete="off"
					id="update_sex" class="layui-input">
			</div>
		</div>
	</div>
	
	
	<div  hidden id="insert_user_div">
		<div class="layui-inline">
			<label class="layui-form-label">id</label>
			<div class="layui-input-inline">
				<input type="text" name="user_id" autocomplete="off"
					id="insert_id" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="username" autocomplete="off"
					id="insert_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input type="password" name="userpass" autocomplete="off"
					id="insert_pass" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" name="tel" autocomplete="off"
				class="layui-input"
					oninput="value=value.replace(/[^\d]/g,'')" maxlength="11"
					id="insert_tel" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input type="text" name="sex" autocomplete="off"
					id="insert_sex" class="layui-input">
			</div>
		</div>
		
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript" >
		var table = layui.table;
		var layer = layui.layer;
		var laydate = layui.laydate;
		laydate.render({
			elem:'#test5'
		});
		laydate.render({
			elem:'#test6'
		});
		table.on('tool(usertable)', function(obj) {
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.user_id;
			if (obj.event === "delete_item") {
				layer.confirm('确定要对姓名为'+checkdata.username+'进行删除处理吗？',{
					icon:3,
					title:'提示'
				},function(){
					$.post("delUser",{
						"user_id":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("user");
					});
					layer.close();
				})
			} else if (obj.event === "update_item") {
				$("#update_name").val(checkdata.username);
				$("#update_tel").val(checkdata.tel);
				$("#update_sex").val(checkdata.sex);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_user_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("updateUser",{
							"user_id" : checkid,
							"username" : $("#update_name").val(),
							"tel" : $("#update_tel").val(),
							"sex" : $("#update_sex").val(),
							"fasttime" : $("#test5").val(),
							"lasttime" : $("#test6").val(),
						},function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("user");
						});
					}
				})
			}
			
		});

		function yw_insert(){
		//	var checkdata = obj.data;
				//已选中
				//获取ID值
				//var checkid = checkdata[0].user_id;
				layer.open({
					title : "增加信息",
					type : 1,
					content : $("#insert_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("insert_user", {
							"user_id" :$("#insert_id").val() ,
							"username" : $("#insert_name").val(),
							"userpass" : $("#insert_pass").val(),
							"tel" : $("#insert_tel").val(),
							"sex" : $("#insert_sex").val(),
						}, function() {
							layer.closeAll();
							layer.msg("添加成功");
							table.reload("user");
						});
					}
				});
		}
		function yw_sel(){
			var checktext = $("#checktext").val();
				table.reload("yewuyuan",{
					url:"select_yewu",
					where:{
						"checktext":checktext
			}
	});
};
		
		function yw_refresh(){
			var checktext = $("#checktext").val();
			window.location.href = "customer"
		};
		
		function jump() {
			var checkdata = table.checkStatus('user').data;
			if (checkdata.length > 0) {
				var user_id = checkdata[0].user_id;
				window.location.href = 'transfer/' + user_id + '';
			} else {
				layer.msg("未选中数据");
			}
		}
	</script>
</body>
</html>