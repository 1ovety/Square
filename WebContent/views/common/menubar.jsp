<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
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

    <h1 align="center"> Square </h1>
    <div class="login-area">
        
        <!-- before sign in -->
        
        <form id="login-form" action="" method="post">

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
                        <button type="submit">sign in</button>
                        <button type="button">sign up</button>
                    </th>
                </tr>
            </table>  

        </form>
    
        <!-- succesed sign in -->
        <!--
        <div id="user-info">
            Welcome! 
            <b><a href="">userId</a></b> 
            <a href="">sign out</a>
        </div>
        -->



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
            <a class="nav-link" href="">Square</a>
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

    <div>
    
        <tr>
            <th>userId</th>
            <td>title</td>
            <td>like</td>
        </tr>

        <tr>
            <th>userId</th>
            <td>title</td>
            <td>like</td>
        </tr>

        <tr>
            <th>userId</th>
            <td>title</td>
            <td>like</td>
        </tr>
        
    </div>

</body>
</html>