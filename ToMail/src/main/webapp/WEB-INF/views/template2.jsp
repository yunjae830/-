<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일폼</title>
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
		
		if(operation === 'deleteMail') {
			
			if(confirm("Are you sure you want to delete this email?")){
			formObj.attr("action", "/board/mailbox/deleteMail");
			} else {
				return;
			}
			
		} else if(operation === 'getList') {
			formObj.attr("action", "/board/mailbox/getList").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var mnoTag = $("input[name='mno']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(mnoTag)
			
		} 
		
		formObj.submit();
	});
	
	
	$("#previewBtn").on("click", function(preview, callback, error){
		
		console.log("preview btn clicked")
		
		var formObj = $("form");
		var bno = "<c:out value='${mail.bno}'/>";
		var mno = "<c:out value='${mail.mno}'/>";
		var table = $("table");
		
		var preview = {
				title1: table.find("input[name='title1']").val(),
				title2: table.find("textarea[name='title2']").val(),
				text1: table.find("textarea[name='text1']").val(),
				text2: table.find("textarea[name='text2']").val(),
				text3: table.find("textarea[name='text3']").val(),
				link1: table.find("input[name='link1']").val(),
				link2: table.find("input[name='link2']").val(),
				link3: table.find("input[name='link3']").val(),
				template: table.find("input[name='template']").val()
				
		}
		
		
		$.ajax({
			type: 'put',
			url:"/board/mailbox/preview?bno="+bno+"&mno="+mno,
			data: JSON.stringify(preview),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				alert("updated!");
				console.log(result);
				showPreview();
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
		
	});
	
	var table = $("table");

	function showPreview(){
		var bno = "<c:out value='${mail.bno}'/>";
		var mno = "<c:out value='${mail.mno}'/>";
		var title1 = $("input[name='title1']").val();
		var title2 = $("textarea[name='title2'").val();
		var text1 = $("textarea[name='text1']").val();
		var text2 = $("textarea[name='text2']").val();
		var text3 = $("textarea[name='text3']").val();
		var link1 = $("input[name='link1']").val();
		var link2 = $("input[name='link2']").val();
		var link3 = $("input[name='link3']").val();
		
		$.getJSON("/board/mailbox/showPreview",{bno:bno, mno:mno},
		function(){
			console.log("showPreview");
			$(".title1").text(title1);
			$(".title2").text(title2);
			$(".text1").text(text1);
			$(".text2").text(text2);
			$(".text3").text(text3);
			$(".link1").attr('href', link1);
			$(".link2").attr('href', link2);
			$(".link3").attr('href', link3);
		});
		
	};
	
});
	
</script>
</head>
<body>
<div class="container-fluid">
<div class="row">
<div class="col-sm-6" style="margin-top: 30px; align:center;">
<form role="form" action="/board/mailbox/updateMail" method="post">
<table>
   <tr>
      <td style="position: relative;">
      <img alt="" src="/board/resources/img/personal.png" style=" width: 570px; height: 330px; background-size: 100% 100%; margin: 10px 15px 10px 15px; position: relative;">
      <div><h1 align="center"><b><input type="text" name="title1" value="${mail.title1 }" placeholder="Your title!"></b></h1>
         <h3 align="center" id="text-block"><textarea name="title2">${mail.title2 }</textarea></h3>
      </div>
      </td>
   </tr>
      <tr>
         <td align="center"><input type="text" name="link1" value="${mail.link1 }" placeholder="Type into URL here!"/>
         <a href="#" style="background-color: #040047; -moz-border-radius: 42px; -webkit-border-radius: 42px; border-radius: 42px; display: inline-block; cursor: pointer; color: #ffffff; font-family: Arial; font-size: 15px; padding: 12px 53px; text-decoration: none; text-shadow: 0px 0px 0px #2f6627;">버튼</a>
         </td>
      </tr>
      <tr>
         <td style="width: 570px; padding: 0px 30px 0px 15px;"><hr></td>
      </tr>
      <tr>
         <td><img alt="" src="/board/resources/img/personal.png"
            style="width: 285px; height: 190px; background-size: 100% 100%; margin: 10px 5px 10px 10px; position: relative;">
            <textarea rows="2" cols="2" name="text1"
               style="width: 280px; height: 185px; background-size: 100% 100%; margin: 10px 10px 10px 0px; border-color: white; font-size: 15px;">${mail.text1 }</textarea>

         </td>
      </tr>
      <tr>
         <td><textarea rows="2" cols="2" name="text2"
               style="width: 280px; height: 185px; background-size: 100% 100%; margin: 0px 5px 10px 10px; border-color: white; font-size: 15px;">${mail.text2 }</textarea>
            <img alt="" src="/board/resources/img/personal.png"
            style="width: 285px; height: 190px; background-size: 100% 100%; margin: 0px 10px 10px 0px; position: relative;">
         </td>
      </tr>
      <tr>
         <td><img alt="" src="/board/resources/img/personal.png"
            style="width: 285px; height: 190px; background-size: 100% 100%; margin: 10px 5px 10px 10px; position: relative;">
            <textarea rows="2" cols="2" name="text3"
               style="width: 280px; height: 185px; background-size: 100% 100%; margin: 10px 10px 10px 0px; border-color: white; font-size: 15px;">${mail.text3 }</textarea>

         </td>
      </tr>
      <tr>
         <td style="width: 570px; padding: 0px 30px 0px 15px;"><hr></td>
      </tr>
      <tr>
         <td>
            <div align="center"style="background-color: #040047; width: 570px; height: 60px; background-size: 100% 100%; margin: 10px 15px 10px 15px; padding: 20px 0 20px 0; vertical-align: center;">
               <a style="font-size: 18px; color: white;"><fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/></a><br> 
               <b style="font-size: 28px; color: white;"></b>
            </div>

         </td>
      </tr>
      <tr>
         <td>
            <div align="center" style='display: inline;line-height:60px; min-width: 600px;'>
               <div
                  style="display: inline; float: left; background-color: #005DC9; color: white; width: 280px; height: 60px; margin: 0px 10px 10px 15px; cursor: pointer;">
                  <input type="text" name="link2" value="${mail.link2 }" placeholder="Facebook URL"/></div>
               <div
                  style="display: inline; float: left; background-color: black; width: 280px; height: 60px; margin: 0px 15px 10px 0px; color: white; cursor: pointer;">
                  <input type="text" name="link3" value="${mail.link3 }" placeholder="Instagram URL"/></div>
            </div>
         </td>
      </tr>
      <tr>
         <td>
            <div align="center" style="margin-top: 10px; margin-bottom: 10px;">
               <img alt="" src="/board/resources/img/home.png" width="32px" style="padding-right: 15px;">
            </div>
         </td>
      </tr>
      <tr>
         <td>
         <div align="center">
             <small style="padding-right: 15px; color: #8C8C8C;">이 이메일은 투메일로 작성되었습니다.</small>
          </div>
         </td>
      </tr>
   </table>
   
  <input type="hidden" name="bno" value="<c:out value="${mail.bno }"/>"/>
  <input type="hidden" name="pageNum" value="1"/>
  <input type="hidden" name="amount" value="5"/>
  <input type="hidden" name="mno" value="<c:out value="${mno }"/>"/>
  <input type="hidden" name="template" value="2"/>
  
  <div align="right">
  <br>
  <br>
  <br>
  <input type="button" id="previewBtn" class="btn btn-default" value="Preview"/>
  <button type="submit" class="btn btn-default">Send!</button>
  <button type="submit" data-oper="deleteMail" class="btn btn-danger">Delete</button>
  <button type="submit" data-oper="getList" class="btn btn-primary">To List</button>
  </div>
  <br>
  <br>
   </form>
   
   
</div>

<!-- -----------------------------------------------------------------------------------------------------------------  -->
  

<div class="col-sm-6" style="margin-top:30px; align:center;">

<table style="width: 600px">
   <tr>
      <td style="position: relative;">
      <img alt="" src="/board/resources/img/personal.png" style=" width: 570px; height: 330px; background-size: 100% 100%; margin: 10px 15px 10px 15px; position: relative;">
      <div><h1 align="center" class="title1"><b>${mail.title1}</b></h1>
         <h3 align="center" id="text-block" class="title2">${mail.title2 }</h3>
      </div>
      </td>
   </tr>
      <tr>
         <td align="center">
         <a class="link1" href="${mail.link1 }" style="background-color: #040047; -moz-border-radius: 42px; -webkit-border-radius: 42px; border-radius: 42px; display: inline-block; cursor: pointer; color: #ffffff; font-family: Arial; font-size: 15px; padding: 12px 53px; text-decoration: none; text-shadow: 0px 0px 0px #2f6627;">버튼</a>
         </td>
      </tr>
      <tr>
         <td style="width: 570px; padding: 0px 30px 0px 15px;"><hr></td>
      </tr>
      <tr>
         <td>
         <img alt="" src="/board/resources/img/personal.png"
            style="width: 285px; height: 190px; background-size: 100% 100%; margin: 10px 5px 10px 10px; position: relative;">
            <span class="text1"
               style="display: inline-block; word-wrap: break-word; width: 280px; height: 185px; background-size: 100% 100%; margin: 10px 10px 10px 0px; border-color: white; font-size: 15px;">
               ${mail.text1 }</span>
         </td>
      </tr>
      <tr>
         <td><span class="text2"
               style="display: inline-block; word-wrap: break-word; width: 280px; height: 185px; background-size: 100% 100%; margin: 0px 5px 10px 10px; border-color: white; font-size: 15px; word-wrap:break-word;">${mail.text2 }</span>
            <img alt="" src="/board/resources/img/personal.png"
            style="width: 285px; height: 190px; background-size: 100% 100%; margin: 0px 10px 10px 0px; position: relative;" align="right">
         </td>
      </tr>
      <tr>
         <td><img alt="" src="/board/resources/img/personal.png"
            style="width: 285px; height: 190px; background-size: 100% 100%; margin: 10px 5px 10px 10px; position: relative;">
            <span class="text3"
               style="display: inline-block; word-wrap: break-word; width: 280px; height: 185px; background-size: 100% 100%; margin: 10px 10px 10px 0px; border-color: white; font-size: 15px; word-wrap: break-word;">${mail.text3 }</span>

         </td>
      </tr>
      <tr>
         <td style="width: 570px; padding: 0px 30px 0px 15px;"><hr></td>
      </tr>
      <tr>
         <td>
            <div align="center"style="background-color: #040047; width: 570px; height: 60px; background-size: 100% 100%; margin: 10px 15px 10px 15px; padding: 20px 0 20px 0; vertical-align: center;">
               <a style="font-size: 18px; color: white;"><fmt:formatDate value="${mail.regdate }" pattern="yyyy-MM-dd"/></a><br> 
               <b style="font-size: 28px; color: white;"></b>
            </div>

         </td>
      </tr>
      <tr>
         <td>
            <div align="center" style='display: inline;line-height:60px; min-width: 600px;'>
               <div class="link2"
                  style=" display: inline; float: left; background-color: #005DC9; color: white; width: 280px; height: 60px; margin: 0px 10px 10px 15px; cursor: pointer;" onclick="location.href='${mail.link2}'">Facebook</div>
               <div class="link3"
                  style="display: inline; float: left; background-color: black; width: 280px; height: 60px; margin: 0px 15px 10px 0px; color: white; cursor: pointer;" onclick="location.href='${mail.link3}'">Instagram</div>
            </div>
         </td>
      </tr>
      <tr>
         <td>
            <div align="center" style="margin-top: 10px; margin-bottom: 10px;">
               <img alt="" src="/board/resources/img/home.png" width="32px" style="padding-right: 15px;">
            </div>
         </td>
      </tr>
      <tr>
         <td>
         <div align="center">
             <small style="padding-right: 15px; color: #8C8C8C;">이 이메일은 투메일로 작성되었습니다.</small>
          </div>
         </td>
      </tr>
   </table>

</div>

</div>
</div>
</body>
</html>