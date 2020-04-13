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
<title>公海客户</title>
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
<button class="layui-btn " lay-event="update_gendan"><i class="layui-icon">&#xe642;</i>跟单</button>
</script>
	<table class='layui-table'
		lay-data="{url:'select_pub',toolbar:'#userlist_bar',id:'public' ,page:true,method:'post'}"
		lay-filter="usertable">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'customer_id',width:120}">id</th>
				<th lay-data="{field:'customer_name',width:150}">客户</th>
				<th lay-data="{field:'customer_man',width:140}">业务员</th>
				<th lay-data="{field:'customer_tel',width:170}">电话</th>
				<th lay-data="{field:'customer_email',width:240}">邮箱</th>
				<th lay-data="{field:'customer_addr',width:200}">地址</th>
				<th lay-data="{field:'customer_grade',width:200,templet:function(d){
				if(d.customer_grade == 1){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';}
				else if(d.customer_grade == 2){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else if(d.customer_grade == 3){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else if(d.customer_grade == 4){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else if(d.customer_grade == 5){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else{
				return '  ';
				}
				}}">评级</th>
				<th lay-data="{field:'customer_time',width:140}">顾客时间</th>
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
			<label class="layui-form-label">客户</label>
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
<div hidden id="public_div"></div>
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		var layer = layui.layer;
		var laydate = layui.laydate;
		var rate = layui.rate;
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
			var checkid = checkdata.customer_id;
			var form = layui.form;
			if (obj.event === "delete_item") {
				layer.confirm('确定要对姓名为' + checkdata.customer_name + '进行删除处理吗？', {
					icon : 3,
					title : '提示'
				}, function() {
					$.post("delete_cus", {
						"customer_id" : checkid
					}, function() {
						layer.msg("删除成功");
						table.reload("customer");
					});
					layer.close();
				})
			} else if (obj.event === "update_item") {
				$("#update_name").val(checkdata.customer_name);
				$("#update_man").val(checkdata.customer_man);
				$("#update_tel").val(checkdata.customer_tel);
				$("#update_email").val(checkdata.customer_email);
				$("#update_addr").val(checkdata.customer_addr);
				$("input[name='public'][value='"+checkdata.customer_public+"']").prop("checked","checked");
				form.render();
				layer.open({
					title : "修改信息",
					type : 1,
					content : $("#update_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("update_cus", {
							"customer_id" : checkid,
							"customer_name" : $("#update_name").val(),
							"customer_man" : $("#update_man").val(),
							"customer_tel" : $("#update_tel").val(),
							"customer_email" : $("#update_email").val(),
							"customer_addr" : $("#update_addr").val(),
							"customer_public" : $("input[name='public']:checked").val(),
							"customer_time" : $("#test5").val(),
						}, function() {
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("customer");
						});
					}
				})
			}else if(obj.event === "update_grade"){
				var grade;
				rate.render({
					  elem: '#test1'
					  ,choose: function(value){
						  grade=value;
					  }
					});
				//form.render();
				layer.open({
					title : "修改信息",
					type : 1,
					content : $("#test1"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("update_grade", {
							"customer_id" : checkid,
							"customer_grade" : grade
						}, function() {
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("public");
						});
					}
				})
				}else if(obj.event === "update_gendan"){
					var public;
					rate.render({
						  elem: '#public_div'
						  ,choose: function(value){
							  public=value;
						  }
						});
					layer.confirm('确定要跟单' + checkdata.customer_name + '客户吗？', 
						function(){
							$.post("customer_public", {
								"customer_id" : checkid,
								"customer_public" : public,
								"customer_user": "${login_username}",
								},function(){
									layer.closeAll();
									layer.msg("修改成功");
									table.reload("public");
									})
					})
			}
		});

		function cus_insert() {
			var checkdata = table.checkStatus('customer').data;
			//	var checkdata = obj.data;
			//已选中
			//获取ID值
			//var checkid = checkdata[0].user_id;
			$("input[name='customer_public'][value='"+checkdata.customer_public+"']").prop("checked","checked");
			layer.open({
				title : "增加信息",
				type : 1,
				content : $("#insert_user_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insert_cus", {
						"customer_id" :  $("#insert_id").val(),
						"customer_name" : $("#insert_name").val(),
						"customer_man" : $("#insert_man").val(),
						"customer_tel" : $("#insert_tel").val(),
						"customer_email" : $("#insert_email").val(),
						"customer_addr" : $("#insert_addr").val(),
						"customer_public" : $("input[name='customer_public']:checked").val(),
						"customer_time" : $("#test5").val(),
					}, function() {
						layer.closeAll();
						layer.msg("添加成功");
						table.reload("customer");
					});
				}
			});
		}
		function cus_sel() {
			var checktext = $("#checktext").val();
			table.reload("public", {
				url : "select_publi",
				where : {
					"checktext" : checktext
				}
			});
		};

		function user_refresh() {
			var checktext = $("#checktext").val();
			window.location.href = "gonghai"
		};

// 		function jump() {
// 			var checkdata = table.checkStatus('customer').data;
// 			if (checkdata.length > 0) {
// 				//var user_id = checkdata[0].user_id;
// 				window.location.href = 'transfer/' + '';
// 			} else {
// 				layer.msg("未选中数据");
// 			}
// 		}

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