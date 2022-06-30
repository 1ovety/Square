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
            <a href="<%= contextPath %>/updateForm.bo?bno=<%=b.getBoardNo()%>" class="btn btn-warning btn-sm">edit</a>
            <a href="">delete</a>
        </div>
        <br><br> 

        <div align="center">
            <a href="<%=contextPath%>/list.bo?currentPage=1" class="btn btn-secondary btn-sm">목록가기</a>

			<% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())){ %>
	            <!--match sign in user and writer -->
	            <a href="<%= contextPath %>/updateForm.bo?bno=<%=b.getBoardNo()%>" class="btn btn-warning btn-sm">수정하기</a>
	            <a href="" class="btn btn-danger btn-sm">삭제하기</a>
            <% } %>
        </div>

        <br>

        <div id="reply-area">

            <table border="1" align="center">
                <thead>
                	<% if(loginUser != null) { %>
	                    <!--after sign in-->
	                    <tr>
	                        <th>comment</th>
	                        <td>
	                            <textarea id="replyContent" rows="3" cols="50" style="resize:none"></textarea>
	                        </td>
	                        <td><button onclick="insertReply()">reply</button></td>
	                    </tr>
                    <% }else { %>
	                    <!--before sign in-->
	                    <tr>
	                        <th>comment</th>
	                        <td>
	                            <textarea rows="3" cols="50" style="resize:none" readonly>try sign in</textarea>
	                        </td>
	                        <td><button disabled>reply</button></td>
	                    </tr>
					<%} %>
                </thead>
                <tbody>
					
                </tbody>
            </table>
            
               <script>
            	$(function(){
            		selectReplyList();
            
            		setInterval(selectReplyList, 1000);
            	})
            	
            	function insertReply(){
            		$.ajax({
            			url:"rinsert.bo",
            			data:{
            				content:$("#replyContent").val(),
            				bno:<%=b.getBoardNo()%>            		
            			},type:"post",
            			syccess:function(result){
            				
            				if(result > 0){ //reply successed=> request updated reply list
            					selectReplyList();
            					$("#replyContent").val("");
            				}
            				
            			},error:function(){
            				console.log("ajax failed);
            			}
            		})
            	}
            	function selectReplyList(){
            		$.ajax({
            			url:"rlist.bo",
            			data:{bno:<%=b.getBoardNo()%>},
            			success:function(list){
            				
            				console.log(list);
            				
            				
            				var result = "";
            				for(var i in list){
            					result += 	"<tr>"
				                        +       "<td>" +list[i].replyWriter + "</td>"
				                        +       "<td>" +list[i].replyContent + "</td>"
				                        +       "<td>" +list[i].createDate + "</td>"
				                        +   "</tr>";
            				}
            				
            				$("#reply-area tbody").html(result);
            				
            			},error:function(){
            				console.log("ajax failed");
            			}
            		})
            	}
       
            </script>
        </div>
    </div>
	
	

</body>
</html>