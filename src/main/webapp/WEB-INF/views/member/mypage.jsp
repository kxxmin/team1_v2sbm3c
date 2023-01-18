<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script type="text/javascript">



  jQuery(function($) {
      $("body").css("display", "none");
      $("body").fadeIn(1000);
      $("a.transition").click(function(event){
          event.preventDefault();
          linkLocation = this.href;
          $("body").fadeOut(1000, redirectPage);
      });
      function redirectPage() {
      window.location = linkLocation;
      }
  });
    
</script> 

</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>가입 정보</DIV>
  
  <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="grade" value ="${memberVO.grade}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="mname" value ="${memberVO.mname}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="mdate" value ="${memberVO.mdate}" />
      </c:forEach>
      
      
   <DIV class='jungbo'>
  <ASIDE class="aside_center">
    이름: ${sessionScope.mname } <br>
    아이디: ${sessionScope.id }<br>
    전화번호: ${memberVO.tel }<br>
    우편번호: ${memberVO.zipcode }<br>
    주소: ${memberVO.address1 } ${memberVO.address2 }<br>
    일반 회원
    
  </ASIDE> 
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
