package com.square.mainboard.comtroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.square.mainboard.model.service.BoardService;
import com.square.mainboard.model.vo.Attachment;
import com.square.mainboard.model.vo.Board;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// update view count / request board / requeast attachment
		
		BoardService  bService = new BoardService();
		
		int result =  bService.increaseCount(boardNo);
		
		if(result > 0) { //valid board = > request board, attachment = > request detail board page 
			
			Board b = bService.selectBoard(boardNo);
			Attachment at = bService.selectAttachment(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			// page
			request.getRequestDispatcher("views/mainboard/boardDetailView.jsp").forward(request, response);
			
			
		} else { //error 
			
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
