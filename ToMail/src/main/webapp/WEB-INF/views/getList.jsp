<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boards</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	
	var actionForm = $("#actionForm");
	var addForm = $("#addForm");
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.find("input[name='template']").val($(this).attr("title"));
		actionForm.submit();
	});
	
	$('#regBtn').on("click", function(e){
		e.preventDefault();
		addForm.attr("action", "testess.do");
		addForm.submit();
	});
 	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action", "updateMail");
		actionForm.submit();
	});
	
});

</script>

<style type="text/css">
.card{
	width: 200px;
	height: 500px;
}


</style>

</head>
<body>
   <%@ include file="header.jsp"  %>   
	<br>
	<div class="container mt-3" style="margin-top:100px;">
	  	<h2>Your mailbox</h2><br/>
  		<p>Please select one you have already made.</p>
	<div class="row">
  		

  		<div class="d-flex flex-wrap bg-light">
  		<c:forEach items="${list }" var="mail">
  		<div class="p-2 border">
	  		<div class="card">
	    		<img class="card-img-top" src="resources/img/template<c:out value="${mail.template }"/>.png" alt="Card image" style="width:100%;">
	      			<div class="card-body">
	      				<h4 class="card-title">${mail.title }</h4>
	      				<p style="overflow:hidden;"class="card-text">
	      				<fmt:formatDate pattern="yyyy-MM-dd" value="${mail.regdate }"/>
	      				</p>
	      				<a href="${mail.bno }" class="move btn btn-primary btn-block" style="align-self:flex-end;">See detail</a>
	      			</div>
	      	</div>
      	</div>
      	</c:forEach>
      	</div>
      </div>
     </div>
    	
  	<div class="container" style="margin-top: 40px;">
  		
  			<div class="row">
  				<ul class="pagination">
  					<c:if test="${pageMaker.prev }">
    				<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
    				</c:if>
    				
    				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
    				<li class="page-item <c:if test="${pageMaker.cri.pageNum == num }">active</c:if>"><a class="page-link"  href="${num }">${num }</a></li>
    				</c:forEach>
    				<c:if test="${pageMaker.next }">
    				<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
    				</c:if>
  				</ul>
  			</div>
  			
  		<div class="row">
  			<form id="actionForm" action="getList" method="get">
  				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
  				<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
  				<input type="hidden" name="email" value="${email}"/>
  			</form>
  		 	<form id="addForm" action="addMail" method="post">
  				<input type="hidden" name="email" value="${email}"/>
  			</form>
  		<button class="btn btn-success" id="regBtn">Add</button>
  		<button class="btn btn-primary" onclick="location.href='main2.do'">Back to home</button>
  		</div>
	</div>
	<br><br><br><br>

</body>
</html>