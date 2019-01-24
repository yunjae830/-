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
<script type="text/javascript" src="../js/reply.js"></script>

<script type="text/javascript">

$(document).ready(function(){

	var bnoValue = '<c:out value="${mail.bno}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page){
		
		console.log("show list: " + page);
		
		replyBiz.getList({bno:bnoValue, page: page|| 1}, function(replyCnt, list) {
			
			console.log("replyCnt:" + replyCnt);
			console.log("list: " + list);
			console.log(list);
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str="";
			
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
			
			for(var i = 0, len = list.length || 0; i < len; i++ ){
				str +="<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str +=" <div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
				str +=" <small class='pull-right text-muted'>" + replyBiz.displayTime(list[i].replyDate) + "</small></div>";
				str +=" <p>" + list[i].reply + "</p></div></li>";
			}
			replyUL.html(str);
			
			showReplyPage(replyCnt);
		}); // end function
	} // end showList();
	
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	var modalCloseBtn = $("#modalCloseBtn");
	
	$("#addReplyBtn").on("click", function(e){
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	
	modalRegisterBtn.on("click", function(e){
		
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
		};
		
		replyBiz.add(reply, function(result){
			
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			//showList(1); 등록 후 첫번째로 이동
			showList(-1); // 등록 후 마지막 페이지로 이동
			
		});
		
	});
	
	$(".chat").on("click", "li", function(e){
		var rno = $(this).data("rno");
		console.log(rno);
		replyBiz.get(rno, function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyBiz.displayTime(reply.replyDate))
			.attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	
	modalModBtn.on("click", function(e){
		var reply = {rno: modal.data("rno"), reply: modalInputReply.val()};
		replyBiz.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		replyBiz.remove(rno, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	modalCloseBtn.on("click", function(e){
		modal.modal("hide");
	});
	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='" + (startNum -1) + "'>Previous</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++){
			
			var active = pageNum == i ? "active" : "";
			
			str += "<li class='page-item'" + active + "'>";
			str += "<a class='page-link' href='" + i + "'>" + i + "</a></li>";
			
		}
		
		if(next){
			str += "<li class='page-item'>";
			str += "<a class='page-link' href='" +(endNum + 1)+ "'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
		
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
		
	});
	
	

	
});

/* 
replyBiz.getList({bno: bnoValue, page: 1}, function(list){
	
	for(var i = 0, len = list.length||0; i < len; i++){
		console.log(list[i])
	}
});
 */
// for replyBiz add test
/* 
replyBiz.add(
		{reply:"JS TEST", replyer:"tester", bno:bnoValue},
		function(result){
			alert("Result: " + result);
		}
	);

 */
/*  
 // delete test
 replyBiz.remove(17, function(count){
	console.log(count);
	if(count === "success"){
		alert("Removed");
		}
	}, function(err){
		alert('Error...');
	});
  */
/*  
 // update
 replyBiz.update({
	 rno: 16, 
	 bno: bnoValue, 
	 reply: "Modified reply...." 
	}, 
	 function(result){ 
		alert("Update completed...");
		
	});
  */
/*  
 replyBiz.get(10, function(data){
	console(); 
 });
 */ 
</script>

<script type="text/javascript">

$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='updateMail']").on("click", function(e){
		operForm.attr("action", "updateMail.do").submit();
	});
	
	$("button[data-oper='getList']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "getList.do");
		operForm.submit();
	});
	
});
	
</script>

<body>

<div class="jumbotron jumbotron-fluid" style="margin-top:100px;">
  <div class="container">
  	<div class="panel panel-default">
  		<div class="panel-heading">Board Read Page</div>
  				<!-- start panel body -->
  			<div class="panel-body">
  				
  				<div class="form-group">
  					<label>Board Number</label>
  					<input class="form-control" name="bno" value='<c:out value="${mail.bno }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">			
  					<label>Recipient</label>
  					<input class="form-control" name="name" value='<c:out value="${mail.recipient }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">
  					<label>Title</label>
  					<input class="form-control" name="title" value='<c:out value="${mail.title }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">
  					<label>Text Area</label>
  					<textarea class="form-control" name="content" readonly="readonly"><c:out value="${mail.content }"/></textarea>
				</div>	
  
  				<div class="form-group">
  					<label>Date</label>
  					<input class="form-control" name="regdate" value='<fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/>' readonly="readonly"/>
  	
  				</div>
  				
  			</div>
  			
  			  		<button class="btn btn-default" data-oper="updateMail">Update</button>
  					<button class="btn btn-primary" data-oper="getList">To List</button>
  			
  				<form id='operForm' method="get">
  					<input type="hidden" id="bno" name="bno" value='<c:out value="${mail.bno }"/>'/>
  					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum }"/>"/>
  					<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>"/>
					<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>"/>
					<input type="hidden" name="type" value="<c:out value="${cri.type }"/>"/>
  				</form>
  				<!-- end panel-body -->
  	</div>
  <!-- end panel -->
  </div>
  <!-- end container -->
</div>
<!-- end jumbo -->

<div class="container">
	<div class="col-lg-12">
	<!-- start panel -->
		<div class="panel panel-default">
		<!-- start panel heading -->
			<div class="panel-heading">
			Reply<button id='addReplyBtn' class='btn btn-primary btn-sm'>New Reply</button>
			</div>
		<!-- end heading -->
		<!-- start panel body -->
		<div class="panel-body">
			<ul class="chat">
			<!-- start reply -->
			<!-- end reply -->		
			</ul>
			<!-- end ul -->
		</div>
		<!-- end body -->
		<!-- start panel-footer -->
		<div class="panel-footer">
		
		</div>
		<!-- end panel-footer -->			
		</div>
		<!-- end panel -->
	</div>
</div>

<div class="container">
  <div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          	<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
        	<div class="form-group">
        		<label>Reply</label>
        		<input class="form-control" name="reply" value="New Reply"/>
        	</div>
        	<div class="form-group">
        		<label>Replier</label>
        		<input class="form-control" name="replyer" value="replyer"/>
        	</div>
        	<div class="form-group">
        		<label>Reply Date</label>
        		<input class="form-control" name="replyDate" value=""/>
        	</div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
          <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
          <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
          <button id="modalCloseBtn" type="button" class="btn btn-close">Close</button>
        </div>
      </div>
    </div>
  </div>
  
</div>

</body>
</html>