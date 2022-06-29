<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.square.mainboard.model.vo.*"%>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
	Board b = (Board)request.getAttribute("b");
	//number, category name, title, content, writer, date
	Attachment at = (Attachment)request.getAttribute("at");
	//  null or file number, origin name, edited name, path
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background:black;
        color:white;
        width:1000px;
        height:550px;
        margin:auto;
        margin-top:50px;
    }
    #update-form>table{border:1px solid white;}
    #update-form input, #update-form textarea{
        width:100%;
        box-sizing: border-box;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">
        <br><h2 align="center">Edit board</h2><br>

        <form action="<%= contextPath %>/update.bo" id="update-form" method="post" enctype="multipart/form-data">
		   
		   <input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
           <!--category, title, content, attachment-->
           <table align="center">
                <tr>
                    <th width="70">cetegory</th>
                    <td width="500">
                        <select name="category">
                        	<% for(Category c : list) { %>
                            	<option value="<%=c.getCategoryNo()%>"><%= c.getCategoryName() %></option>
                            <% } %>
                        </select>
                        <script>
                        	$(function(){
                        		$("#update-form option").each(function(){
                        			if($(this).text() == "<%=b.getCategory()%>"){
                        				$(this).attr("selected", true);
                        			}
                        		})
                        	})
                        </script>
                    </td>
                </tr>
                <tr>
                    <th>title</th>
                    <td><input type="text" name="title" required value="<%= b.getBoardTitle() %>"></td>
                </tr>
                <tr>
                    <th>content</th>
                    <td>
                        <textarea name="content" rows="10" required><%= b.getBoardContent() %></textarea>
                    </td>
                </tr>
                <tr>
                    <th>attachment</th>
                    <td>
                    	<% if(at != null){ %>
                        	<%= at.getOriginName() %>
                        	<input type="hidden" name="originFileNo" value="<%=at.getFileNo()%>">
                        	<input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">
                        <% } %>
                        
                        <input type="file" name="reUpfile">
                    </td>
                </tr>
            </table>

            <br>
            <div align="center">
                <button type="submit">edit</button>
            </div>

        </form>


    </div>

</body>
</html>