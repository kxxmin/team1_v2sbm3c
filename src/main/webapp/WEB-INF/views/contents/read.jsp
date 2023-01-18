<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="cateno" value="${contentsVO.cateno }" />
<c:set var="title" value="${contentsVO.title }" />        
<c:set var="price" value="${contentsVO.price }" />
<c:set var="dc" value="${contentsVO.dc }" />
<c:set var="saleprice" value="${contentsVO.saleprice }" />
<c:set var="point" value="${contentsVO.point }" />
<c:set var="salecnt" value="${contentsVO.salecnt }" />
<c:set var="file1" value="${contentsVO.file1 }" />
<c:set var="file1saved" value="${contentsVO.file1saved }" />
<c:set var="thumb1" value="${contentsVO.thumb1 }" />
<c:set var="size1" value="${contentsVO.size1 }" />
<c:set var="content" value="${contentsVO.content }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="size1_label" value="${contentsVO.size1_label }" />
<c:set var="map" value="${contentsVO.map }" />
<c:set var="youtube" value="${contentsVO.youtube }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
  $(function() {
    // var contentsno = 0;
    // $('#btn_cart').on('click', function() { cart_ajax(contentsno)});
    // $('#btn_login').on('click', login_ajax);
    // $('#btn_loadDefault').on('click', loadDefault);
  });

  <%-- 로그인 기본값 --%>
  function loadDefault() {
      $('#id').val('user1');
      $('#passwd').val('1234');
  } 
  
  <%-- 로그인 --%>
  function login_ajax() {
    var params = "";
    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // params += '&${ _csrf.parameterName }=${ _csrf.token }';
    // alert(params);
    // return;
    
    $.ajax(
      {
        url: '/member/login_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          // alert('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
          
          if (rdata.cnt == 1) {
            // 쇼핑카트에 insert 처리 Ajax 호출
            $('#div_login').hide(); // 로그인폼 감추기
            // alert('로그인 성공');
            $('#login_yn').val('Y');
            
            cart_ajax_post(); // 쇼핑카트에 상품 담기
          } else {
            alert('로그인에 실패했습니다.\n잠시후 다시 시도해주세요.');
            
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }

  <%-- 쇼핑 카트에 상품 추가 --%>
  function cart_ajax(contentsno) {
    var f = $('#frm_login');
    $('#contentsno', f).val(contentsno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
    
    // console.log('-> contentsno: ' + $('#contentsno', f).val()); 

    if ("${sessionScope.id}" == "" && $('#login_yn').val() != 'Y') {  // id 값이 없으며 로그인이 안되어 있다면
      $('#div_login').show();   // 로그인 폼 
    } else {  // 로그인 한 경우
      // alert('쇼핑카트에 insert 처리 Ajax 호출');
      cart_ajax_post(); // 쇼핑카트에 상품 담기
    }

  }

  <%-- 쇼핑카트 상품 등록 --%>
  function cart_ajax_post() {
    var f = $('#frm_login');
    var contentsno = $('#contentsno', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
    
    var params = "";
    // params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params += 'contentsno=' + contentsno;
    // alert('-> cart_ajax_post: ' + params);
    // return;
    
    $.ajax(
      {
        url: '/cart/create.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          // console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 쇼핑카트 등록 성공
          
          if (rdata.cnt == 1) {
            var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
            if (sw == true) {
              // 쇼핑카트로 이동
              location.href='/cart/list_by_memberno.do?cateno=${param.cateno}';
            }           
          } else {
            alert('선택한 상품을 장바구니에 담지못했습니다.<br>잠시후 다시 시도해주세요.');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }
  </script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'><A href="./list_by_cateno_search_paging.do?cateno=${cateno }" class='title_link'>${cateVO.name }</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_center">
    
    <A href="./list_by_cateno_search_paging.do?cateno=${cateno }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateno }">갤러리형</A>

    <c:if test="${sessionScope.admin_id != null }">
      <span class='menu_divide' >│</span>
      <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page}">글 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?contentsno=${contentsno}&now_page=${param.now_page}">파일 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./map.do?cateno=${cateno }&contentsno=${contentsno}">지도</A>
      <span class='menu_divide' >│</span>
      <A href="./youtube.do?cateno=${cateno }&contentsno=${contentsno}">Youtube</A>
      <span class='menu_divide' >│</span>
      <A href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page}&cateno=${cateno}">삭제</A>  
    </c:if>
    
  </ASIDE> 
  
  
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 50%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <A href="/contents/storage/${file1saved }"><IMG src="/contents/storage/${file1saved }" style="width: 100%;"></A> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>

        <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
        <DIV id='div_login' style='display: none;'>
          <div style='width: 30%; margin: 0px auto;'>
            <FORM name='frm_login' id='frm_login' method='POST'>
              <input type='hidden' name='contentsno' id='contentsno' value=''>
              <input type='hidden' name='login_yn' id='login_yn' value=''>
              
              <div class="form_input">
                <input type='text' class="form-control" name='id' id='id' 
                          value="${ck_id }" required="required" 
                          style='width: 100%;' placeholder="아이디" autofocus="autofocus">
                <Label>   
                  <input type='checkbox' name='id_save' value='Y' ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
                </Label>    
              </div>   
           
              <div class="form_input">
                <input type='password' class="form-control" name='passwd' id='passwd' 
                          value='${ck_passwd }' required="required" style='width: 100%;' placeholder="패스워드">
                <Label>
                  <input type='checkbox' name='passwd_save' value='Y' ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
                </Label>                    
              </div>   
            
            </FORM>
          </div>
         
          <div style='text-align: center; margin: 10px auto;'>
            <button type="button" id='btn_login' class="btn btn-info" onclick="login_ajax()">로그인</button>
            <button type='button' onclick="location.href='./create.do'" class="btn btn-info">회원가입</button>
            <button type='button' id='btn_loadDefault' class="btn btn-info" onclick="loadDefault()">테스트 계정</button>
            <button type='button' id='btn_cancel' class="btn btn-info" onclick="$('#div_login').hide();">취소</button>
          </div>
        
        </DIV>
        <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>
        
        <table class="table table-striped" style='width: 100%;'>
          <colgroup>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 50%;"></col>
            <col style="width: 20%;"></col>
            <col style="width: 10%;"></col>
          </colgroup>
          
        <DIV style="width: 47.5%; height: 260px; float: left; margin-right: 10px; margin-bottom: 30px;">
          <span style="font-size: 1.5em; font-weight: bold;">${title }</span><br>
          <span style="font-size: 1.5em; font-weight: bold;"><fmt:formatNumber value="${saleprice}" pattern="#,###" /> 원</span>
          <span style="color: #FF0000; font-size: 2.0em;">${dc} %</span> <br>
                    
          <del><fmt:formatNumber value="${price}" pattern="#,###" /> 원</del><br><br>
          <span style="font-size: 1.2em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /> 원</span><br>
          <span style="font-size: 1.0em;">(남은 수량: <fmt:formatNumber value="${salecnt}" pattern="#,###" /> 개)</span><br>
          <span style="font-size: 1.0em;">구매 수량</span><br>
          <form>
          <input type='number' name='ordercnt' value='1' required="required" 
                     min="1" max="99999" step="1" class="form-control" style='width: 30%;'><br>
                     <button type='button' id='btn_cart' class="btn btn-secondary" style='margin-bottom: 2px;' onclick="cart_ajax(${contentsno })">장바 구니</button><br>
                     <button type='button' id='btn_ordering' class="btn btn-secondary" onclick="cart_ajax(${contentsno })">바로 구매</button>  
          </form><br><br>
          <h2 class="alert alert-dark">상품 설명</h2>
          ${content }
        </DIV> 

        <DIV><br></DIV>
      </li>

      <c:if test="${youtube.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 15px; padding-bottom: 15px;">
          <DIV style="text-align: center;">
            ${youtube }
          </DIV>
        </li>
      </c:if>
            
      <c:if test="${map.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 15px; padding-bottom: 15px;">
          <DIV style='width:640px; height: 380px; margin: 0px auto;'>
            ${map }
          </DIV>
        </li>
      </c:if>
      
      
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

