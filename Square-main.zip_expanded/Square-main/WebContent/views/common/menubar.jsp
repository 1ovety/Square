<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.square.member.model.vo.Member"%>
<%
	
	String contextPath = request.getContextPath(); //"/square"

	Member loginUser = (Member)session.getAttribute("loginUser"); 
	// loading menubar.jsp before sigin in : value is null
	//  loading menubar.jsp after sigin in : value is information of Member Object 

	String alertMsg = (String)session.getAttribute("alertMsg");
	// when roading menubar.jsp  before request service : null
	// when roading menubar.jsp after request service : message through alert
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Limelight&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #login-form, #user-info{float:right}
    #user-info a{
        text-decoration: none;
        color: black;
        font-sized :14px;
    }

    #login-form, #user-info{float:right}
    
    #user-info a{
        text-decoration: none;
        color: black;
        font-size:15px;
    }
    #login-form a{
        color: black;
        font-size:13px;
    }
   
    .nav-item a{
        color: black;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        
    }
    .nav-item a:hover{
        background: darkgray;

    }
    h1{
    	text-decoration: none;
        color: black;
        font-size:40px;
		font-family:limelight;
    }
    #banner{
    	background:lightgrey;
    }
    
    .corp_info1 {
    clear: both;
    width: 930px;
    margin: 0 auto;
    padding: 20px 0;
    text-align: center;
	background: rgb(248, 247, 247);
	font-size: 12px;
	}

    ul, li {
    margin: 0px;
    margin-top: 0px;
    margin-right: 20px;
    margin-bottom: 0px;
    margin-left: 20px;
    padding: 0px;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    list-style: none;
    list-style-position: initial;
    list-style-image: initial;
    list-style-type: none;
    }



    .quick_area .quick_area a h3 em {display: inline;}
    
    .quick_area .quick_list a p {display: none;}
    
	.quick_area {
	position: fixed; 
	top:171px; 
	right: 0; 
	width: 60px; 
	z-index: 100;
	} 

	
	.to_top {
	text-align: center; 
	background-color: #fff;
	}
	
	.to_top > a {
	display: block; 
	height: 45px;
	box-sizing: border-box; 
	text-indent: -9999px; 
	overflow: hidden; 
	border: 1px solid #a3a3a3; 
	background: url(resources/images/ico_totop.png) no-repeat center; 
	background-size: 50%;
	}
	
	
	
	body { font-family: 'Noto Sans KR', sans-serif; height: 100%; font-size: 16px; letter-spacing: -1px; color: #444; white-space: normal; word-wrap: break-word; line-height: 1;}


	
	a { text-decoration: none; }
	a:link { color: #444; }
	a:visited { color: #444; }
	a:hover { color: #444; }
	a:focus { color: #444; }

</style>
</head>
<!-- every page call the menubar.jsp. so add these link in this jsp file, every page can use the bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">


<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<body>

	<script>
	
	 var msg = "<%= alertMsg %>"; 
	 //don't forget the ""
	 //without "" the value such as var msg = sign in successed ; it is wrong	 
	 //var msg = "sign in successed";
	 // var msg = "messge" or "null"
	 
	 if (msg !="null") {
	 		alert(msg);
	 		// after pop the alert, delete the message in session
	 		// if it doesn't, everytime to loading this alert will be poped
	 		<% session.removeAttribute ("alertMsg"); %>
	 }
	 
	</script>
    <h1 align="center"><a class="nav-link" href="<%= contextPath %>"> Square</a> </h1>
    <div class="login-area">
        
        <%if(loginUser == null) { %>
        
        <!-- before sign in -->
        
        <form id="login-form" action="<%= contextPath %>/signin.me" method="post">

            <table>
                <tr>
                    <th>email : </th>
                    <td><input type="text" name="userEmail" required></td>
                </tr>
                <tr>
                    <th>password : </th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <th colspan="2" >
                        <button class="btn btn-primary" type="submit">sign in</button> <!-- type is submit, value that user entered send to server  -->
                        <button class="btn btn-secondary" type="button"  onclick="enrollPage();">sign up</button> <!-- type is button  -->
                    </th>
                </tr>
            </table>  

        </form>
        
        
        <script>
        
 
        // when click the sign up button, process this function
        	function enrollPage (){
        		// location.href = "<%= contextPath %>/views/member/memberEnrollForm.jsp"; 
        		// The directory excute at url, the security has problem
        		
        		// even to request simple static page, must request servlet and using forwarding way
        		// only servlet mapping value excute at url
        		
        		location.href = "<%=contextPath%>/enrollForm.me";
        		
        	}
        	
        
        </script>
    
    	<% }else{ %>
    	
	        <!-- succesed sign in -->
	       
	        <div id="user-info">
	            Welcome! 
	            <b><a href="<%= contextPath %>/myPage.me"> <!--data-toggle="modal" data-target="#myModal"   --> <%= loginUser.getUserId() %></a></b> 
	            <a href="<%= contextPath %>/signout.me">sign out</a>
	        </div>
        
		<% } %>


    </div>
    <!--  
	    <!-- Modal 
	<div id="myModal" class="modal fade" role="dialog" id="udatePwdForm">
	  <div class="modal-dialog">
	
	    <!-- Modal content-
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Check password</h4>
	      </div>
	      <div class="modal-body">
	        	<form action="" method="post">
	        		<table>
	        			
	        			<tr>
	        				<td>password</td>
	        				<td><input type="password" name="checkPwd"></td>
	        			</tr>
	        		
	        		</table>
	        				<br>
	        		<button type="submit">Check</button>
	        	</form>
	      </div>
	      -->
	     <!--
        <script>
        function validatePwd(){
        		if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val){
        			aler("failed");
        			return false;
        		}
        	}
        </script>
	    -->
	    </div>
	
	  </div>
	</div>


    <br clear="both">
    <br>



    <!-- menubar -->
    <nav class="navbar navbar-expand-sm bg-light justify-content-center">

        <ul class="navbar-nav">
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/profile.my">About Taeyeon</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/list.bo?currentPage=1">Board</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">1st Project</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="">2nd Project</a>
          </li>
        </ul>
      
        
      </nav>
      
      <br><br>
      
      
         <!-- wrap -->
    <!--quick list start-->
    <div class="quick_area">
        <p class="to_top"><a href="#">TOP</a></p>
    </div>
    <!--quick list end-->
   

    

</body>
</html>