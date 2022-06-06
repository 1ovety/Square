<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.square.mainboard.model.vo.*"%>
    
<%
	Board b = (Board)request.getAttribute("b");
	// board number, category name, title, content, userId, writing date
	Attachment at = (Attachment)request.getAttribute("at"); 
	// attachment number, original name, changed name, store path
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <br><h2 align="center">Board Content</h2>

        <br>

        <table id="detail-area" align="center" border="1">

            <tr>
                <th width="70">Category</th>
                <td width="70"><%= b.getCategoryNo() %></td>
                <th width="70">Title</th>
                <td width="350"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>writer</th>
                <td><%= b.getBoardWriter() %></td>
                <th>write date</th>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>content</th>
                <td colspan="3">
                    <p style="height: 200px;">
                        <%= b.getBoardContent() %>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Attachment</th>
                <td colspan="3">
                	<!--No Attachment -->
                	<% if(at == null) { %>
                		No attachment
                	<% } else { %>
					<!-- Attachment -->
                    <!-- file path to download -->
                    <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
                    <p>there is no file</p>
					<% } %>

                </td>
            </tr>


        </table>
        <br>

        <div align="center">
            <a href="">LIST</a>

            <!--match login user and writing user -->
            <a href="">edit</a>
            <a href="">delete</a>
        </div>
        <br><br> 

        <div id="reply-area">

            <table border="1" align="center">
                <thead>
                    <!--after sign in-->
                    <!--
                    <tr>
                        <th>comment</th>
                        <td>
                            <textarea name="" id="" cols="50" rows="3" style="resize: none;"></textarea>
                        </td>
                        <td><button>comment</button></td>
                    </tr>
                     -->
                     <!-- before sign in-->
                     <tr>
                        <th>comment</th>
                        <td>
                            <textarea name="" id="" cols="50" rows="3" style="resize: none;" readonly>sign in please</textarea>
                        </td>
                        <td><button>comment</button></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>user05</td>
                        <td>comment comment </td>
                        <td>datedate</td>
                    </tr>
                    <tr>
                        <td>user05</td>
                        <td>comment comment </td>
                        <td>datedate</td>
                    </tr>
                    <tr>
                        <td>user05</td>
                        <td>comment comment </td>
                        <td>datedate</td>
                    </tr>
                    <tr>
                        <td>user05</td>
                        <td>comment comment </td>
                        <td>datedate</td>
                    </tr>
                    

                </tbody>
            </table>
        </div>
    </div>
	
	

</body>
</html>