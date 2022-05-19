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
</style>
</head>
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
                    <th colspan="2">
                        <button type="submit">sign in</button> <!-- type is submit, value that user entered send to server  -->
                        <button type="button" onclick="enrollPage();">sign up</button> <!-- type is button  -->
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
	            <b><a href=""><%= loginUser.getUserId() %></a></b> 
	            <a href="<%= contextPath %>/signout.me">sign out</a>
	        </div>
        
		<% } %>


    </div>


    <br clear="both">
    <br>



    <!-- menubar -->
    <nav class="navbar navbar-expand-sm bg-light justify-content-center">

        <ul class="navbar-nav">
            <li class="nav-item">
            <a class="nav-link" href="">Q&A</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">Board</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">Contact us</a>
          </li>
        </ul>
      
        
      </nav>
      
      <br><br>
      
    <!-- slide banner -->
    <div id="banner" class="carousel slide" data-ride="carousel" align="center">
    
      <ul class="carousel-indicators">
        <li data-target="#banner" data-slide-to="0" class="active"></li>
        <li data-target="#banner" data-slide-to="1"></li>
      </ul>

      <div class="carousel-inner">

        <div class="carousel-item active" >
          <a href="">
          <img src="resources/" alt="Event1"></a>
        </div>

        <div class="carousel-item">
          <a href="">
          <img src="resources/" alt="Event2"></a>
        </div>

        <div class="carousel-item">
            <a href="">
            <img src="resources/" alt="Event3"></a>
          </div>

    </div>
    

      <a class="carousel-control-prev" href="#banner" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#banner" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    
    </div>

    

</body>
</html>