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
<button class="layui-btn " lay-event="visit_annon">批注详情</button>
</script>
	<table class='layui-table'
		lay-data="{url:'visit_infos?/${customer_id}',toolbar:'#userlist_bar',id:'private',page:true,method:'post'}"
		lay-filter="usertable">
		<thead>
			<tr>
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
	<div hidden id="insert_user_div" >
		<div class="layui-inline">
			<label class="layui-form-label">id</label>
			<div class="layui-input-inline">
				<input type="text" name="customer_id" autocomplete="off" id="insert_id"
					class="layui-input">
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
			<label class="layui-form-label">回访时间</label>
			<div class="layui-input-inline">
        <input type="text" class="layui-input" name="visit_time" id="test1" placeholder="yyyy-MM-dd">
      		</div>
		</div>
<!-- 		<div class="layui-inline" style="margin-top: 20px"> -->
<!-- 			<label class="layui-form-label">回访内容</label> -->
<!-- 			<div class="layui-input-inline"> -->
<!-- 				<select name="visit_info" lay-verify="" id="info"> -->
<!-- 					<option value="">请选择回访内容</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="layui-inline" style="margin-top: 20px">
			<label class="layui-form-label">回访方式</label>
			<div class="layui-input-inline">
				<select name="visit_info" lay-verify="" id="pattern">
					<option value="">请选择回访方式</option>
				</select>
			</div>
		</div>
		<div class="layui-inline" style="margin-top: 20px;">
			<label class="layui-form-label">是否付款</label>
			<div class="layui-input-inline">
				<select name="visit_pay" lay-filter="visit_pay" id="visit_pay">
					<option value="">请选择</option>
					<option value=1>已下单</option>
					<option value=2>考虑中</option>
					<option value=3>拒绝下单</option>
				</select>
			</div>
		</div>
		<div class="layui-inline" style="margin-top: 20px">
			<label class="layui-form-label">付款金额</label>
			<div class="layui-input-inline">
				<input type="text" name="visit_money" autocomplete="off"
					id="insert_money" class="layui-input">
			</div>
		</div>
		<div class="layui-inline layui-form-text" style="margin-top:20px;">
			<label class="layui-form-label">回访内容</label>
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
		var form = layui.form;
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
			var checkid = checkdata.customer_id; //选中行的id
			var checkname = checkdata.customer_name; //选中行的id
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
							table.reload("customer");
						});
					}
				})
				}else if(obj.event === "update_fangqi"){
					var private;
					rate.render({
						  elem: '#private_div'
						  ,choose: function(value){
							  private=value;
						  }
						});
					layer.confirm('确定要放弃' + checkdata.customer_name + '客户吗？', 
						function(){
							$.post("customer_private", {
								"customer_id" : checkid,
								"customer_public" : private
								},function(){
									layer.closeAll();
									layer.msg("放弃成功");
									table.reload("private");
									})
					})
			}else if(obj.event === "update_hf"){
					var checkdata = table.checkStatus('customer').data;
					layer.open({
						title : "增加信息",
						area :["800px","500px"],
						type : 1,
						content : $("#insert_visit_div"),
						btn : [ "保存", "关闭" ],
						btn1 : function() {
							$.post("insert_visit", {
								//"visit_id" :  $("#insert_id").val(),
								"visit_customer_id" : checkname,
								"visit_user_id" : "${login_username}",
								"visit_time" : $("#test1").val(),
								"visit_info" : $("#insert_info").val(),
								"visit_pattern" : $("#pattern").val(),
								"visit_pay" :  $("#visit_pay").val(),
								"visit_money" :  $("#insert_money").val(),
							}, function() {
								layer.closeAll();
								layer.msg("添加成功");
								table.reload("private");
							});
						}
					});
				}else if(obj.event === "visit_infos"){
					location.href = "visit_infos/"+data.cuatomer_id;
					}
		});

		function cus_insert() {
			var checkdata = table.checkStatus('customer').data;
			//	var checkdata = obj.data;
			//已选中
			//获取ID值
			//var checkid = checkdata[0].user_id;
			layer.open({
				title : "增加信息",
				type : 1,
				content : $("#insert_visit_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insert_visit", {
						//"customer_id" :  $("#insert_id").val(),
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
// 回访
// 		function cus_visit() {
// 			var checkdata = table.checkStatus('customer').data;
// 			//	var checkdata = obj.data;
// 			//已选中
// 			//获取ID值
// 			//var checkid = checkdata[0].user_id;
// 			//$("input[name='customer_public'][value='"+checkdata.customer_public+"']").prop("checked","checked");
// 			layer.open({
// 				title : "增加信息",
// 				area :["800px","500px"],
// 				type : 1,
// 				content : $("#insert_visit_div"),
// 				btn : [ "保存", "关闭" ],
// 				btn1 : function() {
// 					$.post("insert_visit", {
// 						//"visit_id" :  $("#insert_id").val(),
// 						//"visit_customer_id" : $("#insert_customer_id").val(),
// 						//"visit_user_id" : $("#insert_user_id").val(),
// 						"visit_time" : $("#test1").val(),
// 						"visit_info" : $("#info").val(),
// 						"visit_pattern" : $("#pattern").val(),
// 						"visit_pay" :  $("#pay").val(),
// 						"visit_money" :  $("#insert_money").val(),
// 					}, function() {
// 						layer.closeAll();
// 						layer.msg("添加成功");
// 						table.reload("private");
// 					});
// 				}
// 			});
// 		}
		function cus_sel() {
			var checktext = $("#checktext").val();
			table.reload("private", {
				url : "select_pr",
				where : {
					"checktext" : checktext
				}
			});
		};

		function user_refresh() {
			var checktext = $("#checktext").val();
			window.location.href = "private"
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

//  		function findAllInfo() {
// 			$(function() {
// 				$.ajax({
// 					type : "post",
// 					url : "findAllInfo",
// 					dataType : "json",
// 					success : function(data) {
// 						$.each(data, function(index, item) {
// 							//console.log(data);
// 							$("#info").append(
// 									"<option value="+item.visit_info+">"
// 											+ item.visit_info + "</option>");
// 							form.render('select');
// 						})
// 						form.render('select');
// 					}
// 				})
// 			})
// 		}
//		findAllInfo();
		function findAllPattern() {
			$(function() {
				$.ajax({
					type : "post",
					url : "findAllPattern",
					dataType : "json",
					success : function(data) {
						$.each(data, function(index, item) {
							//console.log(data);
							$("#pattern").append(
									"<option value="+item.visit_pattern+">"
											+ item.visit_pattern + "</option>");
							form.render('select');
						})
						form.render('select');
					}
				})
			})
		}
		findAllPattern();
// 		下单未下单拒绝下单
		var form = layui.form;
		form.on('select(visit_pay)',function(data){
			console.log(data);
			if(data.value!=1){
			$("#insert_money").attr("style","cursor:not-allowed");
			$("#insert_money").attr("disable","");
			$("#insert_money").attr("readonly","");
			$("#insert_money").val("0");
				}else{
					$("#insert_money").removeAttr("disable");
					$("#insert_money").removeAttr("readonly");
					$("#insert_money").removeAttr("style");
					}
			});
	</script>
</body>
</html>