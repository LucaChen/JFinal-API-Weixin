<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>register Page | Robots and Smart factory Labs</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<style>
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="am-g">
			<h1>机器人与智慧工厂实验室--实验室器材管理系统</h1>
		</div>
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h3>注册</h3>
			<hr>

			<br>

			<form method="post" class="am-form">
				<label for="email">邮箱:</label> <input type="email" name=""
					id="email" value=""> <br> <label for="password">密码:</label>
				<input type="password" name="" id="password" value=""> <br>
				<label for="password-2">重复密码</label> <input type="email"
					name="password-2" id="password-2" value=""> <br> <label
					for="name">昵称</label> <input type="email" name="name" id="name"
					value=""> <br> <label for="truename">真实姓名</label> <input
					type="email" name="name" id="truename" value=""> <br>
			</form>
			<button type="button" class="am-btn am-btn-primary"
				data-am-modal="{target: '#my-alert'}">Alert</button>

			<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
				<div class="am-modal-dialog">
					<div class="am-modal-hd">Amaze UI</div>
					<div class="am-modal-bd">Hello world！</div>
					<div class="am-modal-footer">
						<span class="am-modal-btn">确定</span>
					</div>
				</div>
			</div>
			<hr>
			<p>© 2016 Robots and Smart Factory Labs.</p>
		</div>
	</div>
</body>
</html>