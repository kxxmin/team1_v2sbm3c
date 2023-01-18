<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
 
<script>
var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
var msg = "${msg}";
if(msg != ""){
alert(msg);    
}
});
 
 
function fnSubmit() {
 
var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
 
if ($("#mname").val() == null || $("#mname").val() == "") {
alert("이름을 입력해주세요.");
$("#mname").focus();
 
return false;
}
 
if ($("#tel").val() == null || $("#tel").val() == "") {
alert("전화번호를 입력해주세요.");
$("#tel").focus();
 
return false;
}
 
if(!tel_rule.test($("#tel").val())){
alert("전화번호 형식에 맞게 입력해주세요.");
return false;
}
 
 
if (confirm("아이디를 찾으시겠습니까?")) {
 
$("#createForm").submit();
 
return false;
}
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
 
<head>
 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
 
<title>Clothes</title>
 
<!-- Custom fonts for this template-->
<link href="/css/styles.css" rel="stylesheet" type="text/css">
<link
href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
rel="stylesheet">
 
<!-- Custom styles for this template-->
<link href="/css/styles.css" rel="stylesheet">
 
</head>
<c:import url="/menu/top.do" />
<form commandName="searchVO" id="createForm" action="${path}/member/search_result_id" method="post">
 
<body class="bg-gradient-primary">
<div class="container">
<!-- Outer Row -->
<div class="row justify-content-center">
 
<div class="col-xl-10 col-lg-12 col-md-9">
 
<div class="card o-hidden border-0 shadow-lg my-5">
<div class="card-body p-0">
<!-- Nested Row within Card Body -->
<div class="row">
<div class="col-lg-6 d-none d-lg-block bg-password-image" >
<img class="card-img-id" src="/contents/storage/bogi.PNG" alt="..." />
</div>
<div class="col-lg-6">
<div class="p-5">
  <div class="text-center">
      <h1 class="h4 text-gray-900 mb-2">아이디를 잊으셨습니까?</h1>
      <p class="mb-4">아래 빈칸에 이름과 전화번호를 입력하세요</p>
  </div>
      <div class="form-group">
          <input type="text" class="form-control form-control-user"
              id="mname" name="mname"
              placeholder="이름을 입력하세요">
      </div>
      <div class="form-group">
          <input type="email" class="form-control form-control-user"
              id="tel" name="tel"
              placeholder="전화번호를 입력하세요 ex (010-0000-0000)">
      </div>
      <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-secondary btn-user btn-block">
          아이디찾기
      </a>
  <hr>
     <div class="text-center">
      <a class="small" href="/member/create.do">회원가입 창으로 이동</a>
  </div>
  <div class="text-center">
      <a class="small" href="/member/login.do">로그인 창으로 이동</a>
  </div>
</div>
</div>
</div>
</div>
</div>
 
</div>
 
</div>
 
</div>
 
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
 
</body>
 
 
</form>
</html>