<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
<DIV class='title_line'><A href="./list_by_cateno_search_paging.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A> > 글 수정 </DIV>

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
  
  <!-- 검색 폼 -->
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search_paging.do'>
      <input type='hidden' name='cateno' value='${cateVO.cateno }'>
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
                     onclick="location.href='./list_by_cateno_search.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  <!-- 수정 폼 -->
  <FORM name='frm' method='POST' action='./update_text.do'>
    <input type="hidden" name="evtno" value="${evtno }">
    <input type="hidden" name="cateno" value="${cateno }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div>
       <label>이벤트 제목</label>
         <input type='text' name='evtitle' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div> 
    <div>
       <label>이벤트 설명</label>
         <textarea name='evdesc' required="required" class="form-control" rows="1" style='width: 100%;'></textarea>
    </div>
    <div>
       <label>검색어</label>
         <input type='text' name='evword' value='' required="required" 
                    class="form-control" style='width: 100%;'>
    </div> 
    <div>
       <label>이벤트 기간</label>
         <input type='date' name='evdate' value='${eventVO.evdate }' required="required" 
                    class="form-control" style='width: 100%;'>
    </div>     
  
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='../cate/list_all.do'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
</body>
 
</html>