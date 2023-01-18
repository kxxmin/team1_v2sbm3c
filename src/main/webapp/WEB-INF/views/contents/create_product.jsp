<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
<DIV class='title_line'>${cateVO.name } > 글 등록</DIV>

<DIV class='content_body'>
  
  
  
  
  <DIV class='menu_line'></DIV>
  <%--등록 폼 --%>
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="cateno" value="${param.cateno }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div>
       <label>상품명</label>
       <input type='text' name='title' value='환상의 단풍 여행' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>상품 설명</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>가을 단풍보며 짜장면 먹기</textarea>
    </div>
    <div>
      <label>정가(100원 단위)</label>
      <input type="number" name="price" value="6000" required="required" 
                min="0" max="100000000" step="100" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>할인률(%)</label>
      <input type="number" name="dc" value="5" required="required" 
                min="0" max="100" step="1" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>판매가(100원 단위)</label>
      <input type="number" name="saleprice" value="5700" required="required" 
                min="0" max="100000000" step="100" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>포인트(10원 단위)</label>
      <input type="number" name="point" value="300" required="required" 
                min="0" max="100000000" step="10" class="form-control" style="width: 100%;">
    </div>
    <div>
      <label>보유 수량</label>
      <input type="number" name="salecnt" value="9999" required="required" 
                min="0" max="9999" step="1" class="form-control" style="width: 100%;">
    </div>
    <div>
       <label>검색어</label>
       <input type='text' name='word' value='월터,벤 스틸러,크리스튼위그,휴먼,도전' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>   
    <div>
       <label>이미지</label>
       <input type='file' class="form-control" name='file1MF' id='file1MF' 
                 value='' placeholder="파일 선택">
    </div>
    <div>
       <label>패스워드</label>
       <input type='password' name='passwd' value='1234' required="required" 
                 class="form-control" style='width: 50%;'>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-btn btn-secondary">등록</button>
      <button type="button" onclick="location.href='./list_by_cateno_search_paging.do?cateno=${param.cateno}'" class="btn btn-secondary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

