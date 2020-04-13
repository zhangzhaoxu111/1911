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
<title>权限</title>

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
  <button class="layui-btn " lay-event="selete_item"  onclick="user_sel()"><i class="layui-icon">&#xe615;</i> 查询</button>
  <button class="layui-btn data-method="offset" data-type="auto"  onclick="user_insert()"><i class="layui-icon">&#xe654;</i> 新增</button>
  
 <button class="layui-btn layui-btn-warm" lay-event="Refresh_item" onclick="user_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>
 
</script>

 <script type="text/html" id="rowbar1">
<button class="layui-btn layui-btn-warm" lay-event="delete_item"><i class="layui-icon">&#x1007;</i>删除</button>
<button class="layui-btn " lay-event="update_item"><i class="layui-icon">&#xe642;</i>修改</button>
</script>
 <table class='layui-table'
  lay-data="{url:'select_perm',toolbar:'#userlist_bar',id:'permission' ,page:true,method:'post'}"
  lay-filter="usertable">
  <thead>
   <tr>
    <th lay-data="{type:'checkbox'}"></th>
    <th lay-data="{field:'perm_id',width:100}">id</th>
    <th lay-data="{field:'perm_name'}">操作</th>
    <th lay-data="{field:'parent_id'}">父节点</th>
    <th lay-data="{field:'perm_code'}">别名</th>
    <th lay-data="{toolbar:'#rowbar1'}">操作</th>
   </tr>
  </thead>
 </table>
	<!-- 弹出层 -->
	<div hidden id="update_user_div">
		<div class="layui-inline">
			<label class="layui-form-label">操作</label>
			<div class="layui-input-inline">
				<input type="text" name="perm_name" autocomplete="off"
					id="update_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">节点</label>
			<div class="layui-input-inline">
				<input type="text" name="parent_id" autocomplete="off"
					id="update_parent" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">别名</label>
			<div class="layui-input-inline">
				<input type="text" name="perm_code" autocomplete="off"
					id="update_code" class="layui-input">
			</div>
		</div>
	</div>
	
	
	<div  hidden id="insert_user_div">
		<div class="layui-inline">
			<label class="layui-form-label">id</label>
			<div class="layui-input-inline">
				<input type="text" name="perm_id" autocomplete="off"
					id="insert_id" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">操作</label>
			<div class="layui-input-inline">
				<input type="text" name="perm_name" autocomplete="off"
					id="insert_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">父节点</label>
			<div class="layui-input-inline">
				<input type="text" name="parent_id" autocomplete="off"
					id="insert_parent" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">别名</label>
			<div class="layui-input-inline">
				<input type="text" name="perm_code" autocomplete="off"
					id="insert_code" class="layui-input">
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
			var checkid = checkdata.perm_id;
			var $ = layui.jquery;
			var form = layui.form;
			if (obj.event === "delete_item") {
				layer.confirm('确定要对姓名为'+checkdata.perm_name+'进行删除处理吗？',{
					icon:3,
					title:'提示'
				},function(){
					$.post("delete_perm",{
						"perm_id":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("permission");
					});
					layer.close();
				})
			} else if (obj.event === "update_item") {
				//var checkdata = table.checkStatus('user').data;
				$("#update_name").val(checkdata.perm_name);
				$("#update_parent").val(checkdata.parent_id);
				$("#update_code").val(checkdata.perm_code);
				form.render();
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_user_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("update_perm",{
							"perm_id" : checkid,
							"perm_name" : $("#update_name").val(),
							"parent_id" : $("#update_parent").val(),
							"perm_code" : $("#update_code").val(),
						},function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("permission");
						});
					}
				})
			}
			
		});

		function user_insert(){
		var checkdata = table.checkStatus('permission').data;
				//已选中
				//获取ID值
				//var checkid = checkdata[0].user_id;
				layer.open({
					title : "增加信息",
					type : 1,
					content : $("#insert_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("insert_perm", {
							"perm_id" :$("#insert_id").val() ,
							"perm_name" : $("#insert_name").val(),
							"parent_id" : $("#insert_parent").val(),
							"perm_code" : $("#insert_code").val(),
						}, function() {
							layer.closeAll();
							layer.msg("添加成功");
							table.reload("permission");
						});
					}
				});
		}
		function user_sel(){
			var checktext = $("#checktext").val();
				table.reload("permission",{
					url:"select_perm",
					where:{
						"checktext":checktext
			}
	});
};
		
		function user_refresh(){
			var checktext = $("#checktext").val();
			window.location.href = "perm"
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
// 		layui.use('form', function () {
// 		     var $ = layui.jquery, form = layui.form;
// 		     $.ajax({
// 		       type: 1,
// 		       url: "updateUser",
// 		       data: {},
// 		       async: true,
// 		       dataType: "json",
// 		       success: function (data) {
// 		         $("input[name=sex][value=1]").attr("checked", data.sex == 1 ? true : false);
// 		         $("input[name=sex][value=0]").attr("checked", data.sex == 0 ? true : false);
// 		         form.render(); //更新全部         
// 		       }
// 		      })
// 		    });
		     
	</script>
</body>
</html>