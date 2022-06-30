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


	<%@ include file="../common/menubar.jsp" %>
	
	
    <div class="outer">
 
        <br>
        <h2 align="center">Sign up</h2>

		<br>
        <form action="<%= contextPath %>/insert.me" id="enroll-form" method="POST">

            <table>
                <tr>
                    <td>*Email</td>
                    <td><input type="text" name="userEmail" maxlength="40" required></td>
                    <td><button type="button" class="btn btn-outline-dark" onclick="emailCheck();" >check</button></td>
                </tr>
                <tr>
                    <td>*id</td>
                    <td><input type="text" name="userId" maxlength="20" required></td>
                    <td><button type="button" class="btn btn-outline-dark" onclick="idCheck();" onclick="validatePwd();">check</button></td>
                </tr>
                <tr>
                    <td>*password</td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>*check password</td>
                    <td><input type="password" maxlength="15" name="checkPwd" required onclick="validatePwd();"></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                    <input type="checkbox" name="agree" id="agree" required>
                    <label for="agree">agree to policy</label>
                    </td>
                    <td></td>
                </tr>
                
            </table>

            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-outline-secondary" disabled>sign up</button>
                <button type="reset" class="btn btn-outline-danger">cancel</button>
            </div>

            <br><br>

        </form>
        
        <script>
		function idCheck(){
			
			// id object to enter 
			var userId = $("#enroll-form input[name=userId]");
			
			$.ajax({
				url:"idCheck.me",
				data:{checkId:$userId.val()},
				success:function(result){
					
					if(result == "NNNNN" ) { // impossible to use
						
						alert("someone use this Id.");
						$userId.focus();
						
					}else { // possible to use
						
						if(confirm("Nice id")){// use the id 
							
							$("#enroll-form : submit").removeAttr("disabled"); // button is working
							$userId.attr("readonly", true); // it can't work
							
						}else {// enter again
							$userId.focus();
						}
						
					}
					
					
					
					
				},error:function(){
					console.log("ajax failed");
				}
			});
			
			
			
			
		}
	</script>
	
	
	<script>
		function emailCheck(){
			
			// id object to enter 
			var userId = $("#enroll-form input[name=email]");
			
			$.ajax({
				url:"email.me",
				data:{checkId:$userId.val()},
				success:function(result){
					
					if(result == "NNNNN" ) { // impossible to use
						
						alert("someone use this email.");
						$userId.focus();
						
					}else { // possible to use
						
						if(confirm("Nice email")){// use the id 
							
							$("#enroll-form : submit").removeAttr("disabled"); // button is working
							$userId.attr("readonly", true); // it can't work
							
						}else {// enter again
							$userId.focus();
						}
						
					}
					
					
					
					
				},error:function(){
					console.log("ajax failed");
				}
			});
			
			
			
			
		}
	</script>
	
	
        <!-- message to check information / if user enter the wrong keyword show the error-->
        <!--
        <script>
                    function() {
                        var userId = false;
                        var userPwd = false;
                        var checkPwd = false;
                        var idTag = $("#userId");
                        idTag.on("keyup", function() {
                            var idReg = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
                            var image = $("#idimg");
                            if( !idReg.test(idTag.val()) ) {
                                image.attr("src", "images/eye127.png");
                                idTag.css("color", "#EE5656");
                                userId = false;
                            }
                            else {
                                image.attr("src", "images/user7.png");
                                idTag.css("color", "blue");
                                userId = true;
                            }
                        });
                        var pwTag = $("#password");
                        pwTag.on("keyup", function() {
                            var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
                            var image = $(".pwimg").eq(0);
                            if( !pwReg.test(pwTag.val()) ) {
                                image.attr("src", "images/eye127.png");
                                pwTag.css("color", "#EE5656");
                                passPw1 = false;
                            }
                            else {
                                image.attr("src", "images/user7.png");
                                pwTag.css("color", "blue");
                                userPwd = true;
                            }
                        });


                        var cpwTag = $("#cPassword");
                        cpwTag.on("keyup", function() {
                            var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,16}$/;
                            var image = $(".pwimg").eq(1);
                            if( !pwReg.test(cpwTag.val()) ) {
                                image.attr("src", "images/eye127.png");
                                cpwTag.css("color", "#EE5656");
                                checkPwd = false;
                            }
                            else {
                                image.attr("src", "images/user7.png");
                                cpwTag.css("color", "blue");
                                checkPwd = true;
                            }
                        });


                        var formTag = $("form").eq(0);
                        formTag.on("submit", function() {
                            var nameTag = $("#name");

                            if(userId == false) {
                                alert("Pleas eneter the right Id");
                                idTag.focus();
                                return false;
                            } else if(userPwd == false) {
                                alert("Please enter the right paaword");
                                pwTag.focus();
                                return false;
                            } else if(checkPwd == false) {
                                alert("It is not correct");
                                cpwTag.focus();
                                return false;
                            } else {
                                return true;
                            }
                        });
                    });
        </script>
         -->

        
        <script>
        function validatePwd(){
        		if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val){
        			aler("failed");
        			return false;
        		}
        	}
        </script>
       
       
    </div>
</body>
</html>