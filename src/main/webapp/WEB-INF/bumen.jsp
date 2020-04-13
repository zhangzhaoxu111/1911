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
<title>部门管理</title>

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
  <button class="layui-btn " lay-event="selete_item"  onclick="bumen_sel()"><i class="layui-icon">&#xe615;</i> 查询</button>
  <button class="layui-btn data-method="offset" data-type="auto"  onclick="user_insert()"><i class="layui-icon">&#xe654;</i> 新增</button>
  
 <button class="layui-btn layui-btn-warm" lay-event="Refresh_item" onclick="user_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>
 <button class="layui-btn " onclick="jump()"><i class="layui-icon">&#xe620;</i>分配员工</button>
</script>

 <script type="text/html" id="rowbar1">
<button class="layui-btn layui-btn-warm" lay-event="delete_item"><i class="layui-icon">&#x1007;</i>删除</button>
<button class="layui-btn " lay-event="update_item"><i class="layui-icon">&#xe642;</i>修改</button>

</script>
 <table class='layui-table'
  lay-data="{url:'select_bumen',toolbar:'#userlist_bar',id:'bumen' ,page:true,method:'post'}"
  lay-filter="usertable">
  <thead>
   <tr>
    <th lay-data="{type:'checkbox'}"></th>
    <th lay-data="{field:'bmid'}" >id</th>
    <th lay-data="{field:'bmname'}">部门</th>
    <th lay-data="{field:'managerr'}">经理</th>
    <th lay-data="{field:'hgzs'}">员工</th>
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
		
	</div>
	
	<form action="" class="layui-form" method="post">
	<div  hidden id="insert_user_div">
		<div class="layui-inline">
			<label class="layui-form-label">id</label>
			<div class="layui-input-inline">
				<input type="text" name="bmid" autocomplete="off"
					id="insert_id" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">部门名</label>
			<div class="layui-input-inline">
				<input type="text" name="bmname" autocomplete="off"
					id="insert_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">经理</label>
			<div class="layui-input-inline">
				<select name="sort" lay-verify="" id="goods">
					<option value="">请选择人员</option>
				</select>
			</div>
		</div>
		
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript" >
		var table = layui.table;
		var layer = layui.layer;
		var laydate = layui.laydate;
		 var form = layui.form;
		laydate.render({
			elem:'#test5'
		});
		laydate.render({
			elem:'#test6'
		});
		table.on('tool(usertable)', function(obj) {
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.bmid;
			if (obj.event === "delete_item") {
				layer.confirm('确定要对姓名为'+checkdata.bmname+'进行删除处理吗？',{
					icon:3,
					title:'提示'
				},function(){
					$.post("del_bumen",{
						"bmid":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("bumen");
					});
					layer.close();
				})
			} else if (obj.event === "update_item") {
				$("#update_name").val(checkdata.bmname);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_user_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("upd_bumen",{
							"bmid" : checkid,
							"bmname" : $("#update_name").val(),
						},function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("bumen");
						});
					}
				})
			}
			
		});

		function user_insert(){
		//	var checkdata = obj.data;
				//已选中
				//获取ID值
				//var checkid = checkdata[0].user_id;
				layer.open({
					title : "增加信息",
					type : 1,
					area: ['500px', '600px'],
					content : $("#insert_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("add_bumen", {
							"bmid" :$("#insert_id").val() ,
							"bmname" : $("#insert_name").val(),
							"managerr" : $("#goods").val(),
						}, function() {
							layer.closeAll();
							layer.msg("添加成功");
							table.reload("bumen");
						});
					}
				});
		}
		function bumen_sel(){
			var checktext = $("#checktext").val();
				table.reload("bumen",{
					url:"select_bum",
					where:{
						"checktext":checktext
			}
	});
};
		
		function user_refresh(){
			var checktext = $("#checktext").val();
			window.location.href = "bumen"
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

		function jump() {
			var checkdata = table.checkStatus('bumen').data;
			if (checkdata.length > 0) {
				var bmid = checkdata[0].bmid;
				window.location.href = 'yonghu/' + bmid + '';
			} else {
				layer.msg("未选中数据");
			}
		}
		function findAll() {
			$(function() {
				$.ajax({
					type : "post",
					url : "findAll",
					dataType : "json",
					success : function(data) {
						$.each(data, function(index, item) {
							console.log(data);
							$("#goods").append(
									"<option value="+item.username+">"
											+ item.username + "</option>");
							form.render('select');
						})
						form.render('select');
					}
				})
			})
		}
		findAll();
	</script>
</body>
</html>