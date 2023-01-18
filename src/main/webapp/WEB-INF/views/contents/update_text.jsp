<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="cateno" value="${contentsVO.cateno }" />
<c:set var="title" value="${contentsVO.title }" />
<c:set var="content" value="${contentsVO.content }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="price" value="${contentsVO.price }" />
<c:set var="dc" value="${contentsVO.dc }" />
<c:set var="saleprice" value="${contentsVO.saleprice }" />
<c:set var="point" value="${contentsVO.point }" />
<c:set var="salecnt" value="${contentsVO.salecnt }" />

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_cateno_search_paging.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A> > 글 수정</DIV>

<DIV class='content_body'>
  
  
  <DIV class='menu_line'></DIV>
  <%--수정 폼 --%>
  <FORM name='frm' method='POST' action='./update_text.do'>
    <input type="hidden" name="contentsno" value="${contentsno }">
    <input type="hidden" name="cateno" value="${cateno }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div>
       <label>상품명</label>
       <input type='text' name='title' value='${title }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>상품 설명</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>${content }</textarea>
    </div>
    <div>
      <label>정가(100원 단위)</label>
      <input type="number" name="price" value="${price}" required="required" 
                min="0" max="100000000" step="100" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>할인률(%)</label>
      <input type="number" name="dc" value="${dc }" required="required" 
                min="0" max="100" step="1" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>판매가(100원 단위)</label>
      <input type="number" name="saleprice" value="${saleprice }" required="required" 
                min="0" max="100000000" step="100" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>포인트(10원 단위)</label>
      <input type="number" name="point" value="${point }" required="required" 
                min="0" max="100000000" step="10" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>보유 수량</label>
      <input type="number" name="salecnt" value="${salecnt }" required="required" 
                min="0" max="9999" step="1" class="form-control" style="width: 100%;">
    </div>
    
    <div>
       <label>검색어</label>
       <input type='text' name='word' value='${word }' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>   
    <br>
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary">취소</button>
      <button type="button" onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateno}'" class="btn btn-secondary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

