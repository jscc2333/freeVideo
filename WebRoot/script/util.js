	$(function(){
		$login = $('.fv-utility-login');
		$login.on('click',function(){
			var loginHtml = '<div class="fv-login">' +
				'<form>' +
					'<ul>' +
						'<li>' +
							'<label for="name">用户名:</label><input type="text" id="name" required="required"  placeholder="输入用户名">' +
						'</li>' +
						'<li>' +
							'<label for="password">密码:</label><input type="password" id="password" required="required" placeholder="输入至少6位数的密码">' +
						'</li>' +
						'<li>' +
							'<input type="button" id="confirm" value="登录"><input type="button" id="regist" value="注册"><input type="button" id="cancel" value="取消">' +
						'</li>' +
					'</ul>' +
					'<input type="text" style="display:none;">'+
				'</form>' +
			'</div>';
			$('body').append(loginHtml);
			$('#name').focus();
			$login.css("pointer-events","none");
			$('.fv-login input[type=button]').on('click',onClickButton);
			$('.fv-login input').on('keyup',function(e){
				if(e.which == 13){
					onClickButton(undefined,'登录')
					}
			}); 	
		});
		var user_name = sessionStorage.getItem('name');
		var user_password = sessionStorage.getItem('password');
		if(user_name != null && user_name != '' && user_password != null && user_password != ''){
			$.ajax({
				url: 'servlet/login',
				type: 'POST',
				dataType: 'json',
				data: 
				{
					"value" :"1",
					"user_name" : user_name,
					"user_password":user_password
				}
			})
			.done(function(data) {
				array = data.split('&');
				message = array.shift();
				console.log(message);	
				messageAction(message,user_name);
				recordLoad(user_name,array);
				console.log("success");
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
		}
	});

	var onClickButton = function(event,val){
		var
			user_name,user_password,value;
			if(event == undefined){
				value = val;
			}
			else{
				value = event.target.value;
			}
			console.log(value);
			$name = $('#name'),
			$password = $('#password'),
			console.log(user_name+''+user_password);
			message = '',
			array = '',
			record = [],
			recordId = [];
		user_name = $name.val();
		user_password = $password.val();
		var name = sessionStorage.setItem("name",user_name);
		var password = sessionStorage.setItem("password",user_password);
		switch(value){
			case '登录':
				$.ajax({
					url: 'servlet/login',
					type: 'POST',
					dataType: 'json',
					data: 
					{
						"value" :"1",
						"user_name" : user_name,
						"user_password":user_password
					}
				})
				.done(function(data) {
					array = data.split('&');
					message = array.shift();
					messageAction(message,user_name);
					recordLoad(user_name,array);				
					console.log("success");
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
				break;
			case '注册':
				if(user_name=="" || user_password==""){
					console.log("here");
					
				}else{
					$.ajax({
						url: 'servlet/login',
						type: 'POST',
						dataType: 'json',
						data: 
						{
							"value" : "2",
							"user_name" : user_name,
							"user_password":user_password
						}
					})
					.done(function(data) {
						$('.fv-login').remove();
						console.log(data);
						console.log("success");
					})
					.fail(function() {
						console.log("error");
					})
					.always(function() {
						console.log("complete");
					});
					$('.fv-utility-login').css("pointer-events","auto");		
					}				
				break;
			case '取消':
				$('.fv-login').remove();
				$('.fv-utility-login').css("pointer-events","auto");
				break;
			default:
				break;
		}
	};
	var setUser = function(user_name){
		$video = $('.video');
		$video.each(function(){
			var oldHref = $(this).prop('href');
			var newHref = oldHref + "&user="+user_name;
			$(this).prop('href',newHref);
		});		
	}
	var messageAction = function(message,name){
		$loginForm = $('.fv-login');
		$login = $('.fv-utility-login');
		switch(message){
		case "密码正确":
			$loginForm.remove();
			$login.find('.fv-login-text').text(name).addClass('online');
			$login.css("pointer-events","none");
			if(window.location.href.indexOf("user")<0){
				if(window.location.href.indexOf("videoId")<0){
					window.location.href = window.location.href+"?user="+name;
				}else{
					window.location.href = window.location.href+"&user="+name;
				}
				
			}
			setUser(name);
			historyLoad();
			$('.fv-login').remove();
			break;
		case "用户密码不正确":
			$loginForm.find('#password').val('')
										.addClass('wrong')
										.attr('placeholder','密码错误')
										.focus(function(){
											$('#password').removeClass('wrong')
													.attr('placeholder','输入至少6位数的密码');
										});
			break;
		case "当前用户名不存在":
			$loginForm.find('#name').val('')
									.addClass('wrong')
									.attr('placeholder','用户名不存在')
									.focus(function(){
										$('#name').removeClass('wrong')
												.attr('placeholder','输入用户名');
									});
			break;
		}
	};
	
	var recordLoad = function(user,array){
		record = array.slice(0,array.length/2-1);
		recordId = array.slice(array.length/2,array.length-1);
//		console.log(record);
		var $hisShow = $('.fv-history-show ul');
		$.each(record,function(index,value){
//			console.log(index);
			let $li = '<li><a href="vediopage.jsp?videoId='+recordId[index]+'&user='+user+'">'+value+'</a></li>';
			$hisShow.append($li);
			$('.fv-history-show ul').find('a').eq(index).on('click',function(){
				var href = $(this).attr('href');
				var index = href.indexOf('videoId');
				console.log(index);
				var videoId = '';
				if(href.indexOf("user") != -1){
					videoId = href.slice(index+8,index+13);
				}
				else{
					videoId = href.slice(index+8);
				}
				console.log(videoId);
				var $user = $('.online');	
				var user_name = "";
				if($user.length > 0){	
					user_name = $user.text();
				}
				console.log(user_name + videoId);
				$.ajax({
					url: 'servlet/VideoView',
					type: 'POST',
					dataType: 'json',
					data: {
						"videoId": videoId,
						"user_name":user_name
					}
				})
				.done(function(data){
					console.log("sucess")
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
			
			})
		});		
	};
	var historyLoad = function(){
		var $history = $('.fv-utility-history'),
			hisHtml = '<div class="fv-history-show">' +
							'<ul>' +
							'</ul>' +
						'</div>';
		if($('.fv-history-show').length>0){
			
		}else{
			$('body').append(hisHtml);
		}
		$('.fv-history-show ul').append('<li class="fv-his-adv">你还未看过任何视频</li>');
		$history.hover(function(){
			if($('.fv-history-show li').length>1){
				$('.fv-his-adv').remove();
			}
			$('.fv-history-show').slideDown();
		},function(event){
			$hisShow = $('.fv-history-show');
			var hisLeft = $hisShow.offset().left;
			var hisTop = $hisShow.offset().top-10;
			var width = $hisShow.width();
			var height = $hisShow.height();
			if((event.pageX < (hisLeft+width) && event.pageX>hisLeft) && (event.pageY < (hisTop+height) && event.pageY>hisTop)){
				$hisShow.on('mouseleave',function(){
					$hisShow.slideUp();
				});
			}else{
				$hisShow.slideUp();
			}
		});
	};
	$(function(){
		var $search = $('.fv-header-search span'),
		serHtml = '<div class="fv-search-show">' +
						'<div class="fv-search-head">' +
							'<h1>搜索结果</h1><span></span>' +
						'</div>' +
						'<div class="fv-search-body">' +
							'<ul>' +
							'</ul>' +
						'</div>' +
						'<div class="fv-search-pages">' +
							'<span name="next">下一页</span>' +
							'<span name="pre">上一页</span>' +
						'</div>'+
					'</div>';
		$('body').append(serHtml);
		$search.on('click',searchResult);
		$('.fv-header-search input').on('change',function(){
			if($('.hasResult').length>0){
				$('.hasResult').trigger('click');
			}
		})
		$('.fv-header-search input[type=text]').on('keyup',function(e){
			if(e.which == 13){
				searchResult();
			}
			
		})
	})
	var searchResult = function(){
		var $input = $('.fv-header-search input');
			
		if($input.val() == ""){
			$input.focus();
		}else{
			var index = $input.val(),
				$close = $('.fv-search-head span'),
				$search = $('.fv-search-show'),
				$panel = $('.fv-search-body ul'),
				$pages = $('.fv-search-pages');
				currentPages = 1;
				
				$search.slideDown();
				
				$close.on('click',function(){
					$search.slideUp();
					$panel.children().remove();
				}).addClass('hasResult');
	
				$.ajax({
					url: 'servlet/VideoSearch',
					type: 'POST',
					dataType: 'json',
					data: 
					{
						"index":index
					}
				})
				.done(function(data) {
					if(data == ""){
						$li = '<li>未搜索到任何相关视频</li>'
							$panel.append($li);
					}else{
						for(let i=0;i<data.length;i++){
							$panel.append('<li><a href="">'+data[i].videoName+'<p>'+data[i].videoDes+'</p>'+'</a></li>');
							$panel.find('li').eq(i).css({"top":i*80+'px'});
							$panel.find('li').find('a').eq(i).on('click',function(){
								var href = $(this).attr('href');
								var index = href.indexOf('videoId');
								if(href.indexOf("user") != -1){
									videoId = href.slice(index+8,index+13);
								}
								else{
									videoId = href.slice(index+8);
								}
								console.log(videoId);
								var $user = $('.online');	
								var user_name = "";
								if($user.length > 0){	
									user_name = $user.text();
								}
								$.ajax({
									url: 'servlet/VideoView',
									type: 'POST',
									dataType: 'json',
									data: {
										"videoId": videoId,
										"user_name":user_name
									}
								})
								.done(function(data){
									console.log("sucess")
								})
								.fail(function() {
									console.log("error");
								})
								.always(function() {
									console.log("complete");
								});
							});
													
							if(sessionStorage.getItem('name') != null){
								$panel.find('li').eq(i)
									.find('a')
									.attr('href','http://localhost:8080/freeVideo/vediopage.jsp?videoId='+data[i].videoId+'&user='+sessionStorage.getItem('name'));
							}else{
								$panel.find('li').eq(i)
								.find('a')
								.attr('href','http://localhost:8080/freeVideo/vediopage.jsp?videoId='+data[i].videoId);
							}
						}
					}
					if(data.length<5){
						$pages.find('span').on('click',changeSearchPage).eq(0).css({"pointer-events":"none"});
					}else{
						$pages.find('span').on('click',changeSearchPage).eq(0).css({"pointer-events":"auto"});
					}
					console.log("success");
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
				$pages.find('span').on('click',changeSearchPage).eq(1).css({"pointer-events":"none"});
			}
	};
	

	var changeSearchPage = function(){
		var $changePage = $('.fv-search-pages span');
		var $searchResult = $('.fv-search-body ul').find('li');
		var ope = $(this).attr('name');
		console.log(ope);
		var pages = Math.ceil($searchResult.length/10);
		console.log(pages);
		console.log(currentPages);
		switch(ope){
			case 'next':
				$searchResult.each(function(){
					var oldTop = $(this).css('top');
					var newTop = parseInt(oldTop.slice(0,oldTop.indexOf('px')))-400;
					$(this).animate({"top":newTop+"px"});
				});
				currentPages+=1;
				break;
			case 'pre':
				$searchResult.each(function(){
					var oldTop = $(this).css('top');
					var newTop = parseInt(oldTop.slice(0,oldTop.indexOf('px')))+400;
					$(this).animate({"top":newTop+"px"});
				});
				currentPages-=1;
				break;
			default:
				break;
		}
		console.log(pages+"  "+currentPages);
		if(currentPages === pages){
			$changePage.eq(0).css({"pointer-events":"none"});
			$changePage.eq(1).css({"pointer-events":"auto"});
		}else if(currentPages === 1){
			$changePage.eq(1).css({"pointer-events":"none"});
			$changePage.eq(0).css({"pointer-events":"auto"});
		}
	};