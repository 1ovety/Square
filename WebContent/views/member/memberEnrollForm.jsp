<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #enroll-form table{margin: auto;}
    #enroll-form input{margin: 5px;}

</style>
</head>
<body>


	<!--  <%@ include file="../common/menubarFin.jsp" %> -->
	
	
    <div class="outer">
 
        <br>
        <h2 align="center">Sign up</h2>

		<br>
        <form action="<%= contextPath %>/insert.me" id="enroll-form" method="POST">

            <table>
                <tr>
                    <td>*Email</td>
                    <td><input type="text" name="userEmail" maxlength="12" required></td>
                    <td><button type="button" class="btn btn-outline-dark">check</button></td>
                </tr>
                <tr>
                    <td>*id</td>
                    <td><input type="text" name="userId" maxlength="20" required></td>
                    <td><button type="button" class="btn btn-outline-dark">check</button></td>
                </tr>
                <tr>
                    <td>*password</td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>*check password</td>
                    <td><input type="password" maxlength="15" required></td>
                    <td></td>
                </tr>
                
            </table>

            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-outline-secondary">sign up</button>
                <button type="reset" class="btn btn-outline-danger">cancel</button>
            </div>

            <br><br>

        </form>
    </div>
</body>
</html>