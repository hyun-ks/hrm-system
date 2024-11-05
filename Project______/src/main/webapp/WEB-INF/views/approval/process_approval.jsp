<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>결재 처리 결과</title>
</head>
<body>
    <%
        // 전달된 신청 정보를 받아옵니다.
        String approvalType = request.getParameter("approvalType");
        String reason = request.getParameter("reason");
        
        // 여기서 결재 처리 로직을 수행합니다.
        // 예를 들어, 데이터베이스에 신청 정보를 저장하거나 관련 기능을 호출할 수 있습니다.
        
        // 신청 정보를 출력하여 확인하는 예시
    %>
    
    <h1>결재 처리 결과</h1>
    <p>결재 유형: <%= approvalType %></p>
    <p>신청 사유: <%= reason %></p>
    <!-- 여기에 신청 결과를 추가로 표시하거나 처리 결과를 표시할 수 있습니다. -->
</body>
</html>
