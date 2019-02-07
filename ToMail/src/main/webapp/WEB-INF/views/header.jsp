<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
   
<style type="text/css">

html{
   overflow-x: hidden;
}
body{
   font-family: 'Nanum Gothic', sans-serif;
}
.navbar {
   min-height: 60px;   
   border-bottom: 2.5px solid #F4F4F5;
}

.navbar-brand {
   padding-top: 0;
}
.navbar-light .navbar-nav .active>.nav-link{
   padding-left: 80px;
   padding-top: 10px;
   color: #B4B4B4;
   }
.dropdown-menu.show {
   margin-top: 17px;
}   
.dropdown-menu{
    width: 250px !important;
}
#user{
   padding-right: 100px;   
}
i{
   cursor: pointer;
}
i, i:link{
   color: #808080
}
#mobile{
   display: none;
}
@media screen and (max-width:768px){
#user{
   padding-right: 0px;
}   
.dropdown{
    display: none;
   
}
#mobile{
   display: block;
}
}
   
   
   </style>
</head>
<body>
   <nav class="navbar navbar-expand-md navbar-light">
      <div class="container">
         <a class="navbar-brand" href="main2.do"><img alt="tomail"
            src="resources/img/logo_tomail_font.png" width="100px"></a>

         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav text-right"><br>
               <li class="nav-item active" id="mobile"><strong>${email }</strong></li><br>
               <li class="nav-item active"><a class="nav-link" href="#">임시 메일함</a></li>
               <li class="nav-item active"><a class="nav-link" href="group_mail.do?email=${email }">주소록</a></li>
               <li class="nav-item active"><a class="nav-link" href="helpform.do?email=${email }">도움말</a>
               
               <li class="nav-item active" id="mobile"><a class="nav-link" href="#" onclick="location.href='update1.do?email=${email}'">계정관리</a></li>
               <li class="nav-item active" id="mobile"><a class="nav-link" href="#">고객사례</a></li>
               <li class="nav-item active" id="mobile"><a class="nav-link" href="#" onclick="location.href='helpform.do?email=${email}'">도움말</a></li>
               <li class="nav-item active" id="mobile"><a class="nav-link" href="#" onclick="location.href='logout.do'">로그아웃</a></li>
            </ul>
         </div>
         <div id="a" class="dropdown justify-content-end text-right" data-toggle="dropdown">
            <a id="user" class="">
               <i class="fas fa-user"></i>
            </a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="#" style="margin-top: 10px;"><b>${email }</b></a><hr>
               <a class="dropdown-item" href="#" onclick="location.href='update1.do?email=${email}'">계정관리</a> 
               <a class="dropdown-item" href="#">고객사례</a> 
               <a class="dropdown-item" href="#" onclick="location.href='helpform.do?email=${email}'">도움말</a>
               <a class="dropdown-item" href="#" onclick="location.href='logout.do'">로그아웃</a>
            </div>
         </div>

      </div>
   </nav>
   
</body>
</html>