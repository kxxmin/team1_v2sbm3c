<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="evtno" value="${eventVO.evtno }" />
<c:set var="cateno" value="${eventVO.cateno }" />
<c:set var="evtitle" value="${eventVO.evtitle }" />
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
 
<DIV class='title_line'><A href="./list_by_cateno_search_paging.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A> > ${evtitle } 삭제 </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?cateno=${cateno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateno }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateno }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?evtno=${evtno}">글 수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?evtno=${evtno}">파일 수정</A>  
  </ASIDE> 
  
  <!-- 검색 폼 -->
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search_paging.do'>
      <input type='hidden' name='cateno' value='${cateno }'>
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
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:choose>
            <c:when test="${evimage_t.endsWith('jpg') || evimage_t.endsWith('png') || evimage_t.endsWith('gif')}">
              <IMG src="/event/storage/${evimage_r }" style='width: 90%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 없는 경우 -->
              상품 관련 이미지가 없습니다.
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'>${evtitle}</span>
	          <c:if test="${evimage_size > 0 }">
	          	<br>삭제되는 파일 : ${evimage_r }
	          </c:if>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='evtno' value='${evtno}'>
              <input type='hidden' name='cateno' value='${cateno}'>
              <input type='hidden' name='now_page' value='${param.now_page}'>
              <br><br>
              <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto;"></DIV>
                      
                <div style='text-align: center; margin: 10px auto;'>
                  <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                  <br><br>
                  <button type = "submit" class="btn btn-primary">삭제 진행</button>
                  <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
                </div>
           
          </FORM>
        </DIV>
      </li>
    </ul>
  </fieldset>

</DIV>
</body>
 
</html>