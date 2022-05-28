<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="views/common/menubar.jsp" %>

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