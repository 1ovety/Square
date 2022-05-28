<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.square.common.model.vo.PageInfo, java.util.ArrayList, com.square.mainboard.model.vo.Board" %>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Square</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    

        
<%@ include file="../common/menubar.jsp"  %>


    <div class="container">

      <br>

      <h2>Square</h2>

      <!-- only show after sign in-->
      <div align="right" style="width: 1020px;">
        <a href="">Write</a>
      </div>

      <br>
      
      <table class="table table-hover">
        <thead>
          <tr>
            <th width="70">No. </th>
            <th width="70">Cateogry</th>
            <th width="300">Title</th>
            <th width="100">ID</th>
            <th width="50">Views</th>
            <th width="100">Date</th>
          </tr>
        </thead>
        <tbody>
        
        <%if(list.isEmpty()){ %>
        
        	<tr>
        		<td colspan ="6"> Empty </td>
        	</tr>
        
        <% } else { %>
        
	        	<% for ( Board b : list ) {%>
	        	
			          <tr>
			            <td><%= b.getBoardNo() %></td>
			            <td><%= b.getCategoryNo() %></td>
			            <td><%= b.getBoardTitle() %></td>
			            <td><%= b.getBoardWriter() %></td>
			            <td><%= b.getCount() %></td>
			            <td><%= b.getCreateDate() %></td>
			          </tr>
	          
	          <% } %>
         <% }  %>
        </tbody>
      </table>

      <br><br>

       <div class="paging-area">
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
          </ul>
       </div>
    </div>

</body>
</html>