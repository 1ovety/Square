<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		
	* { margin: 0; padding: 0; }
	
	body { font-family: 'Noto Sans KR', sans-serif; height: 100%; font-size: 16px; letter-spacing: -1px; color: #444; white-space: normal; word-wrap: break-word; line-height: 1;}
	
	h1, h2, h3, h4, h5, h6 { font-weight: normal; font-size: inherit;}
	
	ul, ol, li { list-style: none; }

		
	img, fieldset, a {border: none;}
	img {vertical-align: middle;}
	input, select, textarea, button, form, img, label {vertical-align: middle;}

	#container { padding-bottom: 70px; }

    .about_area h2 {padding: 27px 0 25px; font-size: 20px; }
    .about_area h2 b{display: block; padding-top: 10px;}
    .about_area .about_box{background-color:bisque;}
    .about_area .writing_list li {float: none; width: 100%; margin: 0; box-sizing: border-box; padding: 0 20px; top: 0;}
    .about_area .writing_list p.txt {padding:10px 50px 30px; line-height: 1.4;}
    .about_area .writing_list li .view {padding-bottom: 10px; margin: 0 0 30px;}
    
    .about_area > h2 { padding: 55px 0 105px; text-align: center; font-size: 40px; }
	.about_area > .about_box { background-color:beige; }
	.about_area .writing_list > li { float: left; width: 32%; margin-left: 2%; text-align: center; position: relative; top: -50px; }
	.about_area .writing_list > li:first-child { margin-left: 0; }
	.about_area .writing_list > li .img_topwriting { width: 40%; }
	.about_area .writing_list > li > h3 { font-weight: bold; font-size: 18px; padding-top: 25px; color: #000; }
	.about_area .writing_list > li > p.txt { box-sizing: border-box; padding: 10px 30px 0; width: 100%; overflow: hidden; word-break: keep-all; line-height: 1.8; color: #666; }
	.about_area .writing_list > li > .view { display: inline-block; margin-top: 20px; padding-top: 5px; border-top: 2px solid #333; color: #555; }
    

</style>
</head>
<body>

<%@ include file="views/common/menubar.jsp" %>

 <!-- slide banner -->
    <div id="banner" class="carousel slide" data-ride="carousel" align="center" >
    
      <ul class="carousel-indicators">
        <li data-target="#banner" data-slide-to="0" class="active"></li>
        <li data-target="#banner" data-slide-to="1"></li>
        <li data-target="#banner" data-slide-to="2"></li>
      </ul>

      <div class="carousel-inner">

        <div class="carousel-item active">
          <a href="">
          <img src="resources/images/img_top2.jpg" alt="Event1" height="300px"></a>
        </div>

        <div class="carousel-item">
          <a href="">
          <img src="resources/images/img_top3.jpg" alt="Event2" height="300px"></a>
        </div>

        <div class="carousel-item">
            <a href="">
            <img src="resources/images/img_top5.jpg" alt="Event3" height="300px"></a>
          </div>

    </div>
    

      <a class="carousel-control-prev" href="#banner" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#banner" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    
    </div>
    <div id="container">
           <div class="about_area">
                <h2>Popular Posting<b>TOP 3</b></h2>
                <div class="about_box">
                    <ul class="writing_list box_inner clear">
                        <li><a href="<%= contextPath %>/profile.my"><img class="img_topwriting" src="resources/images/selfie.png" alt="information"></a><h3>About Taeyeon</h3><p class="txt">Who is she?</p><span class="view">VIEW</span></li>
                        <li><a href="#"><img class="img_topwriting" src="resources/images/selfie.png" alt="information" alt="project1"></a><h3>First Project</h3><p class="txt">What a perfect project!</p><span class="view">VIEW</span></li>
                        <li><a href="#"><img class="img_topwriting" src="resources/images/selfie.png" alt="information" alt="project2"></a><h3>Second Project</h3><p class="txt">Attention, What she did!</p><span class="view">VIEW</span></li>
                    </ul>
                </div>
            </div>
    </div>

<br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="views/common/footer.jsp" %>

</body>
</html>