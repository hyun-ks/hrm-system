<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>기안 상세보기</title>
<style>
 body {
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

.kbutton{
			margin-right: 290px;
   			text-decoration-line: none;
  			 color: inherit; 
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

			
</style>
</head>
<body>

<header></header>


<div align= "center" id="center">
<h1 align = "center">기안 확인</h1>
<hr style="width: 6% "></hr><br>
</div>

<hr align = "center"style="width: 70% "></hr><br>
<table border="1">	
	<tr><td>기안 종류 </td><td>${dto.atype }</td></tr>
	<tr><td>작성자</td><td>${dto.userid}</td></tr>
	<tr><td>파일</td><td><a href="/approvaldownload/${dto.appnum}">${dto.name}</a></td></tr>
	
</table><br>
<hr align = "center"style="width: 70% "></hr><br>
	<div class="kbutton" align= "right">
	<button><a href="../list">목록 이동</a></button>
	
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>