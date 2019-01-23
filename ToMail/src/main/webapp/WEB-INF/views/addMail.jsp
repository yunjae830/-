<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>

<body>

<div class="jumbotron jumbotron-fluid" style="margin-top:100px;">
  <div class="container">
  
  <h1>${title }</h1>
  
  <form action="addMail.do" method="post">
  
  <div class="form-group">
  	<label>수신인</label>
  	<input class="form-control" name="recipient"/>
  </div>
  
  <div class="form-group">
  	<label>제 목</label>
  	<input class="form-control" name="title"/>
  </div>
  
  <div class="form-group">
  	<label>내 용</label>
  	<textarea class="form-control" name="content" rows="5"></textarea>
  </div>
  
  <button type="submit" class="btn btn-default">Post</button>
  <button type="reset"  class="btn btn-primary">Reset</button>
  	
  </form>
  </div>
</div>
</body>
</html>