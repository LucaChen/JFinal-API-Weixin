<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Landing Page | Robots and Smart factory Labs</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<style>
.get {
	background: #1E5B94;
	color: #fff;
	text-align: center;
	padding: 100px 0;
}

.get-title {
	font-size: 200%;
	border: 2px solid #fff;
	padding: 20px;
	display: inline-block;
}

.get-btn {
	background: #fff;
}

.detail {
	background: #fff;
}

.detail-h2 {
	text-align: center;
	font-size: 150%;
	margin: 40px 0;
}

.detail-h3 {
	color: #1f8dd6;
}

.detail-p {
	color: #7f8c8d;
}

.detail-mb {
	margin-bottom: 30px;
}

.hope {
	background: #0bb59b;
	padding: 50px 0;
}

.hope-img {
	text-align: center;
}

.hope-hr {
	border-color: #149C88;
}

.hope-title {
	font-size: 140%;
}

.about {
	background: #fff;
	padding: 40px 0;
	color: #7f8c8d;
}

.about-color {
	color: #34495e;
}

.about-title {
	font-size: 180%;
	padding: 30px 0 50px 0;
	text-align: center;
}

.footer p {
	color: #7f8c8d;
	margin: 0;
	padding: 15px 0;
	text-align: center;
	background: #2d3e50;
}
</style>
</head>
<body>
	<header class="am-topbar am-topbar-fixed-top">
	<div class="am-container">
		<h1 class="am-topbar-brand">
			<a href="#">机器人与智慧工厂实验室</a>
		</h1>

		<button
			class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-secondary am-show-sm-only"
			data-am-collapse="{target: '#collapse-head'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
		</button>

		<div class="am-collapse am-topbar-collapse" id="collapse-head">
			<ul class="am-nav am-nav-pills am-topbar-nav">
				<li class="am-active"><a href="#">首页</a></li>
				<li><a href="#">项目</a></li>
				<li class="am-dropdown" data-am-dropdown><a
					class="am-dropdown-toggle" data-am-dropdown-toggle
					href="javascript:;"> 资料库 <span class="am-icon-caret-down"></span>
				</a>
					<ul class="am-dropdown-content">
						<li><a href="#">1. 参考资料</a></li>
						<li><a href="http://10.66.15.10:5000/sharing/rL0MbCrJ1">2.
								网盘</a></li>
						<li><a href="#">3. 友情链接</a></li>
						<li><a href="#">4. 课程资料</a></li>
					</ul></li>
				<li><a href="#">加入我们</a></li>
			</ul>

			<div class="am-topbar-right">
				<button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm">
					<a href="login.jsp"><span class="am-icon-pencil"></span> 登陆</a>
				</button>
			</div>

			<div class="am-topbar-right">
				<button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">
					<a href="/register"><span class="am-icon-user"></span> 注册</a>
				</button>
			</div>
		</div>
	</div>
	</header>

	<div class="get">
		<div class="am-g">
			<div class="am-u-lg-12">
				<h1 class="get-title">第一届创客大赛 - 与科技的对话</h1>

				<p>期待你的参与，共同享受科技带来的美</p>

				<p>
					<a href="http://form.mikecrm.com/f.php?t=kPFRqA"
						class="am-btn am-btn-sm get-btn">参加报名</a>
				</p>
			</div>
		</div>
	</div>

	<div class="detail">
		<div class="am-g am-container">
			<div class="am-u-lg-12">
				<h2 class="detail-h2">3D打印机、无人机，期待和你一起去实现!</h2>
				<div class="am-g">
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">

						<h3 class="detail-h3">
							<i class="am-icon-cloud-download am-icon-sm"></i> 云计算
						</h3>
						<p class="detail-p">
							实验室引进美国PTC的ThingWorx云平台，ThingWorx可以提供可视性连接平台，物联网设备、传感器再到实际业务系统和操作人员联系起来，把人、系统、物体三者合一。
						</p>
					</div>
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-gears  am-icon-sm"></i> 工业4.0
						</h3>
						<p class="detail-p">
							实验室是西门子的全球教育的合作伙伴，积极推进工业物联网的建设和落地，为工业物联网的未来培养人才。使工厂实现全部的自动化和部分信息化。
						</p>
					</div>
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-mobile-phone am-icon-sm"></i> 移动互联网
						</h3>

						<p class="detail-p">实验室与Google展开广泛的合作，Google对实验室的建设和资源倾斜。</p>
					</div>
					<div class="am-u-lg-3 am-u-md-6 am-u-sm-12 detail-mb">
						<h3 class="detail-h3">
							<i class="am-icon-wifi am-icon-sm"></i> 物联网
						</h3>

						<p class="detail-p">实验室积极推进从互联网到物联网的转型，</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="hope">
		<div class="am-g am-container">
			<div class="am-u-lg-4 am-u-md-6 am-u-sm-12 hope-img">
				<img src="assets/i/examples/landing.png" alt=""
					data-am-scrollspy="{animation:'slide-left', repeat: false}">
				<hr class="am-article-divider am-show-sm-only hope-hr">
			</div>
			<div class="am-u-lg-8 am-u-md-6 am-u-sm-12">
				<h2 class="hope-title">同我们一起寻找自己的爱好</h2>

				<p>实验室 崇尚开放、自由，非常欢迎大家的参与建设</p>
			</div>
		</div>
	</div>

	<div class="about">
		<div class="am-g am-container">
			<!--<div class="am-u-lg-12">
      <h2 class="about-title about-color">实验室 崇尚开放、自由，非常欢迎大家的参与建设</h2>-->

			<div class="am-g">
				<div class="am-u-lg-6 am-u-md-4 am-u-sm-12">
					<div class="jd-container">
						<img src="assets/i/img-1.jpg" alt=""
							data-am-scrollspy="{animation:'slide-left', repeat: false}"
							width="460" height="400">
					</div>

					<hr class="am-article-divider am-show-sm-only">
				</div>

				<div class="am-u-lg-6 am-u-md-8 am-u-sm-12">
					<h4 class="about-color">关于实验室</h4>

					<p>学院机器人与智慧工厂联合实验室始建于2014年4月，位于于计算机与计算科学学院所在的理工科4号楼。
						实验室以计算机应用、工业设计和机电一体化技术为核心，是一个学科交叉性的研究实验室。在这个实验室里，同学们在老师的引导下可以动手创造属于自己的“大白”，每个人都能成为自己小小梦想的创造者。学院以培养复合型、应用型、创新型人才为目标，机器人与智慧工厂联合实验室也将在人才培养方面发挥重要作用。</p>
					<h4 class="about-color">团队介绍</h4>

					<p>实验室下属Ubibots机器人社团，社团依靠实验室的资源，培养学生的兴趣。让同学们接触到的不是严肃的研发项目，而是极具动手创造性的启发性兴趣课程。能够让大家开阔眼界，明白外面的世界有精彩。社团和实验室之间的相互交流、协作能共同推进智慧工厂和机器人实验室的进步。</p>
				</div>
			</div>
		</div>
	</div>
	</div>

	<footer class="footer">
	<p>
		© 2016 <a href="http://www.yunshipei.com" target="_blank">Robots
			and Smart factory Labs</a> . by the Ubibots association.
	</p>
	</footer>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>
</body>
</html>