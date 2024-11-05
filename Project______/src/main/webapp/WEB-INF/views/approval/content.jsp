<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>기안 상세보기</title>

<style>
body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
            }

header{
 			background: #333;
            color: #fff;
            padding-top: 30px;
            padding-left: 20px;
            min-height: 80px;
           border-bottom: #e8491d 3px solid;
            
            }

        nav {
        background: #333;
            float: left;
            width: 150px;
            text-align: center;
            margin-top: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-left: 0px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2em;
        }
        main {
        margin-left: 150px;
        padding: 10px;
        
        }
        
		#center {
			text-align : center;
			width: 1000px;
			margin-left: auto;
			margin-right: auto;
			 padding: 50px;
			 
}
 
table{
 		width: 70%;
		text-align: center;
        margin:auto;
        border-collapse: collapse;
	
}

th, td {
  border: 1px solid #ddd; 
  padding: 8px; 
  text-align: center;
  font-weight: bold;
}

.kbutton{
			margin-right: 290px;
   			text-decoration-line: none;
  			 color: inherit; 

</style>
</head>
<body>

<header></header>
<div align= "center" id="center">
<h1>기안 상세보기</h1>
<hr style="width: 5% "></hr>
</div>


<hr style="width: 70% "></hr>
<table border="1">
	
	<tr><td>기안 종류</td><td>${dto.atype }</td></tr>
	<tr><td>작성자</td><td>${dto.userid}</td></tr>
	<tr><td>파일</td><td><a href="/approvaldownload/${dto.appnum}">${dto.name}</a></td></tr>
	
	
	</table><br>
	<hr style="width: 70% "></hr>
	
	<div class="kbutton" align= "right">
	<c:if test="${user.userid == dto.userid }">
	<button><a id="${dto.appnum}" href="#">글 삭제</a></button>
	</c:if>
	<button><a href="../list">목록 이동</a> </button>
	</div>
	



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function(){
		$("a[id]").click(function(){
			let appnum = $(this).attr("id");
			$.ajax({url:"/approval/delete", data:"appnum="+appnum, method:"delete"}
			).done(function(){
				location.href="/approval/list";
			})
			return false;
		})//click
	})//ready

</script>

</body>
</html>