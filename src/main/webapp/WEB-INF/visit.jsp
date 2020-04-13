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
<title>私人客户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
.layui-table-cell {
	height: auto !important;
	white-space: normal;
}
</style>
</head>
<body>
<!-- 	<div id="test1" style="display: none;"></div> -->
	<input class="layui-input"  type="text"
		id="checktext" placeholder="请输入需要查询的数据" />
	<script type="text/html" id="userlist_bar">
  <button class="layui-btn " lay-event="selete_item"  onclick="cus_sel()"><i class="layui-icon">&#xe615;</i> 查询</button>
  <button class="layui-btn data-method="offset" data-type="auto"  onclick="cus_insert()"><i class="layui-icon">&#xe654;</i> 新增</button>
  
 <button class="layui-btn layui-btn-warm" lay-event="Refresh_item" onclick="user_refresh()"><i class="layui-icon">&#xe669;</i>刷新</button>
</script>
<script type="text/html" id="rowbar1">
<button class="layui-btn " lay-event="delete_visit"><i class="layui-icon">&#x1007;</i>删除</button>
<button class="layui-btn " lay-event="update_pizhu"><i class="layui-icon">&#xe642;</i>批注</button>
</script>
	<table class='layui-table'
		lay-data="{url:'select_visit',toolbar:'#userlist_bar',id:'visit',page:true,method:'post'}"
		lay-filter="usertable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'visit_id',width:80}">id</th>
				<th lay-data="{field:'visit_customer_id',width:120}">客户姓名</th>
				<th lay-data="{field:'visit_user_id',width:120}">联系人</th>
				<th lay-data="{field:'visit_time',width:150}">回访时间</th>
				<th lay-data="{field:'visit_info',width:240}">回访内容</th>
				<th lay-data="{field:'visit_pattern',width:100}">回访方式</th>
				<th lay-data="{field:'visit_pay',width:200,templet:function(d){
				if(d.visit_pay == 1){
				return '已付款';
				}else {
				return '未付款';
				}
				}}">支付状态</th>
				<th lay-data="{field:'visit_money',width:200}">支付金额</th>
				<th lay-data="{toolbar:'#rowbar1'}">操作</th>
			</tr>
		</thead>
	</table>
	<!-- 弹出层 -->
	<div hidden id="insert_user_div">
		<div class="layui-inline">
			<label class="layui-form-label">id</label>
			<div class="layui-input-inline">
				<input type="text" name="customer_id" autocomplete="off" id="insert_id"
					class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="customer_name" autocomplete="off"
					id="insert_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">业务员</label>
			<div class="layui-input-inline">
				<input type=text name="customer_man" autocomplete="off"
					id="insert_man" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" name="customer_tel" autocomplete="off" class="layui-input"
					oninput="value=value.replace(/[^\d]/g,'')" maxlength="11"
					id="insert_tel" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-inline">
				<input type="text" name="customer_email" autocomplete="off"
					id="insert_email" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">地址</label>
			<div class="layui-input-inline">
				<input type="text" name="customer_addr" autocomplete="off"
					id="insert_addr" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">公海用户</label>
			<div class="layui-input-inline layui-form">
				 <input type="radio" name="customer_public" id="insert_public" value="1" title="是" >
            <input type="radio" name="customer_public" id="insert_public" value="0" title="否">    
			</div>
		</div>
<div hidden id="private_div"></div>
	</div>
	
	<!-- 弹出层 -->
	<form action="" class="layui-form" method="post">
	<div hidden id="insert_visit_div" >
		<div class="layui-inline" style="margin-top: 20px">
			<label class="layui-form-label">批注时间</label>
			<div class="layui-input-inline">
        <input type="text" class="layui-input" name="visit_time" id="test1" placeholder="yyyy-MM-dd">
      		</div>
		</div>
		<div class="layui-inline layui-form-text" style="margin-top:20px;">
			<label class="layui-form-label">批注内容</label>
			<div class="layui-input-inline">
				<textarea  style="height: 150px;width: 700px;margin-left: 40px" name="visit_info" autocomplete="off"
					id="insert_info" class="layui-textarea"></textarea>
			</div>
		</div>
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		var layer = layui.layer;
		var laydate = layui.laydate;
		var rate = layui.rate;
		var laydate = layui.laydate;
		laydate.render({
			elem:'#test1'
		});
		laydate.render({
			elem : '#test5'
		});
		/* layui.use(['rate'], function(){
			 var rate = layui.rate;
			  //显示文字
			  rate.render({
			    elem: '#test1'
			  });
		} */
		table.on('tool(usertable)', function(obj) {
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.visit_id;
			var form = layui.form;
			var checkid = checkdata.visit_id; //选中行的id
			var checkname = checkdata.visit_customer_id; //选中行的id
			if (obj.event === "delete_visit") {
				layer.confirm('确定要对客户为' + checkdata.visit_customer_id + '进行删除处理吗？', {
					icon : 3,
					title : '提示'
				}, function() {
					$.post("del_visit", {
						"visit_id" : checkid
					}, function() {
						layer.msg("删除成功");
						table.reload("visit");
					});
					layer.close();
				})
			} else if(obj.event === "update_pizhu"){
				var checkdata = table.checkStatus('visit').data;
				layer.open({
					title : "增加信息",
					area :["800px","500px"],
					type : 1,
					content : $("#insert_visit_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("insert_annon", {
							//"visit_id" :  $("#insert_id").val(),
							"annontion_visit_id" : checkname,
							"annontion_user_id" : "${login_username}",
							"annontion_time" : $("#test1").val(),
							"annontion_info" : $("#insert_info").val(),
						}, function() {
							layer.closeAll();
							layer.msg("批注成功");
							table.reload("visit");
						});
					}
				});
			}
		});
// 查询
		function cus_sel() {
			var checktext = $("#checktext").val();
			table.reload("visit", {
				url : "select_visit",
				where : {
					"checktext" : checktext
				}
			});
		};

		function user_refresh() {
			var checktext = $("#checktext").val();
			window.location.href = "visit"
		};

 		layui.use([ 'rate' ], function() {
 			var rate = layui.rate;
 			//基础效果
 			rate.render({
 				elem : '#test1'
 			})
 		});
	</script>
</body>
</html>