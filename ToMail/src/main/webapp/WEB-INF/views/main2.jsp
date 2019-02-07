<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드 | 투메일</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- 글꼴 -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
   <!-- emoji -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
   <!-- sweetalert -->
   <script src="js/sweetalert2.all.min.js"></script>
   <script src="js/sweetalert2.min.js"></script>
   <link rel="stylesheet" href="js/sweetalert2.min.css">
   
<script type="text/javascript">
function pcok(){
   alert('데스크탑만 가능합니다.');
   Swal({
        type: 'error',
        title: '데스크탑만 가능합니다.'
      });
}

</script>

<style type="text/css">
h2{
   margin-top: 60px;
}
.row{
   padding: 10px 150px 10px 150px;
}
.card{
 border: 1px solid white;
}
.btn{
   width: 130px;
   background-color: #3879EA;
   color: white;
}

#mainword{
   color: #989A98;
   font-size: 14px;
}
.mobileonly{
   display: none;
   background-color: #E9ECEF;
}
@media screen and (max-width:768px){
.row{
   padding: 10px 10px 10px 10px;
}
.table{
   display: none;
}
.mobileonly{
   display: block;
   height: 273.14px;
   padding-top: 90px;
}
}
</style>   
</head>
<body>
   <%@ include file="header.jsp"  %>    
   <div class="container">
      <div class="row justify-content-center">
         <div align="center">
            <h2><b>환영합니다!</b></h2><br>
            <p>투메일은 누구나 쉽게 이메일을 만들고, 발송할 수 있는 서비스입니다.<br> 뭘 해야할지 잘 모르겠다면 우선
               아래 단계를 따라해보세요.</p>
         </div>
      </div><br>
      
      <div class="row justify-content-center " id="button">
         
         <div class="card col-sm" align="center">
            <div><img alt="" src="resources/img/main2-1.png"></div><br>
            <div class="btn col-sm" onclick="location.href='group_mail.do?email=${email }'">주소록 만들기</div><br>
            <p id="mainword">이메일 주소, 이름 등 이메일을<br>받을 사람의 정보를 등록합니다.</p>
         </div>
         <div class="card col-sm" align="center">
            <div><img alt="" src="resources/img/main2-2.png"></div><br>
            <div class="btn col-sm">이메일 만들기</div><br>
            <p id="mainword">이메일 제목, 콘텐츠 등을<br>작성하여 이메일을 만듭니다.</p>
         </div>
         <div class="card col-sm" align="center">
            <div><img alt="" src="resources/img/main2-3.png"></div><br>
            <div class="btn col-sm">임시 메일함</div><br>
            <p id="mainword">임시로 저장된 이메일을 확인하여<br>받을 사람의 정보를 등록합니다.</p>
         </div>   
      </div>
   </div><br><br><br>

   <div class="container">
      <div>
         <div><h5> 보낸 이력 확인하기</h5> </div><br>
      </div>
      <div class="mobileonly " align="center">
         <button class="btn" style="background-color: #FD3369; margin: 30px 0 30px 0;color: white;" onclick="pcok();">pc에서 확인</button>
      </div>
      <table class="table">
         <thead class="thead-light">
            <tr>
               <th>제목</th>
               <th>메일주소</th>
               <th>날짜</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>아니아아아아아아아ㅏ아아아아</td>
               <td>swan9405@naver.com</td>
               <td>1994.05.01</td>
            </tr>
            <tr>
               <td>아니아아아아아아아ㅏ아아아아</td>
               <td>swan9405@naver.com</td>
               <td>1994.05.01</td>
            </tr>
            <tr>
               <td>아니아아아아아아아ㅏ아아아아</td>
               <td>swan9405@naver.com</td>
               <td>1994.05.01</td>
            </tr>
         </tbody>
      </table>


   </div><br><br><br>


   <%@ include file="kakaoopenchat.jsp"  %>  
</body>
</html>