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

<DIV class='content_body'>
  <ASIDE class="aside_left">
    <A href="javascript:location.reload();">${sessionScope.mname }님을 위한 추천</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <DIV id='panel' style='margin: 10px auto; text-align: center; width: 90%;'>
    <DIV style='margin: 0px auto; width: 100%;'>
    
      <c:forEach var="contentsVO" items="${list }">
        <c:set var="title" value="${contentsVO.title }" />
        <c:set var="cateno" value="${contentsVO.cateno }" />
        <c:set var="contentsno" value="${contentsVO.contentsno }" />
        <c:set var="thumb1" value="${contentsVO.thumb1 }" />
                
        <DIV style='margin: 0px auto; width: 19.5%; float: left; height: 350px;'>
          <a href="/contents/read.do?contentsno=${contentsno}&cateno=${cateno}"><IMG src="/contents/storage/${thumb1 }" style="width: 95%; height: 200px;"></a>
          <br>
          ${title } 
        </DIV>
      </c:forEach>
    </DIV>
  </DIV>
</DIV>

</body>
 
</html>