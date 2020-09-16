<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<html>
<head>
	<title>해야할일</title>
	<style>
		#section{
			position : absolute;	
			top: 20%;
			left: 20%;
			border : solid 1px gray;
		}
		.typo{
			text-align : left;
			background-color:black;
			color:white;
			padding: 10px;
			margin:5px;
			width:200px;
		}
		.list{float:left;
			  clear:right;
		}
		.content{
			background-color:#CEE5EF;
			padding: 10px;
			margin:5px;
			width:200px;
			font-size:5px;
			height:40px;
			line-height : 200%;
		}
		a{
			text-decoration: none;
			color:white;
		}
		#nav{
			background-color:blue;
			float:right;
			width: 100px;
			height: 20px;
			text-align: center;
			line-height: 2;
			font-size: 10px;
		}
	</style>
	<script>
	 var token= function(){
		
		var arrTypo =["TODO","DOING","DONE"]
		$.ajax({
			url : "ajax",
			type: "POST",
			dataType :"json",
			success : function(datas){
		
			strHTML = "<div id='nav'> <a href='insertForm'> 새로운 TODO등록</a></div>";
		for(var i = 0; i<3;i++){
			strHTML += "<div class='list'>";
			strHTML += "<div class='typo'>"+arrTypo[i]+" </div>"
				$.each(datas,function(index,item)
				{
					if(item.typo == arrTypo[i]){
					strHTML += "<div class='content'><font size='3px' b>"+item.title+ "</font></br>"+
					"등록날짜:"+item.regisdate+","+item.names+","+"우선순위"+item.seqs;
					if(item.typo != arrTypo[2]){
					strHTML += "<button  class='button' value="+"'"+item.ids+"'"+" onclick='myFunction("+item.ids+")'>";
					strHTML += "<img src='https://previews.123rf.com/images/"
				    strHTML += "get4net/get4net1709/get4net170901354/86307988-%"
				    strHTML += "EC%98%A4%EB%A5%B8%EC%AA%BD-%ED%99%94%EC%82%B4%ED%91%9C.jpg' height='5px' width='3px'>";
					strHTML += "</button>";
					}
					strHTML +="</div>"
					;}
				});
			strHTML += "</div>";
		$("#section").html(strHTML);
		}
			},
			error: function(){
				alert("err");					
			}
		});}
	
	
		$(function(){
			token();
		});
		
		
		function myFunction(s){
			var arrTypo =["TODO","DOING","DONE"]
			$.ajax({
				url : "update",
				type: "POST",
				dataType :"json",
				data: {"ids":s},
				success : function(datas){
				
				strHTML = "<div id='nav'> <a href='insertForm'> 새로운 TODO등록</a></div>";
			for(var i = 0; i<3;i++){
				strHTML += "<div class='list'>";
				strHTML += "<div class='typo'>"+arrTypo[i]+" </div>"
					$.each(datas,function(index,item)
					{
						if(item.typo == arrTypo[i]){
						strHTML += "<div class='content'><font size='3px' b>"+item.title+ "</font></br>"+
						"등록날짜:"+item.regisdate+","+item.names+","+"우선순위"+item.seqs;
						if(item.typo != arrTypo[2]){
						strHTML += "<button  class='button' value="+"'"+item.ids+"'"+" onclick='myFunction("+item.ids+")'>";
						strHTML += "<img src='https://previews.123rf.com/images/get4net/get4net1709/get4net170901354/86307988-%EC%98%A4%EB%A5%B8%EC%AA%BD-%ED%99%94%EC%82%B4%ED%91%9C.jpg' height='5px' width='3px'>";
						strHTML += "</button>";
						}
						strHTML +="</div>"
						;}
					});
				strHTML += "</div>";
			$("#section").html(strHTML);
			}
				},
				error: function(){
					alert("err");					
				}
			});
		};
		
	</script>	
	
</head>
<body>
<div id= wrap> 

<div id = "section">
</div>

</div>

</body>
</html>
