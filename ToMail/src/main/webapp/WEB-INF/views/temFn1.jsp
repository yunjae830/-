<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
    var toolbar = [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'hr']],
        ['view', ['fullscreen', 'codeview']],
        ['help', ['help']]
    ];
            
    var setting = {
        height : 300,
        minHeight: null,
        maxHeight: null,
        focus : true,
        lang : 'ko-KR',    
        toolbar : toolbar
    };
            
    $('#summernote').summernote(setting);
    
});


function change(id){
	$('#myModalT').modal('show');
   }
function change2(id){
	$('#myModalT2').modal('show');
   }
function change3(id){
	$('#myModalT3').modal('show');
}
function change4(id){
	$('#myModalT4').modal('show');
}
function change5(id){
	$('#myModalT5').modal('show');
}
function change6(id){
	$('#myModalT6').modal('show');
}
function change7(id){
	$('#myModalT7').modal('show');
}
function change8(id){
	$('#myModalT8').modal('show');
}
function change9(id){
	$('#myModalT9').modal('show');
}
function change10(id){
	$('#myModalT10').modal('show');
}
function change11(id){
	$('#myModalT11').modal('show');
}
function change12(id){
	$('#myModalT12').modal('show');
}
</script>
