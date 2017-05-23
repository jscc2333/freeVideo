package com.entity;

import java.io.Console;
import java.util.ArrayList;

public class VideoBean {
	private String videoId;
	private String videoPath;
	private String videoDes;
	private String videoName;
	private String videoComment;
	private int videoViews;
	private String videoCommentator;
	
	public VideoBean(){
		super();
	}
	
	public String getVideoId(){
		return videoId;
	}
	public String getVideoPath(){
		return videoPath;
	}
	public String getVideoDes(){
		return videoDes;
	}
	public String getVideoName(){
		return videoName;
	}
	public String getVideoComment(){
		return videoComment;
	}
	public int getVideoViews(){
		return videoViews;
	}
	public String getVideoCommentator(){
		return videoCommentator;
	}
	public void setVideoId(String videoId){
		this.videoId = videoId;
	}
	public void setVideoPath(String videoPath){
		this.videoPath = videoPath;
	}
	public void setVideoDes(String videoDes){
		this.videoDes = videoDes;
	}
	public void setVideoName(String videoName){
		this.videoName = videoName;
	}
	public void setVideoComment(String videoComment){
		this.videoComment = videoComment;
	}
	public void setVideoViews(int videoViews){
		this.videoViews = videoViews;
	}
	public void setVideoCommentator(String videoCommentator){
		this.videoCommentator = videoCommentator;
	}
}
