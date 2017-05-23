$(function(){
	var href = window.location.href;
	var index = href.indexOf('videoId')
	var videoId = href.substr(index+8,5);
//	console.log(videoId);
	$.ajax({
		url: 'servlet/VideoLoad',
		type: 'POST',
		dataType: 'json',
		data: {"videoId": videoId}
	})
	.done(function(data) {
		$('.fv-video-base h1').text(data.videoName);
		$('.fv-video-des p').text('视频描述：'+data.videoDes);
		$('.fv-base-viewTimes p').text(data.videoViews);
		$('#video').find('source').eq(0).attr('src',data.videoPath);
		console.log("success");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
});

$(function(){
	var href = window.location.href;
	href = href.toString();
//	console.log(href);
	var index = href.indexOf('videoId');
	var videoId = href.substr(index+8,5);
	var user_name = href.substr(index+19);
	console.log(user_name);
	$comment = $('.fv-comment-publish');
	$submit = $('.fv-content-sub button');
	$text = $('.fv-content-area textarea');
	if(href.indexOf("user") < 0){	
		$comment.css("pointer-events","none");
		$submit.val("toLogin").text("请登录后在评论");
	}
	else{
		$comment.css("pointer-events","auto");
		$submit.val("登录");
	}
	
	$submit.on('click',function(){
		var comment = $text.val();
		console.log(comment);
		if(comment === ""){
			if($('.fv-sub-tips').length>0){}
			else{
				$(this).parent().append('<span class="fv-sub-tips">请发言后再点击</span>');
			}
			
		}else{
			console.log(user_name);
			$.ajax({
				url: 'servlet/VideoComment',
				type: 'POST',
				dataType: 'json',
				data: {
					"videoId":videoId,
					"user_name":user_name,
					"comment":comment
				},
			})
			.done(function() {
				$text.val("");
				refreshComment(user_name,comment);
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
		
	$comment.find('textarea').on('focus',function(){
		$('.fv-sub-tips').remove();
	})
	refreshComment();
	currentPages = 1;
})

var refreshComment = function(name,comment){
	var href = window.location.href;
	var index = href.indexOf('videoId');
	var videoId = href.substr(index+8,5);
	var $comment = $('.fv-comment-all ul');
	if(name === undefined && comment === undefined){
		$.ajax({
			url: 'servlet/CommentRefresh',
			type: 'POST',
			dataType: 'json',
			data: {"videoId":videoId}
		})
		.done(function(data) {
			if(data.videoComment){
				var comment = data.videoComment.split('&');
				var commentator = data.videoCommentator.split('&');
				comment.length-=1;
				commentator.length-=1;
				for(let i=0;i<comment.length;i++){
					let $li = '<li><p>'+commentator[i]+'</p>'+':'+comment[i]+'</li>';
					$comment.append($li);
					$comment.find('li').eq(i).css({'top':i*46+'px'});
				}
			}
			if(comment != undefined){
				if(Math.ceil(comment.length/10)<=1){
					$('.fv-all-page span').on('click',changePage).eq(0).css({"pointer-events":"none"});
				}
			}else{
				$('.fv-all-page span').on('click',changePage).eq(0).css({"pointer-events":"none"});
			}
			
		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("complete");
		});
	}else{
		var $li = '<li><p>'+name+'</p>'+':'+comment+'</li>';
		$comment.append($li);
		var indexLi = $comment.find('li').length-1;
		$comment.find('li:last').css({'top':indexLi*46+'px'});
		console.log(indexLi);
		if(Math.ceil(indexLi/10)>1){
			$('.fv-all-page span').on('click',changePage).eq(0).css({"pointer-events":"auto"});
		}
	}
	$('.fv-all-page span').on('click',changePage).eq(1).css({"pointer-events":"none"});
};

var changePage = function(){
	
	var $changePage = $('.fv-all-page span');
	var $comment = $('.fv-comment-all ul').find('li');
//	console.log('i run to here');
	var ope = $(this).attr('name');
	console.log(ope);
	var pages = Math.ceil($comment.length/10);
	console.log(pages+" "+currentPages);
	switch(ope){
		case 'next':
			$comment.each(function(){
				var oldTop = $(this).css('top');
				var newTop = parseInt(oldTop.slice(0,oldTop.indexOf('px')))-460;
				$(this).animate({"top":newTop+"px"});
			});
			currentPages+=1;
			break;
		case 'pre':
			$comment.each(function(){
				var oldTop = $(this).css('top');
				var newTop = parseInt(oldTop.slice(0,oldTop.indexOf('px')))+460;
				$(this).animate({"top":newTop+"px"});
			});
			currentPages-=1;
			break;
		default:
			break;
	}
	console.log(pages+"  "+currentPages);
	if(currentPages < pages){
		$changePage.eq(1).css({"pointer-events":"none"});
		$changePage.eq(0).css({"pointer-events":"auto"});
	}else if(currentPages === pages){
		$changePage.eq(1).css({"pointer-events":"auto"});
		$changePage.eq(0).css({"pointer-events":"none"});
	}
};
