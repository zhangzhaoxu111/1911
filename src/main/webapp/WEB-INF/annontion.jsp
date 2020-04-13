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
<title>批注管理</title>

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
  <button class="layui-btn " lay-event="selete_item"  onclick="annon_sel()"><i class="layui-icon">&#xe615;</i> 查询</button>
  <button class="layui-btn data-method="offset" data-type="auto"  onclick="user_insert()"><i class="layui-icon">&#xe654;</i> 新增</button>
  
 <button class="layui-btn layui-btn-warm" lay-event="Refresh_item" onclick="user_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>
</script>

 <script type="text/html" id="rowbar1">
<button class="layui-btn layui-btn-warm" lay-event="delete_item"><i class="layui-icon">&#x1007;</i>删除</button>
<button class="layui-btn " lay-event="update_item"><i class="layui-icon">&#xe642;</i>修改</button>

</script>
 <table class='layui-table'
  lay-data="{url:'annon_select',toolbar:'#userlist_bar',id:'annontion' ,page:true,method:'post'}"
  lay-filter="usertable">
  <thead>
   <tr>
    <th lay-data="{type:'checkbox'}"></th>
    <th lay-data="{field:'annontion_id'}" >id</th>
    <th lay-data="{field:'annontion_visit_id'}">客户</th>
    <th lay-data="{field:'annontion_user_id'}">经理</th>
    <th lay-data="{field:'annontion_time'}">批注时间</th>
    <th lay-data="{field:'annontion_info'}">批注内容</th>
    <th lay-data="{toolbar:'#rowbar1'}">操作</th>
   </tr>
  </thead>
 </table>
	<!-- 弹出层 -->
	<form action="" class="layui-form" method="post">
	<div  hidden id="update_user_div">
<!-- 		<div class="layui-inline"> -->
<!-- 			<label class="layui-form-label">批注时间</label> -->
<!-- 			<<div class="layui-input-inline"> -->
<!-- 				<input type="text" name="annontion_time" autocomplete="off" -->
<!-- 					id="update_time" class="layui-input"> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="layui-inline">
			<label class="layui-form-label">批注内容</label>
			<div class="layui-input-inline">
				<textarea  style="height: 120px;width: 400px;margin-left: 30px" name="visit_info" autocomplete="off"
					id="update_info" class="layui-textarea"></textarea>
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
			var checkid = checkdata.annontion_id;
			if (obj.event === "delete_item") {
				layer.confirm('确定要对客户为'+checkdata.annontion_visit_id+'进行删除处理吗？',{
					icon:3,
					title:'提示'
				},function(){
					$.post("del_annon",{
						"annontion_id":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("annontion");
					});
					layer.close();
				})
			} else if (obj.event === "update_item") {
				//$("#update_time").val(checkdata.annontion_time);
				$("#update_info").val(checkdata.annontion_info);
				layer.open({
					title:"修改信息",
					area :["500px","300px"],
					type:1,
					content:$("#update_user_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("upd_annon",{
							"annontion_id" : checkid,
							//"annontion_time" : $("#update_time").val(),
							"annontion_info" : $("#update_info").val(),
						},function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("annontion");
						});
					}
				})
			}
			
		});
// 查询
		function annon_sel(){
			var checktext = $("#checktext").val();
				table.reload("annontion",{
					url:"select_annontion",
					where:{
						"checktext":checktext
			}
	});
};
// 		刷新
		function user_refresh(){
			var checktext = $("#checktext").val();
			window.location.href = "annontion"
		};

	</script>
</body>
</html>