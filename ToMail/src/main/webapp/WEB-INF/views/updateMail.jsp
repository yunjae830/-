<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.title }</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		/* if(operation === 'deleteMail') {
			formObj.attr("location.href", "deleteMail.do");
		}*/
		
		if(operation === 'getList') {
			formObj.attr("action", "getList.do").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
		} 
		formObj.submit();
	});
});

</script>

<body>

<div class="jumbotron jumbotron-fluid" style="margin-top:100px;">
  <div class="container">
  
  <form method="post">
  
  <div class="form-group">
  	<label>Board Number</label>
  	<input class="form-control" name="bno" value='<c:out value="${mail.bno }"/>' readonly="readonly"/>
  </div>
  
  <div class="form-group">
  	<label>Recipient</label>
  	<input class="form-control" name="recipient" value='<c:out value="${mail.recipient }"/>'/>
  </div>
  
  <div class="form-group">
  	<label>Title</label>
  	<input class="form-control" name="title" value='<c:out value="${mail.title }"/>'/>
  </div>
  
  <div class="form-group">
  	<label>Text Area</label>
  	<textarea class="form-control" name="content"><c:out value="${mail.content }"/></textarea>
  </div>
  
  <div class="form-group">
  	<label>Date</label>
  	<label><fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/></label>
  	
  </div>
  
  <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum }"/>"/>
  <input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>"/>
  <input type="hidden" name="type" value="<c:out value="${cri.type }"/>"/>
  <input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>"/>
  
  <button type="submit" data-oper="updateMail" class="btn btn-default">Update</button>
  <button type="button" onclick="location.href='deleteMail.do?bno=<c:out value="${mail.bno }"/>'"  class="btn btn-danger">Delete</button>
  <button type="submit" data-oper="getList" class="btn btn-primary">To List</button>
	
  	
  </form>
  </div>
</div>
</body>
</html>