<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>

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
    #mypage-form table{margin: auto;}
    #mypage-form input{margin: 5px;}

</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
    
    <% 
	    String userEmail = loginUser.getUserEmail();	
	    String userId = loginUser.getUserId();
    %>

    <div class="outer">
 
        <br>
        <h2 align="center">My Account</h2>

		<br>
        <form action="<%= contextPath %>/update.me" id="mypage-form" method="POST">

            <table>
                <tr>
                    <td>*Email</td>
                    <td><input type="text" name="userEmail" maxlength="30" required value="<%= userEmail %>"></td>
                    <td><button type="button" class="btn btn-outline-dark">check</button></td>
                </tr>
                <tr>
                    <td>*id</td>
                    <td><input type="text" name="userId" maxlength="20" value="<%= userId %>" readonly></td>
      				<td> (can not change your id)</td>
                <tr>
                    <td>*password</td>
                    <td><input type="password" name="userPwd" maxlength="30" required ></td>
                    <td></td>
                </tr>
                <tr>
                    <td>*check password</td>
                    <td><input type="password" maxlength="15" name="updatePwd" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                    <input type="checkbox" name="agree" id="agree" checked readonly required>
                    <label for="agree">agree to policy</label>
                    </td>
                    <td></td>
                </tr>
                
            </table>
            
            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-outline-secondary">change</button>
                <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteForm">withdraw</button>
            </div>

            <br><br>

        </form>
       </div>
        <!-- When click the withdraw button Modal--> 
			<div class="modal" id="deleteForm">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"></h4>
			      </div>
			      
			      <div class="modal-body" align="center">
			        	
			        	<b>Delete? <br> it can't be recover </b>
			        	
			        	<form action="<%= contextPath %>/delete.me" method="post">
			        	
			        		password : <input type="password" name="userPwd" required>
			        		
			        		<br><br>
			        		
			        		<button type="submit" class="btn btn-danger btn-sm">Delete</button>
			        	
			        	</form>
			      </div>
			      
				</div>
			</div>
     	</div>
   
</body>
</html>