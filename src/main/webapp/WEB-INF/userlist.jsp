<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
<title>用户列表</title>

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
<shiro:hasPermission name="user_add">
  <button class="layui-btn " lay-event="selete_item"  onclick="user_sel()"><i class="layui-icon">&#xe615;</i> 查询</button>
</shiro:hasPermission> 
<shiro:hasPermission name="user_add">
 <button class="layui-btn data-method="offset" data-type="auto"  onclick="user_insert()"><i class="layui-icon">&#xe654;</i> 新增</button>
</shiro:hasPermission>  
<button class="layui-btn layui-btn-warm" lay-event="Refresh_item" onclick="user_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>
 <button class="layui-btn " onclick="jump()"><i class="layui-icon">&#xe620;</i>分配职位</button>
</script>

 <script type="text/html" id="rowbar1">

<button class="layui-btn layui-btn-warm" lay-event="delete_item"><i class="layui-icon">&#x1007;</i>删除</button>

<shiro:hasPermission name="user_add">
<button class="layui-btn " lay-event="update_item"><i class="layui-icon">&#xe642;</i>修改</button>
</shiro:hasPermission>
</script>
 <table class='layui-table'
  lay-data="{url:'select_user',toolbar:'#userlist_bar',id:'user' ,page:true,method:'post'}"
  lay-filter="usertable">
  <thead>
   <tr>
    <th lay-data="{type:'checkbox'}"></th>
    <th lay-data="{field:'user_id',width:300}">id</th>
    <th lay-data="{field:'username',width:120}">姓名</th>
    <th lay-data="{field:'zhiwei',width:140}">职位</th>
    <th lay-data="{field:'sex',width:100,templet:function(d){
    if(d.sex == 1){
    return '男';
    }else{
    return '女';
    }
    }}">性别</th>
    <th lay-data="{field:'tel',width:200}">电话</th>
    <th lay-data="{field:'fasttime',width:210}">注册时间</th>
    <th lay-data="{field:'lasttime',width:210}">最后登录时间</th>
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
			<div class="layui-input-inline layui-form" >
			 <input type="radio" name="sex" id="update_sex" value="1" title="男" >
            <input type="radio" name="sex" id="update_sex" value="0" title="女">        			
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
			<div class="layui-input-inline layui-form" >
			 <input type="radio" name="sex" id="insert_sex" value="1" title="男" >
            <input type="radio" name="sex" id="insert_sex" value="0" title="女">        			
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
			var $ = layui.jquery;
			var form = layui.form;
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
				//var checkdata = table.checkStatus('user').data;
				$("#update_name").val(checkdata.username);
				$("#update_tel").val(checkdata.tel);
				$("input[name='sex'][value='"+checkdata.sex+"']").prop("checked","checked");
				form.render();
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
							"sex" : $("input[name='sex']:checked").val(),
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

		function user_insert(){
		var checkdata = table.checkStatus('user').data;
				//已选中
				//获取ID值
				//var checkid = checkdata[0].user_id;
				$("input[name='sex'][value='"+checkdata.sex+"']").prop("checked","checked");
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
							"sex" : $("input[name='sex']:checked").val(),
						}, function() {
							layer.closeAll();
							layer.msg("添加成功");
							table.reload("user");
						});
					}
				});
		}
		function user_sel(){
			var checktext = $("#checktext").val();
				table.reload("user",{
					url:"select_user",
					where:{
						"checktext":checktext
			}
	});
};
		
		function user_refresh(){
			var checktext = $("#checktext").val();
			window.location.href = "sys/user"
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