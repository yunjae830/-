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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
//	history.replaceState({}, null, null);
	
	function checkModal(result){
		if(result === '' || history.state) {
			return;
		}
		if(parseInt(result) > 0){
			$(".modal-body").html("Number " + parseInt(result) + " is posted.");
		}
		$("#myModal").modal("show");
	}
	
	
	
	var actionForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$('#regBtn').on("click", function(){
		self.location = "/board/mailbox/addMail";
	});
	
	$("#updateBtn").on("click", function(e){
		e.preventDefault();
		actionForm.append("")
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action", "/board/mailbox/getMail");
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요.");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
	
});

</script>
</head>
<body>
	
	<div class="container" style="margin-top:100px;">
  		<h2>Basic Table</h2>
  			<p>The .table class adds basic styling (light padding and horizontal dividers) to a table:</p>            
  		<table class="table">
    		<thead>
      			<tr>
        			<th>#</th>
        			<th>받는 사람</th>
        			<th>제 목</th>
        			<th>작성일</th>
      			</tr>
    		</thead>
    		<tbody>
    		
    		<c:forEach items="${list }" var="mail">
      			<tr>
        			<td><c:out value="${mail.bno }"/></td>
        			<td><c:out value="${mail.recipient}"/></td>
        			<td>
        			<a class="move" href="${mail.bno }"> ${mail.title }</a>
        			</td>
        			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mail.regdate }"/></td>
      			</tr>
    		</c:forEach>
    		</tbody>
  		</table>
  		
  		<div class="row">
  			<div class="col-lg-12">
  				<form id="searchForm" action="/board/mailbox/getList" method="get">
  					<select name='type'>
  						<option value="" <c:out value="${pagemaker.cri.type == null ? 'selected' : '' }"/>>--</option>
  						<option value="T" <c:out value="${pagemaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
  						<option value="C" <c:out value="${pagemaker.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
  						<option value="R" <c:out value="${pagemaker.cri.type eq 'N' ? 'selected' : '' }"/>>수신자</option>
  						<option value="TC" <c:out value="${pagemaker.cri.type eq 'TC' ? 'selected' : '' }"/>>제목 or 내용</option>
  						<option value="TR" <c:out value="${pagemaker.cri.type eq 'TN' ? 'selected' : '' }"/>>제목 or 수신자</option>
  						<option value="TRC" <c:out value="${pagemaker.cri.type eq 'TNC' ? 'selected' : '' }"/>>제목 or 내용 or 수신자</option>
  					</select>
  					<input type="text" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>"/>
  					<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum }'/>"/>
  					<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount }'/>"/>
  					<button class="btn btn-default">Search</button>
  				</form>
  			</div>
  		</div>
  		
  		
  	<div class="container">
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
  			
  			<form id="actionForm" action="/board/mailbox/getList" method="get">
  				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
  				<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
  				<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type }"/>"/>
  				<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword }"/>"/>
  			</form>
	</div>
  		<button id="regBtn">Add</button>
  		<button onclick="location.href='#'">Back to home</button>
</div>

<div class="container">
  <!-- Button to Open the Modal -->
 <!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Open modal</button> -->
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
         Process is done!
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  
</div>

</body>
</html>