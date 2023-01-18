<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.cate.CateVO" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

  function type2_recommend_clothes() {
      var url = 'http://localhost:9093/type2_recommend_clothes/start.do';
    var win = window.open(url, 'AI 서비스', 'width=1000px, height=600px');

    var x = (screen.width - 1000) / 2;
    var y = (screen.height - 600) / 2;

    win.moveTo(x, y); // 화면 중앙으로 이동
  }
 
</script>
<link href="css/styles.css" rel="stylesheet" />
    <!-- 헤더 start -->
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-10 px-lg-1">
                <a class="navbar-brand" href="http://localhost:9093/index.do">Clothes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-0 mb-lg-0 ms-lg-0">
                       <li class="nav-item"><a class="nav-link active" aria-current="page" href="/contents/list_all.do">ALL</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9093/contents/list_by_cateno_search_paging.do?cateno=1">top</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9093/contents/list_by_cateno_search_paging.do?cateno=2">pants</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9093/contents/list_by_cateno_search_paging.do?cateno=3">hat</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9093/contents/list_by_cateno_search_paging.do?cateno=4">shoes</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9093/contents/list_by_cateno_search_paging.do?cateno=5">bag</a></li>
                        
                         <li class="nav-item">
                        <c:choose>
                            <c:when test="${sessionScope.id == null}">
                                <a class="nav-link" href="/member/login.do">login</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href='/member/logout.do'>${sessionScope.id } logout</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    
                      
                        
                        <li class="nav-item dropdown"> <%-- 회원 서브 메뉴 --%>
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">member</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/member/create.do">회원 가입</a>
                            <a class="dropdown-item" href="/member/search_id">아이디 찾기</a>
                            <c:choose>
                              <c:when test="${sessionScope.id != null}">
                                <a class="dropdown-item" href="/member/read.do">가입 정보</a>
                                <a class="dropdown-item" href="/member/passwd_update.do">비밀번호 변경</a>
                                <a class="dropdown-item" href="/member/read.do">회원 정보 수정</a>
                       
                              </c:when>
                            </c:choose>
                        </div>
                    </li>
                    
                    <c:choose>
                        <c:when test="${sessionScope.grade <= 10}"> <%-- 로그인 한 경우 --%>                    
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">회원 관리자</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/cate/list_all.do">카테고리</a>
                                    <a class="dropdown-item" href="/member/list.do">회원 목록</a>
                                </div>
                            </li>
                        </c:when>
                    </c:choose>        

                  <li class="nav-item">
                        <c:choose>
                            <c:when test="${sessionScope.admin_id == null}">
                                <a class="nav-link" href="/admin/login.do">manager login</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href='/admin/logout.do'>manager ${sessionScope.id } logout</a>
                            </c:otherwise>
                        </c:choose>
                    </li> 
                    
                    <c:choose>
                        <c:when test="${sessionScope.admin_grade <= 10}"> <%-- 관리자로 로그인 한 경우 --%>                    
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">manager</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/cate/list_all.do">category</a>
                                    <a class="dropdown-item" href="/member/list.do">member list</a>
                                </div>
                            </li>
                        </c:when>
                    </c:choose>   
                    
                    <li class="nav-item">
                          <c:choose>
                              <c:when test="${sessionScope.id != null}">
                                  <a class="nav-link" href="/contents/mf_clothes_member.do">옷 추천 받기</a>
                              </c:when>
                              <c:otherwise>
                                  <a class="nav-link" href='/member/login.do'>옷 추천 받기</a>
                              </c:otherwise>
                          </c:choose>
                      </li> 

                      <li class="nav-item">
                      <a class="nav-link" href="/recommend_clothes/start.do">관심분야 추천 받기</a>
                      </li>      
                    </ul>
                    
                    
                    <form class="d-flex">
                        <button type='button' class="btn btn-outline-dark" type="submit" id='btn_cart' onclick="location.href='/cart/list_by_memberno.do'" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                        </button>
                    </form>
                </div>
            </div>
        </nav>
                    
                  
                    
                    
                              
                </ul>
                
                
            </div>    
            </div>


  