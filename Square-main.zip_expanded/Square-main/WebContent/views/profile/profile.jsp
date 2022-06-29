<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#selfImg{
	    margin-left: 31%;
	    display: inline-block;
	    margin-right: 20px;
	    border-radius: 10%;
	    float:left;
	}
	
	div.selfInfo{
	    width: 600px;
	    height: 600px;
	    display: inline-block;
	    padding-left: 20px;
	}
	
	
	* { margin: 0; padding: 0; }
	
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

<br><br><br><br>
		<img src="resources/images/selfie.png" id="selfImg"  width="350px">
	
	 <!--personal information-->
        <div class="selfInfo">
	        <h2>My information</h2>
	        Name :Taeyeon Kim <br>
	        Preferred Name : Eden <br>
	        Education : <br>
	        Algonquin College (2yrs) | <b> computer Programming</b>
	        <br>
	        KH information educational Institute | <b>SW developer training process </b>
	        <br>
	        Sahmyook University | English Interpretation & Translation
        <br><br>

        <!-- skills -->
        <h2>My skills</h2>
	       JavaScript, jQuery, Ajax <br>
	       Bootstrap, CSS, HTML<br>
	       Java, Framework Spring, Maven <br>
	       <br>
	        <a href="https://github.com/1ovety/" target="_blank"> ▶ Go Git</a>
        
        <br><br> 
        

    </div>



</body>
</html>