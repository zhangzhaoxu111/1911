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
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link rel="icon" href="img/mi.png">
<title>注册界面</title>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
<div class="cheng">
		<div class="deng">
			<div class="tu_gai" style="width: 100px">
				<a href="zhuce1"><img src="img/wangyi.png" ></a>
			</div>
		</div>	
			<div class="shangcheng">
				<a href="index.html"><span class="sc_zt"></span></a>
			</div>
			<div class="lequ">
				<a href="index.html"><small class="keji"></small></a>
			</div>
	</div>
	<div  onSubmit="return form_sub()">
	<div class="liusuping">
		<div class="denglu_tu">
			<a href="zhuce1"><img src="img/zhu2.jpg" ></a>
		
		<div class="zhanghao">
				
		<div class="zh_dl">
			<a href="#"><span class="zh_dl_zt">欢迎注册网易邮箱</span></a>
		</div>	
		<form action="zhuce_user" method='post'>
		<div class="in_1">
			<input type="text" name="username" placeholder="     用户名" id="username" style="height: 60px; width: 470px"/>
		</div>
		<br><br>
		<div class="in_2">
			<input type="text" name="useremail" placeholder="     邮箱" id="useremail" style="height: 60px; width: 470px"/>
		</div>
		<br><br>
			
		<div class="anniu">
			<a href="#"><input type="submit" value="注册" style="color:white;font-size:20px;background-color:#165DD1;height: 70px; width: 470px;border: 0"/></a>
		<br>
		</div>
		</form>
<!-- 		<div class="duanxin"> -->
<!-- 			<a href="#"><span class="sj_dx">手机短信登录/注册</span></a> -->
<!-- 		</div> -->
<!-- 		<div class="wangjimima"> -->
<!-- 			<a href="#"><span class="mima">立即注册 | 忘记密码？</span></a> -->
<!-- 		</div> -->
<!-- 		<div class="qita"> -->
<!-- 			<span class="fangshi">——————————其他方式登录——————————</span> -->
<!-- 		</div> -->
<!-- 		<div class="sige"> -->
<!-- 			<ul class="geng"> -->
				
<!-- 			<li><a href="#"><div class="QQ"><img src="img/QQ.gif" ></div></a></li> -->
<!-- 			<li><a href="#"><div class="weibo"><img src= "img/weibo.gif"></div></a></li> -->
<!-- 			<li><a href="#"><div class="zhifubao"><img src="img/zhifubao.gif" ></div></a></li> -->
<!-- 			<li><a href="#"><div class="weixin"><img src="img/weixin.gif" ></div></a></li> -->
				
<!-- 			</ul> -->
<!-- 		</div> -->
		</div>
		
	</div>
	</div>
	</div>
			<div class="footer_f">
					<ul class="f_f">
						<li class="li">
							<a href="#">简体</a>
						</li>
						<li>|</li>
						<li>
							<a href="#">繁体</a>
						</li>
						<li>|</li>
						<li>
							<a href="#">English</a>
						</li>
						<li>|</li>
						<li>
							<a href="#">常见问题</a>
						</li>
						<li>|</li>
						<li>
							<a href="#">隐私政策</a>
						</li>
					</ul>
					<div class="jing_j">
						<span class="jing_zt">小米公司版权所有-京ICP备10046444-	  <img src="img/ghs.png" >   公网安备11010802020134号 京ICP证110507号</span>
					</div>
			</div>
</body>
</html>