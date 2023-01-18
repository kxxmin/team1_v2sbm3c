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
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        $(function() {
            send();  // Django ajax 호출
            $('#btn_previous').on('click', function() { history.back(); });   // 이전
            $('#btn_close').on('click', function() { window.close(); });      // 윈도우 닫기
        });

        function send() {
            var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
             //alert('params: ' + params);  // 수신 데이터 확인
            $.ajax({
              url: 'http://localhost:8000/recommend_clothes/end_ajax',  // Spring Boot -> Django 호출
              type: 'get',  // get or post
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params,      // 데이터
              success: function(rdata) { // 응답이 온경우
                 //alert(rdata.index);
                if (rdata.index == 0) {        // 개발 관련 도서 추천 필요
                    $('#top').css('display',''); // show
                } else if(rdata.index == 1) { // 해외 여행 관련 도서 추천 필요
                    $('#pants').css('display','');
                } else if(rdata.index == 2){                            // 소설 관련 도서 추천 필요
                    $('#hat').css('display','');
                } else if(rdata.index == 3){                            // 소설 관련 도서 추천 필요
                    $('#shoes').css('display','');
                } else {                            // 소설 관련 도서 추천 필요
                    $('#bag').css('display','');
                } 

				        // Upgrade
				        // Spring Boot로 Ajax -> favorite 테이블 insert 
				        // -> 카테고리를 파악했기 때문에 카테고리의 평점이 높은 상품을 내림차순 정렬하여 로딩
				        // -> 로딩된 상품 정보를 마지막 페이지에 출력
				        // -----------------------------Ajax 재요청----------------------------
				                
				               
                
                // -----------------------------Ajax 재요청----------------------------
                
                $('#panel').html("");  // animation gif 삭제
                $('#panel').css('display', 'none'); // 숨겨진 태그의 출력

                // --------------------------------------------------
                // 분류 정보에 따른 상품 이미지 SELECT
                //  --------------------------------------------------
              },
              // Ajax 통신 에러, 응답 코드가 150이 아닌경우, dataType이 다른경우
              error: function(request, status, error) { // callback 함수
                console.log(error);
              }
            });

            // $('#panel').html('처리중입니다....');  // 텍스트를 출력하는 경우
            $('#panel').html("<img src='/recommend_clothes/images/ani04.gif' style='width: 10%;'>");
            $('#panel').show(); // 숨겨진 태그의 출력
          }
    </script>

    <style>
        *{
            text-align: center;
        }

        .td_image{
            vertical-align: middle;
            padding-right: 10px;
            cursor: pointer;
        }

    </style>
    
</head>
<body>

<DIV style='display: none;'>
    <form name='frm' id='frm'>
        <input type='hidden' name='step1' value='${param.step1 }'>
        <input type='hidden' name='step2' value='${param.step2 }'>
        <input type='hidden' name='step3' value='${param.step3 }'>
        <input type='hidden' name='step4' value='${param.step4 }'>
        <input type='hidden' name='step5' value='${param.step5 }'>
    </form>
</DIV>

<DIV class="container">
    <H3 style='margin-top: 150px;'>이미지를 클릭하시면 추천 의류 상세 페이지로 이동합니다.</H3><br></DIV>

    <DIV id='panel' style='margin: 30px auto; width: 100%;'></DIV>
    
    <DIV id='panel_img' style='margin: 0px auto; width: 90%;'>
        <DIV id='top' style='display: none;'> <!-- 상의 추천 필요 -->
        <H3>고객님의 관심분야인 "상의"에 대한 추천 의류입니다.</H3><br>
            <TABLE style='margin: 30px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/1.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=1&cateno=1&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_clothes/images/2.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=2&cateno=1&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_clothes/images/3.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=3&cateno=1&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img4' src="/recommend_clothes/images/4.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=4&cateno=1&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img5' src="/recommend_clothes/images/5.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=5&cateno=1&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img6' src="/recommend_clothes/images/6.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=6&cateno=1&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img7' src="/recommend_clothes/images/7.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=7&cateno=1&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img8' src="/recommend_clothes/images/8.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=8&cateno=1&word=&now_page=1'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img9' src="/recommend_clothes/images/9.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=9&cateno=1&word=&now_page=1'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img10' src="/recommend_clothes/images/10.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=10&cateno=1&word=&now_page=1'">
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
        <DIV id='pants' style='display: none;'>  <!-- 하의 추천 필요 -->
        <H3>고객님의 관심분야인 "하의"에 대한 추천 의류입니다.</H3><br>
            <TABLE style='margin: 0px auto;'>
            
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/11.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=11&cateno=2&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/12.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=12&cateno=2&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_clothes/images/13.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=13&cateno=2&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_clothes/images/14.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=14&cateno=2&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img4' src="/recommend_clothes/images/15.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=15&cateno=2&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img5' src="/recommend_clothes/images/16.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=16&cateno=2&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img6' src="/recommend_clothes/images/17.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=17&cateno=2&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img7' src="/recommend_clothes/images/18.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=18&cateno=2&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img8' src="/recommend_clothes/images/19.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=19&cateno=2&word=&now_page=1'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img9' src="/recommend_clothes/images/20.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=20&cateno=2&word=&now_page=1'">
                    </TD>
                    
                </TR>          
            </TABLE>
        </DIV>
        <DIV id='hat' style='display: none; float: center;'> <!-- 모자 추천 필요 -->
        <H3>고객님의 관심분야인 "모자"에 대한 추천 의류입니다.</H3><br>
       
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/51.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=51&cateno=3&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/52.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=52&cateno=3&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_clothes/images/53.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=53&cateno=3&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_clothes/images/54.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=54&cateno=3&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img4' src="/recommend_clothes/images/55.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=55&cateno=3&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img5' src="/recommend_clothes/images/56.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=56&cateno=3&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img6' src="/recommend_clothes/images/57.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=57&cateno=3&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img7' src="/recommend_clothes/images/58.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=58&cateno=3&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img8' src="/recommend_clothes/images/59.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=59&cateno=3&word=&now_page=1'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img9' src="/recommend_clothes/images/60.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=60&cateno=3&word=&now_page=1'">
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
        <DIV id='shoes' style='display: none;'> <!-- 신발 추천 필요 -->
        <H3>고객님의 관심분야인 "신발"에 대한 추천 의류입니다.</H3><br>
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/31.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=31&cateno=4&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/32.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=32&cateno=4&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_clothes/images/33.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=33&cateno=4&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_clothes/images/34.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=34&cateno=4&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img4' src="/recommend_clothes/images/35.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=35&cateno=4&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img5' src="/recommend_clothes/images/36.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=36&cateno=4&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img6' src="/recommend_clothes/images/37.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=37&cateno=4&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img7' src="/recommend_clothes/images/38.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=38&cateno=4&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img8' src="/recommend_clothes/images/39.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=39&cateno=4&word=&now_page=1'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img9' src="/recommend_clothes/images/40.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=40&cateno=4&word=&now_page=1'">
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
        <DIV id='bag' style='display: none;'> <!-- 가방 추천 필요 -->
        <H3>고객님의 관심분야인 "가방"에 대한 추천 의류입니다.</H3><br>
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/41.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=41&cateno=5&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_clothes/images/42.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=42&cateno=5&word=&now_page=4'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_clothes/images/43.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=43&cateno=5&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_clothes/images/44.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=44&cateno=5&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img4' src="/recommend_clothes/images/45.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=45&cateno=5&word=&now_page=3'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img5' src="/recommend_clothes/images/46.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=46&cateno=5&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img6' src="/recommend_clothes/images/47.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=47&cateno=5&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img7' src="/recommend_clothes/images/48.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=48&cateno=5&word=&now_page=2'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img8' src="/recommend_clothes/images/49.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=49&cateno=5&word=&now_page=1'">
                    </TD>
                    <TD class='td_image'>
                        <img id='img9' src="/recommend_clothes/images/50.png" style='float:left; height: 150px' onclick="location.href='http://localhost:9093/contents/read.do?contentsno=50&cateno=5&word=&now_page=1'">
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
    </DIV>
    <br>
    
    <form id='frm' name='frm' action='' method='GET'>
        <br>
        <DIV style="text-align:center;">
            <button type='button' id='btn_previous' class="btn btn-secondary">이전</button>
            <button type='button' id='btn_close' class="btn btn-secondary" onclick="location.href='http://localhost:9093/index.do'">종료</button>
        </DIV>
    </form>
</DIV>
</body>
</html>