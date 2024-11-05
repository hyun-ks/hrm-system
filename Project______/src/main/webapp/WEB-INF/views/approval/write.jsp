<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
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
       header {
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

table {
        width: 60%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
        margin-left:auto; 
        margin-right:auto;
        
      }
      

      td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

	th {
  padding: 8px;
  text-align: left;
  text-align: center;
  border-top: 2px solid #000;
  border-bottom: 2px solid #000;
  color: #000;
}


 		#list{
			 text-align: center;
   			text-decoration-line: none;
  			 color: inherit; 
  			 }
  			.bbutton{
  			 margin-right: 380px;
  			}
	
</style>
</head>
<body>

<header></header>

<div align= "left" id="center">
		<h1>기안 등록 </h1>
		<h5>*기안 등록을 원하시면 작성 해 주세요!</h5>
		<hr style="width: 10% "></hr><br>
		</div>
		
<form method="post" enctype="multipart/form-data"id="writeform">
<hr style="width: 60%"></hr>

<div class="orange">
	<table border="1">
		<tr>
			<td>기안 종류</td>
			<td><select name="num">
				<c:forEach items="${type}" var="t">
					<option value="${t.num}">${t.atype}</option>
				</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input name="userid" value="${user.userid}" readonly></td>
		</tr>
		<tr>
		<td><label for="startdate">시작 날짜</label></td>
        <td><input  type="date" id="list" name="startdate"></td>
        </tr>
        <tr>	
        <td><label for="enddate">종료 날짜</label></td>
        <td><input   type="date" id="list" name="enddate"></td>
		</tr>
		<tr>
		<td >자료</td>
		<td><input type="file" name="file"></td>
		</tr>
		
		<tr>
		<td class ="orange">결제자</td>
      <td><select name="approval_1">
       <c:forEach items="${name}" var="n">
      <option value="${n.userid}">${n.em_name}</option>
      </c:forEach>
      </select>
      <select name="approval_2">
       <c:forEach items="${name}" var="n">
      <option value="${n.userid}">${n.em_name}</option>
      </c:forEach>
      </select>
      <select name="approval_3">
       <c:forEach items="${name}" var="n">
      <option value="${n.userid}">${n.em_name}</option>
      </c:forEach>
      </select></td>
      </tr>
      	
	</table><br>
	</div>
	
	
	<hr style="width: 60%"></hr>
	<div class="bbutton" align= "right" >
		<tr><td  align="right"><input type="submit" value="등록"></td></tr>
		</div>

</form>

</body>
</html>