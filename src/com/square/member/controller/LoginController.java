package com.square.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		 * if there is some information to send, should be saved on the replied page ( *JSP scope built-in Object /4things)
		 * 1. Application : the saved data in application, it can be used every area of web application 
		 * 2. session : the saved data in session, it can be used every JSP and servlet
		 * 				whenever user take and use the data until user delete, stop a server or close the browser 
		 * 				It is one Object who built in every one browser.
		 * 				After close the browser, the session is expired
		 * 3. request : the saved data in request only used at JSP being forward
		 * 			    I can see it is one-time
		 * 4. page : only take and use at following JSP page
		 * 
		 *  Application > Session > Request > Page
		 *  
		 *  if I want to put some data, use .setAttribute("key", value)
		 *  if I want to use the data, use .getAttribute("key")
		 *  if I want to delete the data, use .removeAttribute("key")
		 *  
		 */
		
		if(loginUser == null) { // sign in fail - > request error page
			
			request.setAttribute("errorMsg", "sign in failed");
			// needed object when delegate request page to JSP (RequestDispatcher) 
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			// forwarding way to set requested view : Just show the decided view through path, url is not changed (URL is still same) 
			view.forward(request, response);
			
		} else { // sign in success - > request index page
			
			// if access the session from sevlet, should bring the priority session Object
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			// It is forwarding way
			// It just show the jsp, this servlet mapping value is till in Url
			// localhost:8888/square/login.me
			//RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			//view.forward(request, response);

			// sendRedirect way (recall a url)
			response.sendRedirect("/");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
