<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>
    회원(관리자 전용)
  </DIV>



   
   
    <div class='menu_line'></div>
    
   
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 30%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <TR>
      <TH class='th_bs'>유형</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>주소</TH>
      <TH class='th_bs'>등록일</TH>
      <TH class='th_bs'>기능</TH>
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="grade" value ="${memberVO.grade}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="mname" value ="${memberVO.mname}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="mdate" value ="${memberVO.mdate}" />
       
    <TR>
      <TD class='td_basic'>
        <c:choose>
          <c:when test="${grade >= 1 and grade <= 10}">관리자</c:when>    
          <c:when test="${grade >= 11 and grade <= 20}">회원</c:when>
          <c:when test="${grade >= 30 and grade <= 39}">정지 회원</c:when>
          <c:when test="${grade >= 40 and grade <= 49}">탈퇴 회원</c:when>
        </c:choose>  
      </TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${id}</A></TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${mname}</A></TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 15 }"> <%-- 긴 주소 처리 --%>
            ${address1.substring(0, 15) }...
          </c:when>
          <c:otherwise>
            ${address1}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${mdate.substring(0, 10)}</TD> <%-- 년월일 --%>
      <TD class='td_basic'>
        <A href="./passwd_update.do?memberno=${memberno}"><IMG src='/member/images/passwd.png' title='패스워드 변경' class="icon"></A>
        <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정' class="icon"></A>
        <A href="./delete.do?memberno=${memberno}"><IMG src='/member/images/delete.png' title='삭제' class="icon"></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create.do'" class="btn btn-secondary">등록</button>
    <button type='button' onclick="location.reload();" class="btn btn-secondary">새로 고침</button>
  </DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

