<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
  <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }">기본 목록형</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
  </ASIDE> 

  <%-- 검색 --%>
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search_paging.do'>
      <input type='hidden' name='cateno' value='${param.cateno }'>
      
      <c:choose>
        <c:when test="${param.evword != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='evword' id='evword' value='${param.evword }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='evword' id='evword' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.evword.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateVO.cateno}&evword='">검색 취소</button>    
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="eventVO" items="${list }" varStatus="status">
      <c:set var="evtno" value="${eventVO.evtno }" />
      <c:set var="evtitle" value="${eventVO.evtitle }" />
      <c:set var="evdesc" value="${eventVO.evdesc }" />
      <c:set var="evdate" value="${eventVO.evdate }" />
      <c:set var="evimage_rsaved" value="${eventVO.evimage_rsaved.toLowerCase() }" />
      <c:set var="evimage_t" value="${eventVO.evimage_t }" />
      <c:set var="evimage_r" value="${eventVO.evimage_r }" />
      <c:set var="evimage_size" value="${eventVO.evimage_size }" />
      <c:set var="evword" value="${eventVO.evword }" />
      <c:set var="cateno" value="${eventVO.cateno }" />       
      <c:set var="adminno" value="${eventVO.cateno }" /> 

      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경, index는 0부터 시작 --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;'>
            <c:choose> 
              <c:when test="${evimage_t.endsWith('jpg') || evimage_t.endsWith('png') || evimage_t.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?evtno=${evtno}&cateno=${param.cateno}">               
                  <IMG src="./storage/${evimage_t }" style='width: 100%; height: 150px;'>
                </a><br>
                <strong>${evtitle}</strong><br> 
                ${evdesc }
                <br>
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?evtno=${evtno}&cateno=${param.cateno}">${evimage_r}</a><br>
                  </DIV>
                </DIV>
                <DIV style='height:48px;'>
                 	<strong>${evtitle}</strong><br>
                 	${evdesc }   
                </DIV>
              </c:otherwise>
            </c:choose>     
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>

</DIV>
</body>
 
</html>