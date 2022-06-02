<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	footer {
	border-top: 1px solid #ddd;
	}
	
	footer > .foot_area {
	position: relative; 
	padding-bottom: 40px;
	padding-left : 40px;
	}
	
	footer > .foot_area > .foot_list {
	padding-top: 25px;
	
	}
	
	footer > .foot_area > .foot_list > li {
	float: left;
	
	}
	
	footer > .foot_area > .foot_list > li:first-child::after {
	content: "|"; 
	display: inline-block; 
	padding: 0 10px; 
	font-size: 10px; 
	color: #000; 
	position: relative; 
	top: -2px;
	}
	
	footer > .foot_area > h2 {
	padding-top: 25px; 
	font-size: 14px; 
	color: #666;
	padding-left : 40px;
	}
	
	footer > .foot_area > .addr {
	padding-top: 5px; 
	line-height: 1.4; fo
	nt-size: 13px; 
	color: #666;
	padding-left : 40px;
	}
	
	footer > .foot_area > .addr > .space0 {
	letter-spacing: 0;
	}
	
	footer > .foot_area > .copy {
	padding-top: 3px; 
	font-size: 13px; 
	color: #666; 
	letter-spacing: 0;
	padding-left : 40px;
	}
	
	footer > .foot_area > .snslink { 
	position: absolute; 
	right: 20px; 
	top: 50px;
	}
	
	footer > .foot_area > .snslink > li { 
	float: left; 
	margin-left: 
	60px; 
	}
	
	footer > .foot_area > .snslink > li > a {
	display: block; 
	width: 50px; 
	height: 74px; 
	ext-indent: -9999px; 
	overflow: hidden; 
	background: url(resources/images/linkedin.png) no-repeat;

	}
	
	footer > .foot_area > .snslink > li  + li > a {
	background: url(resources/images/github.png) no-repeat;
	}
	
	footer > .foot_area > .snslink > li  + li + li > a {
	background: url(resources/images/instagram.png) no-repeat;
	}
	
	

</style>
</head>
<body>



<footer>

            <div class="foot_area box_inner">
                <ul class="foot_list clear">
                    <li><a href="#">Terms and conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
                <h2>Taeyeon Kim</h2>
                <p class="addr">Computer Programming T building <span class="gubun"></span> 
                <span class="br_line">Phone : <span class="space0">613-265-9943</span> <span class="gubun">/</span> 
                <span class="br_line">E-mail : <span class="space0">kim00451@algonquinlive.com</span>
                </span>
                </span>
                </p>
                <p class="copy box_inner">Copyright(c) Algonquin College all right reserved</p>
                <ul class="snslink">
                    <li><a href="https://www.linkedin.com/7-taeyeon-kim/ "></a></li>
                    <!--<a href="https://www.flaticon.com/free-icons/linkedin" title="linkedin icons">Linkedin icons created by Freepik - Flaticon</a>-->
                    <li><a href="https://github.com/1ovety/"></a></li>                 
                    <!-- <a href="https://www.flaticon.com/free-icons/github" title="github icons">Github icons created by riajulislam - Flaticon</a> -->
                    <li><a href="#"></a></li>
                    <!-- <a href="https://www.flaticon.com/free-icons/instagram" title="instagram icons">Instagram icons created by Pixel perfect - Flaticon</a> -->
                      
                </ul>
            </div>
        </footer>

</body>
</html>