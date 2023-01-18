<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="evtno" value="${eventVO.evtno }" />
<c:set var="cateno" value="${eventVO.cateno }" />
<c:set var="evtitle" value="${eventVO.evtitle }" />
<c:set var="evdesc" value="${eventVO.evdesc }" />
<c:set var="evdate" value="${eventVO.evdate }" />
<c:set var="evword" value="${eventVO.evword }" />
<c:set var="evimage_rsaved" value="${eventVO.evimage_rsaved.toLowerCase() }" />
<c:set var="evimage_t" value="${eventVO.evimage_t }" />
<c:set var="evimage_r" value="${eventVO.evimage_r }" />
 <c:set var="evimage_size" value="${eventVO.evimage_size }" />
 
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
 
<DIV class='title_line'><A href="./list_by_cateno_search_paging.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?cateno=${cateno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateno }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateno }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?evtno=${evtno}&now_page=${param.now_page}">글 수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?evtno=${evtno}&now_page=${param.now_page}">파일 수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?evtno=${evtno}&now_page=${param.now_page}&cateno=${cateno}">삭제</A>  
  </ASIDE> 
  
  <%-- 검색 --%>
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search_paging.do'>
      <input type='hidden' name='cateno' value='${param.cateno }'>
      
      <c:choose>
        <c:when test="${param.evword != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='evword' id='evword' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='evword' id='evword' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.wevord.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateVO.cateno}&evword='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 50%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${evimage_t.endsWith('jpg') || evimage_t.endsWith('png') || evimage_t.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <A href='/event/storage/${evimage_rsaved }'><IMG src="/event/storage/${evimage_r }" style="width: 100%;"> </A>
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/event/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px; margin-bottom: 30px;">
          <span style="font-size: 1.5em; font-weight: bold;">${evtitle }</span><br>
        </DIV> 

        <DIV>${evdesc }</DIV>
      </li>
	  	
      <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${evword }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${evimage_r.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/event/storage&filename=${evimage_rsaved}&downname=${evimage_r}'>${evimage_r}</A> (${evimage_size})  
          	<A href='/download?dir=/event/storage&filename=${evimage_rsaved}&downname=${evimage_r}'><IMG src="/event/images/download.png"></A>
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
</body>
 
</html>