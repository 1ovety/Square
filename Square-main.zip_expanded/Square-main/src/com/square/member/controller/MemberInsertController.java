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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. incording
		request.setCharacterEncoding("UTF-8");
		
		// 2. select the delivered value and then report it to valiable and  Object 
		String userEmail = request.getParameter("userEmail");  // "email"
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// create as default creator and then put parameter using setter
		Member m = new Member(userEmail, userId, userPwd);
		
		// 3. request (take service method request and result)
		int result = new MemberService().insertMember(m);
		
		// 4. set answer view that user see using process result  
		if(result > 0) { // success => /square   recall url = > index.jsp
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "great!");
			
			response.sendRedirect(request.getContextPath());
			
		}else { // fail => errorPage
			
			request.setAttribute("errorMsg", "sign up failed.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
