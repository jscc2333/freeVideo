	$(function(){
		var $imgrolls = $('.fv-content-banner li'),
			len = $imgrolls.length,
			index = 0,
			timer = null;

		$imgrolls.on(',mouseover',function(){
			index = $imgrolls.index(this);
			showImg(index);
		}).eq(0).mouseover();
		
		$('.fv-content-banner').hover(function() {
			/* Stuff to do when the mouse enters the element */
			if(timer){
				clearInterval(timer);
			}
		}, function() {
			/* Stuff to do when the mouse leaves the element */
			timer =setInterval(function(){
				showImg(index);
				index++;
				if(index === len){index=0;}
			}, 2000);
		}).trigger('mouseleave');	
		updateView();
	});

	var showImg = function(index){
		$('.fv-content-banner').find('li')
								.eq(index)
								.fadeIn()
								.siblings()
								.stop(true,true)
								.fadeOut();
	};
	$(function(){
		$('.video').on('click',function(){
			var href = $(this).attr('href');
			var index = href.indexOf('videoId');
			if(href.indexOf("user") != -1){
				videoId = href.slice(index+8,index+13);
			}
			else{
				videoId = href.slice(index+8);
			}
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
			.done(function(data) {
				setTimeout(updateView(),2000);
				console.log("success");
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
		})
	})
	var updateView = function(){
		console.log('here');
		$.ajax({
			url: 'servlet/VideoView',
			type: 'GET',
			dataType: 'json',
			data: {}
		})
		.done(function(data) {
			var videoId = data[0].split("&");
			var views = data[1].split("&");
			videoId.length-=1;
			views.length-=1;
			$.each($('.video'),function(){
				$views = $(this).parents('.fv-video-container').find('.fv-vedio-viewTimes');
				if($views.length !== -1){
					var id = $(this).attr('href').slice($(this).attr('href').indexOf('videoId')+8,$(this).attr('href').indexOf('videoId')+13);
					for(let i=0;i<views.length;i++){
						if(videoId[i] === id){
							$views.find('b').text(views[i]);
						}
					}
				}
			})					
			console.log("success");
		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("complete");
		});
	};