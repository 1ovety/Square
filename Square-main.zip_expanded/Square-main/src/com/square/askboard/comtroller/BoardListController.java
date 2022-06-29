package com.square.askboard.comtroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.square.askboard.model.service.AskService;
import com.square.common.model.vo.PageInfo;
import com.square.mainboard.model.service.BoardService;
import com.square.mainboard.model.vo.Board;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// paging
		int listCount;  // total number of boards
		int currentPage; // (page that user request)
		int pageLimit; // limited number of paging bar (how many page display)
		int boardLimit; //	limited number of board
		
		int maxPage; // last page number
		int startPage; // first paging bar number
		int endPage; // last Paging bar number
		
		// * listCount : total pagenumber
		listCount = new BoardService().selectListCount();
		
		//System.out.println(listCount); 
		
		// * currentPage : Current Page ( user request page)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : maximum paging bar number
		pageLimit = 10; 
		
		// * boardLimit : maximum board number of one page 
		boardLimit = 10;
		
		// * maxPage : last page number (total page number)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : start paging bar number
		startPage = (currentPage - 1 ) / pageLimit * pageLimit + 1;
		
		// * endPage : last paging bar number
		endPage = startPage + pageLimit - 1;
		
		// if endPage is smaller than maxPage
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		
		// page information
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// request board list
		ArrayList<Board> list = new BoardService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/mainboard/boardListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
