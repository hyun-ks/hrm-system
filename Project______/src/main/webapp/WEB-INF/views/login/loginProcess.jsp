<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
    // 사용자가 입력한 아이디와 비밀번호를 가져옴
    String enteredUsername = request.getParameter("username");
    String enteredPassword = request.getParameter("password");

    // 실제로는 데이터베이스나 다른 저장소에서 사용자 정보를 가져와 비교해야 함
    // 이 예시에서는 간단하게 하드코딩된 사용자 정보를 사용함

    // 입력된 아이디가 사용자 목록에 있고 비밀번호가 일치할 경우 로그인 성공
    
%>
