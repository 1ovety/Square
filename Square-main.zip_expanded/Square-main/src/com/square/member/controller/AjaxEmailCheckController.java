package com.square.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.square.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxEmailCheckController
 */
@WebServlet("/emailCheck.me")
public class AjaxEmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AjaxEmailCheckController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String checkId = request.getParameter("checkEmail");
		
		int count = new MemberService().emailCheck(checkEmail);
	
		if(count>0) { // if someone already use this Email  => cannot use it
			response.getWriter().print("NNNNN");
		} else { // nobody use this Email => can use
			response.getWriter().print("NNNNY");
		}
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
