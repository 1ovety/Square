<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.square.mainboard.model.vo.Category"%>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .outer{
        width: 1000px;
        height: 550px;
        margin: auto;
        margin-top: 50px;

    }

    #enroll-form input, #enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
        
        
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br><h2 align="center">Write</h2>

        <br><br>
    
        <form action="" id="enroll-form" method="post">

            <!-- select category, title, content, attachment, writer number -->

            <table align="center" >

                <tr>
                    <th width="70" >
                        <select name="category" id=""  >
                            <option value="" select class="custom-select" >category</option>
                            <% for(Category c : list) { %>
                            <option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
                            <% }  %>
                        </select>
                    </th>
                    <td><input type="text" placeholder="Title" name="title"  required></td>
                </tr>
                <tr>
                    <th>content</th>
                    <td><textarea name="content" cols="80" rows="10" required></textarea></td>
                </tr>
                <tr>
                    <th>attachment</th>
                    <td><input type="file" name="upfile" ></td>
                </tr>

            </table>

            <br>
            <div align="center">
                <button type="submit" class="btn btn-outline-dark">upload</button>
                <button type="reset" class="btn btn-outline-danger">reset</button>
            </div>



        </form>
        

    </div>



</body>
</html>