<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.cate.CateVO" %>
 
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
<DIV class="title_line" style='width: 80%;'>AI 기반 영화 추천 받기</DIV>
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">
      $(function() { // 자동 실행
        $('#btn_forward').on('click', function() { location.href='/recommend_clothes/form1.do';});
        $('#btn_close').on('click', function() { window.close(); });     // 윈도우 닫기
      });
    </script>
</head>
<body>

<DIV class="choochun">
    <H3 style="text-align: center; margin-top: 150px;">관심분야 등록</H3>

    <DIV style="text-align:center; margin: 50px auto;">
        관심 분야를 등록하시면 최적의 옷 추천 서비스를 이용하실수 있습니다.<br><br>
        등록은 관심 분야의 상품을 선택하며 몇번의 클릭만으로 바로 종료됩니다.
    </DIV>

    <DIV style="text-align:center; margin: 50px auto;">
        <button type='button' id='btn_forward' class='btn btn-info'>관심분야 등록하기</button>
        <button type='button' id='btn_close' class='btn btn-info' onclick="location.href='http://localhost:9093/index.do'">취소</button>
    </DIV>

</DIV>
</body>
</html>

