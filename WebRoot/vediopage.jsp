<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String user = request.getParameter("user");
if(user == null){
	user = "登录";
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>VideoDetail</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="./style/reset.css">
	<link rel="stylesheet" type="text/css" href="./style/videopage/fv-header.css">
	<link rel="stylesheet" type="text/css" href="./style/videopage/fv-layout.css">
	<link rel="stylesheet" type="text/css" href="./style/videopage/fv-footer.css">	
	<link rel="stylesheet" type="text/css" href="./style/homepage/fv-login.css">	
	
	<script type="text/javascript" src="./script/jquery.js"></script>
	<script type="text/javascript" src="./script/video.js"></script>
	<script type="text/javascript" src="./script/home.js"></script>
	<script type="text/javascript" src="./script/util.js"></script>
  </head>
  
  <body>
    <header>
		<div class="fv-header-box">
			<div class="fv-header-logo">
				<a href="index.jsp">FreeVideo</a>
			</div>
			<div class="fv-header-search">
				<form>
					<input type="text" name="" required="required" placeholder="请输入搜索内容">
					<input type="text" style="display:none;">
					<span></span>
				</form>
			</div>
			<div class="fv-header-utility">
				<div class="fv-utility-history">
					<a href=""></a>
				</div>
				<div class="fv-utility-upload">
					<a href=""></a>
				</div>
				<div class="fv-utility-login">
					<span class="fv-login-icon"></span>
					<span class="fv-login-text"><%=user%></span>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</header>

	<div class="fv-main-layout">
			<div class="fv-layout-video">
				<div class="fv-video-base">
					<h1></h1>
					<div class="fv-base-viewTimes">
						<span></span>
						<p></p>
					</div>
					<div class="clear"></div>
				</div>
				<div class="fv-video-playarea">
					<video id="video" controls="controls">
						<source src="" type="">
						你的浏览器不支持HTML5播放器
					</video>
				</div>
				
				<div class="fv-video-des">
					<p></p>
			</div>
			
			
			<div class="fv-layout-comment">
				<div class="fv-comment-publish">
					<div class="fv-publish-title">
						<strong>网友评论</strong>
						<span>文明上网理性发言</span>
						<a href="">所有评论</a>
					</div>
					<div class="fv-publish-content">
						<div class="fv-content-area">
							<textarea></textarea>
						</div>
						<div class="fv-content-sub">
							<div class="fv-sub-btn">
								<button value="comment">评论</button>
							</div>
						</div>
					</div>
				</div>
				<div class="fv-comment-all">
					<h1>全部评论</h1>
					<div>
						<ul>
						</ul>
					</div>
					<div class="fv-all-page">
						<span name="next">下一页</span>
						<span name="pre">上一页</span>
					</div>	
				</div>
			</div>
	</div>
	<footer>
		<div>
			<div class="fv-footer-follow">
				<a href="#" class="fv-footer-microblog"></a>
				<a href="#" class="fv-footer-wechat"></a>
				<a href="#" class="fv-footer-twitter"></a>
				<a href="#" class="fv-footer-facebook"></a>
			</div>
			<div class="fv-footer-contact">
				<a href="#">联系我们</a>
				<a href="#">常见问题</a>
				<a href="#">意见反馈</a>
				<a href="#">友情链接</a>
			</div>
			<div class="fv-footer-copyright">copyright © 2007-????,Video,All Rights Reserved</div>
		</div>	
	</footer>
  </body>
</html>
