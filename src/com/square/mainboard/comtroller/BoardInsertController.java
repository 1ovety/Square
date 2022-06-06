package com.square.mainboard.comtroller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.square.common.MyFileRenamePolicy;
import com.square.mainboard.model.service.BoardService;
import com.square.mainboard.model.vo.Attachment;
import com.square.mainboard.model.vo.Board;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// MULTIPART/FORM-DATA 
		
		//success send enctype to multipart/form-data
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// library to upload file : cos.jar (com.oreilly.servlet)
			
			// 1. limited file size
			int maxSize = 10*1024*1024;
			
			// 1-1. file path (String savaPath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			/*
			 * 2. change the file name and upload it
			 * 		>> HttpServletRequest request => MultipartRequest multiRequest 
			 * 
			 * MultipartRequest multiRequest = new MultipartRequest(request object, store path, limited size, encoding value, change file name object);
			 * 
			 * change the file name
			 * => DefaultFileRenamePolicy object( cos.jar)
			 * => rename() method run and change the file name
			 * => if a file name with other one , add number
			 */
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// database to VO
			
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
			
			Board b = new Board();
			b.setCategoryNo(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(boardWriter);
			
			Attachment at = null;
			
			// multiRequest.getOriginFileName("키")
			// -> origin file /  null
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile")); // origin file name
				at.setChangeName(multiRequest.getFilesystemName("upfile")); // changed file name
				at.setFilePath("resources/board_upfiles/");
				
			}
			
			// 4.request service
			int result = new BoardService().insertBoard(b, at);
			
			if(result > 0 ) { // success = > list.bo? currentPage = 1
				
				request.getSession().setAttribute("alertMsg", "good");
				response.sendRedirect(request.getContextPath() + "/list.bo?currentPage=1");
							
			}else { //fail
				
				if(at != null ) {
						// create file object to delete ->  request delete method 
						new File(savePath + at.getChangeName()).delete();				
				}
				
				request.setAttribute("errorMsg", "failed upload");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
