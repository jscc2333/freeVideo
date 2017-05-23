<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");
String user_name= request.getParameter("user_name");
String a = "3";
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Free Video</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="./style/reset.css">
	<link rel="stylesheet" type="text/css" href="./style/homepage/fv-header.css">
	<link rel="stylesheet" type="text/css" href="./style/homepage/fv-container.css">
	<link rel="stylesheet" type="text/css" href="./style/homepage/fv-footer.css">
	<link rel="stylesheet" type="text/css" href="./style/homepage/fv-login.css">
	
	
	<script type="text/javascript" src="./script/jquery.js"></script>
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
				<form action="">
					<input type="text" name="" required="required" placeholder="请输入搜索内容">
					<input type="text" style="display:none;">
					<span></span>
				</form>
			</div>
			<div class="fv-header-utility">
				<div class="fv-utility-history">
				</div>
				<div class="fv-utility-upload">
					<a href=""></a>
				</div>
				<div class="fv-utility-login">
					<span class="fv-login-icon"></span>
					<span class="fv-login-text">登录</span>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</header>

	<div class="fv-container">
		<div class="fv-container-leftnav">
			<nav class="fv-leftnav-nav">
				<div>
					<span>精选</span>
					<ul>
						<li><span></span><a href="#hot">  热点视频</a></li>
						<li><span></span><a href="#music">  音乐</a></li>
						<li><span></span><a href="#entair">  娱乐</a></li>
						<li><span></span><a href="#game">  游戏</a></li>
						<li><span></span><a href="#movie">  电影</a></li>
						<li><span></span><a href="#news">   新闻</a></li>
						<li><span></span><a href="#comic">  动画</a></li>
					</ul>
				</div>
			 </nav>	
		</div>
		<div class="fv-container-content">
			<div class="fv-content-banner">
				<ul>
					<li><a href="vediopage.jsp?videoId=<%="00001"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-bannerImg1.jpg" alt=""></a></li>
					<li><a href="vediopage.jsp?videoId=<%="00002"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-bannerImg2.jpg" alt=""></a></li>
					<li><a href="vediopage.jsp?videoId=<%="00003"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-bannerImg3.jpg" alt=""></a></li>
					<li><a href="vediopage.jsp?videoId=<%="00004"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-bannerImg4.jpg" alt=""></a></li>
					<li><a href="vediopage.jsp?videoId=<%="00005"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-bannerImg5.jpg" alt=""></a></li>
				</ul>
			</div>
			<div class="fv-content-hot" id="hot">
				<div>
					<div class="fv-hot-left">
						<a href="vediopage.jsp?videoId=<%="00006"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-hotImg1.jpg"></a>
					</div>
					<div class="fv-hot-right fv-video-container">
						<a href="vediopage.jsp?videoId=<%="00006"%>" class="video" target="_blank">Enjoy Surface Laptop</a>
						<p>Microsoft Win10 S Lens Surface Laptop Video Tour: Fall in love at first sight</p>
						<div class="fv-vedio-message">
							<span></span>
							<p class="fv-vedio-viewTimes">观看次数<b></b></p>
							<p class="fv-vedio-uploadtime"></p>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div>
					<div class="fv-hot-left">
						<a href="vediopage.jsp?videoId=<%="00007"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-hotImg2.jpg"></a>
					</div>
					<div class="fv-hot-right fv-video-container">
						<a href="vediopage.jsp?videoId=<%="00007"%>" class="video" target="_blank">局座鬼畜</a>
						<p>我上舰是我特长，我拍片是为了科学</p>
						<div class="fv-vedio-message">
							<span></span>
							<p class="fv-vedio-viewTimes">观看次数<b></b></p>
							<p class="fv-vedio-uploadtime"></p>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div>
					<div class="fv-hot-left">
						<a href="vediopage.jsp?videoId=<%="00008"%>" class="video" target="_blank"><img src="./image/container-img/fv-content-hotImg3.jpg"></a>
					</div>
					<div class="fv-hot-right fv-video-container">
						<a href="vediopage.jsp?videoId=<%="00008"%>" class="video" target="_blank">Dangal,acted by Aamir Khan</a>
						<p>According to the real event adaptation of the film,a film Reflecting the Indian feminist issue</p>
						<div class="fv-vedio-message">
							<span></span>
							<p class="fv-vedio-viewTimes">观看次数<b></b></p>
							<p class="fv-vedio-uploadtime"></p>
						</div>
					</div>
					<div class="clear"></div>	
				</div>		
			</div>
			<div class="clear"></div>
			<div class="fv-content-video">
				<div id="music">
					<div class="fv-vedio-head">
						<span>音乐</span>
					</div>
					<div class="fv-vedio-body">
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00009"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-musicImg1.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00009"%>" class="video" target="_blank">Blank Space -  Taylor Swift</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00010"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-musicImg2.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00010"%>" class="video" target="_blank">Venus & Mars - Eliane Müller</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00021"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-musicImg3.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00021"%>" class="video" target="_blank">Christopher-HeartBeat</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00022"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-musicImg4.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00022"%>" class="video" target="_blank">金玟岐-岁月神偷</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="entair">
					<div class="fv-vedio-head">
						<span>娱乐</span>
					</div>
					<div class="fv-vedio-body">
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00011"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-entairImg1.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00011"%>" class="video" target="_blank">Ellen Show</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00012"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-entairImg2.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00012"%>" class="video" target="_blank">暴走大事件，青少年必备神器《滴滴专掐》发布</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00023"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-entairImg3.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00023"%>" class="video" target="_blank">If Google Was A Guy</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00024"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-entairImg4.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00024"%>" class="video" target="_blank">Why Is THIS Trending</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="game">
					<div class="fv-vedio-head">
						<span>游戏</span>
					</div>
					<div class="fv-vedio-body">
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00013"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-gameImg1.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00013"%>" class="video" target="_blank">《尼尔：机械纪元》宣传片</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00014"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-gameImg2.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00014"%>" class="video" target="_blank">国产独立工作室佳作：Another Adventure</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00025"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-gameImg3.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00025"%>" class="video" target="_blank">Call of Duty®: Black Ops III Zombies Chronicles Story Trailer</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00026"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-gameImg4.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00026"%>" class="video" target="_blank">OutLast 2 Trailer</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="movie">
					<div class="fv-vedio-head">
						<span>电影</span>
					</div>
					<div class="fv-vedio-body">
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00015"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-movieImg1.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00015"%>" class="video" target="_blank">一个叫欧维的男人决定去死 En man som heter Ove</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00016"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-movieImg2.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00016"%>" class="video" target="_blank">逃出绝命镇  GET OUT</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00027"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-movieImg3.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00027"%>" class="video" target="_blank">SPIDER-MAN: Homecoming NEW Clip & Trailer</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00028"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-movieImg4.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00028"%>" class="video" target="_blank">DEADPOOL 2</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="news">
					<div class="fv-vedio-head">
						<span>新闻</span>
					</div>
					<div class="fv-vedio-body">
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00017"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-newsImg1.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00017"%>" class="video" target="_blank">WH denies Trump shared classified information with Russian officials</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00018"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-newsImg2.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00018"%>" class="video" target="_blank">Is North Korea planning an EMP attack against the U.S.?</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00029"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-newsImg3.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00029"%>" class="video" target="_blank">Yates: Russians had real leverage over Flynn</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00030"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-newsImg4.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00030"%>" class="video" target="_blank">Macron meets Merkel to push EU reform idea</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="comic">
					<div class="fv-vedio-head">
						<span>动画</span>
					</div>
					<div class="fv-vedio-body">
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00019"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-comicImg1.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00019"%>" class="video" target="_blank">Bojack Horseman s03e12</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00020"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-comicImg2.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00020"%>" class="video" target="_blank">龙珠超 力量大会篇</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00031"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-comicImg3.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00031"%>" class="video" target="_blank">Boruto: Naruto The Movie New Trailer</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
						<div class="fv-vedio-detail fv-video-container">
							<div>
								<a href="vediopage.jsp?videoId=<%="00032"%>" class="video" target="_blank"><img src="./image/container-img/fv-vedio-comicImg4.jpg"></a>
								<p><a href="vediopage.jsp?videoId=<%="00032"%>" class="video" target="_blank">Adventure Time</a></p>
								<div class="fv-vedio-message">
									<span></span>
									<p class="fv-vedio-viewTimes">观看次数<b></b></p>
									<p class="fv-vedio-uploadtime"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="clear"></div>
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
