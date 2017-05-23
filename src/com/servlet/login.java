package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.entity.UserBean;
import com.beans.UserDAO;
import com.google.gson.*;
public class login extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public login() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	@Override
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
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
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
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String message = "";
		
		int value = Integer.parseInt(request.getParameter("value"));
		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		UserBean user = new UserBean();
		user.setName(name);
		user.setPassword(password);
		UserDAO userdao = new UserDAO();
//		System.out.println(name+" "+password);
		switch(value){
		case 1:
			message = userdao.searchUser(user);
			break;
		case 2:
			message = userdao.addUser(user);
			break;
		default:
				break;
		}			
		Gson gson = new Gson();
		String jsonMes = gson.toJson(message);
		out.write(jsonMes);
		
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
