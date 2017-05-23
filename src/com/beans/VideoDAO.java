package com.beans;

import com.beans.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import com.entity.UserBean;
import com.entity.VideoBean;
import java.util.ArrayList;

public class VideoDAO {
	private static InitialContext context = null;
	private DataSource dataSource = null;
	
	
	
	public VideoBean loadVedio(VideoBean video){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		String path = "";
		String name = "";
		String description = "";
		int views;	
		
		try{
			pstmt = conn.prepareStatement("SELECT *FROM video WHERE videoId=?");
			pstmt.setString(1, video.getVideoId());
			rst = pstmt.executeQuery();
			if(rst.next()){
				path = rst.getString("videoPath");
				name = rst.getString("videoName");
				description = rst.getString("videoDes");
				views =Integer.parseInt(rst.getString("videoViews"));
				
			}else{
				return null;
			}
		}catch(Exception e){
			System.out.println("i run to here");
			return null;
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.print(e);
			}
		}
		video.setVideoPath(path);
		video.setVideoName(name);
		video.setVideoDes(description);
		video.setVideoViews(views);
		return video;
	}
	
	public void viewVideo(VideoBean video,UserBean user){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		String record = "";
		String recordId = "";
		String newRecord = "";
		int views = 0;
		try{
			pstmt = conn.prepareStatement("SELECT * FROM video WHERE videoId=?");
			pstmt.setString(1,video.getVideoId());
			rst = pstmt.executeQuery();
			if(rst.next()){
				newRecord = rst.getString("videoName");
				views =Integer.parseInt(rst.getString("videoViews"));
			}else{
				System.out.println("error");
			}
			System.out.println(views);
			pstmt = conn.prepareStatement("UPDATE video SET videoViews=? WHERE videoId=?");
			pstmt.setInt(1, views+1);
			pstmt.setString(2, video.getVideoId());
			pstmt.executeUpdate();
						
			if(user.getName() != ""){
				pstmt = conn.prepareStatement("SELECT * FROM user WHERE name=?");
				pstmt.setString(1,user.getName());
				rst = pstmt.executeQuery();
				if(rst.next()){
					recordId = rst.getString("recordId");
					record = rst.getString("record");
				}else{
					System.out.println("error");
				}
				if(record == null && recordId ==null){
					record = newRecord+"&";
					recordId = video.getVideoId()+"&";
				}else{
					if(record.indexOf(newRecord)>=0 && recordId.indexOf(video.getVideoId())>=0){
					
					}else{
						record = record+newRecord+"&";
						recordId = recordId+video.getVideoId()+"&";
					}	
				}
				
				pstmt = conn.prepareStatement("UPDATE user SET record=?,recordId=? WHERE name=?");
				pstmt.setString(1,record);
				pstmt.setString(2, recordId);
				pstmt.setString(3, user.getName());
				pstmt.executeUpdate();
			}	
			
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.println(e);
			}
		}
		
	}
	
	public VideoBean updateComment(VideoBean video){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		String comment = video.getVideoComment()+"&";
		String commentator = video.getVideoCommentator()+"&";
		
		try{
			pstmt = conn.prepareStatement("SELECT * FROM video WHERE videoId=?");
			pstmt.setString(1, video.getVideoId());
			rst = pstmt.executeQuery();
			if(rst.next()){
				if(rst.getString("videoComment") != null && rst.getString("videoCommentator")!=null){
					comment = rst.getString("videoComment")+comment;
					commentator = rst.getString("videoCommentator")+commentator;
				}
			}
			pstmt = conn.prepareStatement("UPDATE video SET videoComment=?,videoCommentator=? WHERE videoId=?");
			pstmt.setString(1, comment);
			pstmt.setString(2, commentator);
			pstmt.setString(3,video.getVideoId());
			int a=pstmt.executeUpdate();
			System.out.print(a);
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.println(e);
			}
		}
		return video;
	}
	
	public VideoBean searchComment(VideoBean video){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		String comment = "";
		String commentator = "";
		try{
			pstmt = conn.prepareStatement("SELECT * FROM video WHERE videoId=?");
			pstmt.setString(1,video.getVideoId());
			rst = pstmt.executeQuery();
			if(rst.next()){
				comment = rst.getString("videoComment");
				commentator = rst.getString("videoCommentator");
			}
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.println(e);
			}
		}
		video.setVideoComment(comment);
		video.setVideoCommentator(commentator);
		return video;
	}
	public ArrayList<String> loadViews(){
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		String videoId = "";
		String videoViews = "";
		try{
			pstmt = conn.prepareStatement("SELECT videoId,videoViews FROM video");
			rst = pstmt.executeQuery();
			while(rst.next()){
				videoId = rst.getString("videoId")+"&"+videoId;
				videoViews = rst.getString("videoViews")+"&"+videoViews;
			}
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
				conn.close();	
			}catch(Exception e){
				System.out.println(e);
			}
		}
		ArrayList<String> array = new ArrayList<String>();
		array.add(videoId);
		array.add(videoViews);
		
		return array;
	}
	public ArrayList<VideoBean> searchVideo(String index){
		ArrayList<VideoBean> array = new ArrayList<VideoBean>();
		Connection conn = Connect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rst =null;
		index = "%"+index+"%";
		try{
			pstmt = conn.prepareStatement("SELECT * FROM video WHERE videoName like ? OR videoDes like ?");
			pstmt.setString(1,index);
			pstmt.setString(2,index);
			rst = pstmt.executeQuery();
			while(rst.next()){
				VideoBean video = new VideoBean();
				video.setVideoDes(rst.getString("videoDes"));
				video.setVideoId(rst.getString("videoId"));
				video.setVideoName(rst.getString("videoName"));
				array.add(array.size(),video);
			}
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
				conn.close();
			}catch(Exception e){
				System.out.println(e);
			}
		}
		return array;
	}
}
