<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>옷 추천 시스템</title>
  
<link href="/css/styles.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='message'>
    <H3>회원 로그인이 필요한 페이지입니다.</H3>
    <BR><BR>
    <button type='button' onclick="location.href='/member/login.do'" class="btn btn-secondary">로그인</button>       
    <button type='button' onclick="location.href='/member/create.do'" class="btn btn-secondary">회원 가입</button>       
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

