package com.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import com.entity.*;
import com.beans.*;
/**
 * Servlet implementation class VideoComment
 */
public class VideoComment extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoComment() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String videoId = request.getParameter("videoId");
		String user_name = request.getParameter("user_name");
		System.out.print(user_name);
		String comment = request.getParameter("comment");
		
		UserBean user = new UserBean();
		VideoBean video = new VideoBean();
		user.setName(user_name);
		video.setVideoId(videoId);
		video.setVideoComment(comment);
		video.setVideoCommentator(user_name);
		UserDAO userdao = new UserDAO();
		VideoDAO videodao = new VideoDAO();
		videodao.updateComment(video);
	}

}
