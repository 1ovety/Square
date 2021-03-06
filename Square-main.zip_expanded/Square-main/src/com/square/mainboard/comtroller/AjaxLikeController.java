package com.square.mainboard.comtroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.square.mainboard.model.service.BoardService;
import com.square.mainboard.model.vo.Board;
import com.square.mainboard.model.vo.Reply;
import com.square.member.model.vo.Member;

/**
 * Servlet implementation class AjaxLikeController
 */
@WebServlet("/like.bo")
public class AjaxLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AjaxLikeController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mno = request.getParameter("mno");
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Board b = new Board();
		b.setMno(mno);
		b.setBoardNo(boardNo);
		
		int result = new BoardService().likeCheck(b);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
