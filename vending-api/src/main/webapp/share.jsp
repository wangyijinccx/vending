<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=640,user-scalable=no">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>邀请徒弟</title>
<style>
* {
	text-shadow: none !important;
}

a {
	text-decoration: none;
}

body {
	font-family: "Microsoft YaHei", sans-serif;
	background: url(img/s1.png);
}

body, p {
	margin: 0;
	padding: 0;
}

p {
	font-size: 20px;
	color: #FFF;
}

.banner {
	position: relative;
	height: 180px;
	text-align: center
}

.main {
	margin: 0 auto;
	padding-top: 30px;
	width: 640px;
}

.msg {
	position: relative;
	padding-top: 20px;
	height: 500px;
	background: url(img/s2.png) no-repeat center;
	background-size: 90% 70%;
}

.msg a {
	float: left;
	width: 100%;
	height: 100%;
	padding-top: 0px;
	text-align: center;
	color: #581139;
	font-size: 30px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: bold;
}

.btn_box {
	margin-bottom: 0px;
	height: 280px;
	background: url(images/index_share/two.png) no-repeat center top;
	background-size: 70% 100%;
}

.btn_box a {
	float: left;
	width: 100%;
	height: 220px;
	padding-top: 0px;
	text-align: center;
	color: #581139;
	font-size: 30px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: bold;
}

.code_box {
	text-align: center;
	margin-bottom: 30px;
}

.code_box p {
	margin-bottom: 10px;
}

.code_txt {
	display: inline-block;
	padding: 24px 44px;
	border: 3px dashed #FFF;
	background: #8B4513;
	color: #fff;
	font-size: 40px;
}

#code {
	display: block;
	-webkit-user-select: all;
	-moz-user-select: all;
	user-select: all;
}

.tips {
	text-align: center;
	font-size: 20px;
}

.dot {
	display: inline-block;
	margin-right: 5px;
	width: 30px;
	height: 30px;
	background: #FFF;
	text-align: center;
	font-size: 20px;
	line-height: 30px;
	color: #FD264A;
	border-radius: 50%;
	padding: 2px;
}

#tips {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.7);
}

#tips img {
	position: absolute;
	top: 0;
	right: 40px;
	width: 370px;
	height: auto;
}

.button {
	position: relative;
	height: 60px;
	width: 100%;
	font-family: "Microsoft YaHei", sans-serif;
	font-size: 30px;
	color: #fff;
	text-align: center;
	line-height: 55px;
}
</style>
</head>
<body>
	<div class="main">
		<div class="banner">
			<img src="img/s3.png" style="width: 80%; height: 100%;" />
		</div>
		<div class="msg" style="margin-bottom: 0px"></div>
		<div class="code_box">
			<p>长按邀请码复制</p>
			<div class="code_txt">
				<span id="code">######</span>
			</div>
		</div>
		<div
			style="text-align: center; position: relative; background: url(img/s4.png) no-repeat center; background-size: 90% 100%;">
			<div class="button" onclick="down()">立即下载</div>
		</div>
	</div>

	<div id="tips">
		<img src="img/safari.png" />
	</div>

	<script>
		var codeVal = /(invite|inviteCode)=(\d+)/.exec(window.location.search);
		var code = window.document.getElementById('code');
		if (codeVal)
			code.innerText = codeVal[2];
		var tips = document.getElementById("tips");
		var isWechat = window.location.search.indexOf('iswx=1') >= 0;
		if (!isWechat && /MicroMessenger/i.test(navigator.userAgent)) {
			tips.style.display = 'block';
		}

		function down() {
			var ua = navigator.userAgent.toLowerCase();
			if (/iphone|ipad|ipod/.test(ua)) {
				window.location.href = 'itms-services://?action=download-manifest&url=https://commdown.xiguamei.com/GongHui.plist';
			} else if (/android/.test(ua)) {
				window.location.href = 'https://commdown.xiguamei.com/xiguamei.apk';
			}
		}
	</script>
</body>
</html>
