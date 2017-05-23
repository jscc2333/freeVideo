package com.servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import com.entity.VideoBean;
import com.beans.VideoDAO;;

/**
 * Servlet implementation class commentRefresh
 */
@WebServlet("/commentRefresh")
public class CommentRefresh extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentRefresh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
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
		
		VideoBean video = new VideoBean();
		video.setVideoId(videoId);
		VideoDAO videodao = new VideoDAO();
		video = videodao.searchComment(video);
		
		Gson gson = new Gson();
		String gsonVideo = gson.toJson(video);
		out.write(gsonVideo);
	}

}
