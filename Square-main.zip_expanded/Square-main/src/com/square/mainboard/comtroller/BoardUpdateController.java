package com.square.mainboard.comtroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BoardUpdateController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		// enctype이 multipart/Edit only when send data-form
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. limited file size (int maxSize) 
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. sotred server folder name path (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			// 2. upload to server after edited file name
			//    HttpServletRequest => MultipartRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. sql
			
			//    >> common : board table > Update
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setCategory(category);
			
			// if there is new attachment
			Attachment at = null;
			
			// if there is new attachment
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/board_upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					// new attacnment with old attachment
					//  => Update Attachment
					//     + origin file number
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// delete old file
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
					
				}else {
					// new attachment without old attachment
					//  => Insert Attachment
					//	   + board number
					at.setRefBoardNo(boardNo);
				}
				
			}
			
			int result = new BoardService().updateBoard(b, at);
			// case1 : new attachment x					 => b, null			 	 => Board Update
			// case2 : new attachment o, old attachment o	 => b, fileNo이담긴 at 	 => Board Update, Attachment Update
			// case3 : new attachmento,  oldattachment x 	 => b, refBoardNo이 담긴 at => Board Update, Attachment Insert
			
			if(result > 0) { // edit success  => detail.bo?bno=xx  url request => board detail page
				
				request.getSession().setAttribute("alertMsg", "Edit successed");
				response.sendRedirect("detail.bo?bno=" + boardNo);				
				
			}else { // edit fail => error page
				
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
