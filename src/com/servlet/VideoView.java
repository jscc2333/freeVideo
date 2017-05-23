package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import com.entity.*;
import com.beans.*;
public class VideoView extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public VideoView() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		VideoDAO videodao = new VideoDAO();
		ArrayList<String> viewArray = new ArrayList<String>();
		viewArray = videodao.loadViews();
		Gson gson = new Gson();
		String gsonArray = gson.toJson(viewArray);
		out.write(gsonArray);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String videoId = request.getParameter("videoId");
		String user_name = request.getParameter("user_name");
		System.out.println(videoId+""+user_name);
		System.out.println(videoId+user_name);
		VideoBean video = new VideoBean();
		UserBean user = new UserBean();
		user.setName(user_name);
		video.setVideoId(videoId);		
		VideoDAO videodao = new VideoDAO();
		videodao.viewVideo(video,user);
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
