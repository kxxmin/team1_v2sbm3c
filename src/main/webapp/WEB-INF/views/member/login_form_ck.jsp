<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
  $(function() { // click 이벤트 핸들러 등록
    $('#btn_create').on('click', create); // 회원 가입
    $('#btn_loadDefault').on('click', loadDefault); // 기본 로그인 정보 설정
  });

  // 회원 가입  
  function create() {
    location.href="./create.do";
  }

  // 테스트용 기본값 로딩
  function loadDefault() {
    $('#id').val('user1');
    $('#passwd').val('1234');
  }

  jQuery(function($) {
      $("body").css("display", "none");
      $("body").fadeIn(1000);
      $("a.transition").click(function(event){
          event.preventDefault();
          linkLocation = this.href;
          $("body").fadeOut(1000, redirectPage);
      });
      function redirectPage() {
      window.location = linkLocation;
      }
  });
    
</script> 

</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>로그인</DIV>

  <DIV class='login_member_form'> 
    <DIV style='width: 80%; margin: 0px auto;'>
      <FORM name='frm' method='POST' action='./login.do'>
      
        <div class="form_input" style="margin-top: 40px">
          <input type='text' class="form-control" name='id' id='id' 
                    value="${ck_id }" required="required" 
                    style='width: 80%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>    
        </div>   
     
        <div class="form_input">
          <input type='password' class="form-control" name='passwd' id='passwd' 
                    value='${ck_passwd }' required="required" style='width: 80%;' placeholder="패스워드">
          <Label>
            <input type='checkbox' name='passwd_save' value='Y' ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>                    
        </div>   
     
        <div class="form_input">
          <button type="submit" class="btn btn-secondary">로그인</button>
          <button type='button' id='btn_create' class="btn btn-secondary">회원가입</button>
          <button type='button' id='btn_loadDefault' class="btn btn-secondary">테스트 계정</button> 
          <button type="button" class="btn btn-secondary" onclick="location.href='/member/search_id'">아이디 찾기</button>
               
        </div>   <br>
        
      </FORM>
    </DIV>
  </DIV> <%-- <DIV class='content_body'> END --%>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
