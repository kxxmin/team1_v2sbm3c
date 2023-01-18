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
  <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A>
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
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateVO.cateno}&word='">검색 취소</button>    
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 90%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
<!--     <thead>
      <tr>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>상품명</th>
        <th style='text-align: center;'>정가, 할인률, 판매가, 포인트</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    
    </thead> -->
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="eventVO" items="${list }">
				<c:set var="evtno" value="${eventVO.evtno }" />
				<c:set var="cateno" value="${eventVO.cateno }" />
				<c:set var="evtitle" value="${eventVO.evtitle }" />
				<c:set var="evimage_rsaved" value="${eventVO.evimage_rsaved.toLowerCase() }" />
				<c:set var="evimage_t" value="${eventVO.evimage_t }" />
				<c:set var="evimage_r" value="${eventVO.evimage_r }" />
				<c:set var="evimage_size" value="${eventVO.evimage_size }" />
        <c:set var="evdesc" value="${eventVO.evdesc }" />
        
        <tr style="height: 132px;"> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${evimage_t.endsWith('jpg') || evimage_t.endsWith('png') || evimage_t.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
                <%-- /static/contents/storage/ --%>
                <a href="./read.do?evtno=${evtno}&now_page=${param.now_page }"><IMG src="/event/storage/${evimage_t }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
              <c:choose>
              	<c:when test="${evimage_size > 0}">
              		<a href="./read.do?evtno=${evtno}&cateno=${cateno}&evword=${param.evword}&now_page=${param.now_page }">${evimage_r }</a>
              	</c:when>
              	<c:when test="${evimage_size == 0} ">
              		<a href="./read.do?evtno=${evtno}&cateno=${cateno}&evword=${param.evword}&now_page=${param.now_page }"><IMG src="/contents/images/none1.png" style="width: 120px; height: 80px;"></a>
              	</c:when>
              </c:choose>          
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <a href="./read.do?evtno=${evtno}&cateno=${cateno}&evword=${param.evword}&now_page=${param.now_page }"><strong>${evtitle}</strong> 
            <c:choose>
              <c:when test="${evdesc.length() > 160 }">
                  ${evdesc.substring(0, 160)}.....
              </c:when>
              <c:when test="${evdesc.length() <= 160 }">
                  ${evdesc}
              </c:when>
            </c:choose>
            
            </a> 
          </td> 
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
 </DIV>
</body>
 
</html>

