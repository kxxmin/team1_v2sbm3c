<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class="title_line" style='width: 80%;'>AI 기반 영화 추천 받기</DIV>
<DIV class='content_body'>
  <ASIDE class="aside_center">
    <A href="javascript:location.reload();">${sessionScope.mname }님을 위한 AI 추천</A><br><br>
    <DIV>고객님의 취향에 맞는 상품의 평점을 예측하여 추천합니다.</DIV>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <DIV id='panel' style='margin: 30px auto; text-align: center; width: 90%;'>
    <DIV style='margin: 0px auto; width: 100%;'>
      <c:forEach var="contentsVO" items="${list }">
        <c:set var="title" value="${contentsVO.title }" />
        <c:set var="price" value="${contentsVO.price }" />
        <c:set var="cateno" value="${contentsVO.cateno }" />
        <c:set var="contentsno" value="${contentsVO.contentsno }" />
        <c:set var="thumb1" value="${contentsVO.thumb1 }" />
        <c:set var="dc" value="${contentsVO.dc }" />
        <c:set var="saleprice" value="${contentsVO.saleprice }" />
        
                
        <DIV style='margin: 0px auto; width: 19.5%; float: left; height: 350px;'>
          <a href="./read.do?contentsno=${contentsno}&cateno=${cateno}"><IMG src="/contents/storage/${thumb1 }" style="width: 72%; height: 200px;"></a>
          <br>
          ${title }<br>
        </DIV>
        
      </c:forEach>
    </DIV>
  </DIV>
  
  
</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>