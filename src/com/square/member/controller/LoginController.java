package com.square.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.square.member.model.service.MemberService;
import com.square.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/signin.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * <HttpServletRequest and HttpServletResponse
		 * - request :  informations when ask to server (Enter value when ask, ask way etc) 
		 * - response : needed Object when reply from ask 
		 * 
		 * - Get: if user input some value, it is exposed on url / data length limit/ but bookmark is easy
		 * - Post:      "                 , it is not exposed on url / no limited /  but timeout	
		 */
		
		
    	String userEmail= request.getParameter("userEmail");
    	String userPwd = request.getParameter("userPwd");
		
    	
    	// process the request and take a result ask request method from service class
		Member loginUser = new MemberService().loginMember(userEmail, userPwd);
		
		// view using some result that user can see
		// System.out.println(loginUser); excute the user's infromation who signed in and success
		
		/*
		 * if there is some information to send, should be restored replied page
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
