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
        <title>Clothes</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</script>
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <style>
    .carousel-inner > .carousel-item > img{
      /* width: 640px;
      height: 720px; */
    }
  </style>
  
  
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    
    
    <body>
        <!-- Navigation-->
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-10 px-lg-10">
                <a class="navbar-brand" href="http://localhost:9093/index.do">Clothes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-0 mb-lg-0 ms-lg-4">
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
                    
                    
                    <li class="nav-item dropdown"> <%-- ?????? ?????? ?????? --%>
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">member</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/member/create.do">?????? ??????</a>
                            <a class="dropdown-item" href="/member/search_id">????????? ??????</a>
                            <c:choose>
                              <c:when test="${sessionScope.id != null}">
                                <a class="dropdown-item" href="/member/mypage.do">?????? ??????</a>
                                <a class="dropdown-item" href="/member/passwd_update.do">???????????? ??????</a>
                                <a class="dropdown-item" href="/member/read.do">?????? ?????? ??????</a>
                                <a class="dropdown-item" href="/order_pay/list_by_memberno.do">?????? ??????</a>
   
                              </c:when>
                            </c:choose>
                        </div>
                    </li>

                        <c:choose>
                        <c:when test="${sessionScope.grade <= 10}"> <%-- ????????? ??? ?????? --%>                    
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">?????? ?????????</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/cate/list_all.do">????????????</a>
                                    <a class="dropdown-item" href="/member/list.do">?????? ??????</a>
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
                        <c:when test="${sessionScope.admin_grade <= 10}"> <%-- ???????????? ????????? ??? ?????? --%>                    
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">manager function</a>
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
                                  <a class="nav-link" href="/contents/mf_clothes_member.do">??? ?????? ??????</a>
                              </c:when>
                              <c:otherwise>
                                  <a class="nav-link" href='/member/login.do'>??? ?????? ??????</a>
                              </c:otherwise>
                          </c:choose>
                      </li> 

                      <li class="nav-item">
                      <a class="nav-link" href="/recommend_clothes/start.do">???????????? ?????? ??????</a>
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
        <!-- Header-->
          <script>
    $('.carousel').carousel({
      interval: 2000 //?????? 5???
    })
  </script>
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="container"><h2></h2></div>
  <div id="demo" class="carousel slide" data-ride="carousel">

    <div class="carousel-inner">
      <!-- ???????????? ??? -->
      <div class="carousel-item active">
        <!--??????-->
        <img class="d-block w-100 h-50" 
         src="/contents/images/banner1.png" style="width: 100px; height: 160px;"
          alt="First slide">
          <div class="carousel-caption d-none d-md-block">
              <h5></h5>
              <p></p>
        </div>
      </div>
      <div class="carousel-item">
        <img class="d-block w-100 h-50"
          src="/contents/images/banner2.png" style="width: 100px; height: 160px;"
          alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100 h-50"
          src="/contents/images/banner3.png" style="width: 100px; height: 160px;"
          alt="Third slide">
      </div>
    
    <!-- / ???????????? ??? ??? -->

    <!-- ?????? ????????? ????????? ?????? -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <!-- <span>Previous</span> -->
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <!-- <span>Next</span> -->
    </a>
    <!-- / ????????? ?????? ??? -->
    
    <!-- ??????????????? -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0???????????????-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- ??????????????? ??? -->
  </div>
            </div>
        </header>
        <H3 style=center;>?????? ?????? ?????? ?????????</H3>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img class="card-img-top" src="/contents/storage/61.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">?????????????????? ???????????? ????????? ???????????? ?????? Royal Blue</h5>
                                    <!-- Product price-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <span class="text-muted text-decoration-line-through">40000???</span>
                                    35000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=61&cateno=1">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="/contents/storage/72.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">?????? (23SS) 2 TONE ARCH TEE WHITE</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">30000???</span>
                                    28000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=72&cateno=1">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="/contents/storage/65.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">?????????????????? ????????? ????????? ??????</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">45000???</span>
                                    40000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=65&cateno=1">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img class="card-img-top" src="/contents/storage/63.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">??????????????? ????????? ???????????? ?????? ?????? ??????</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">55000???</span>
                                  45000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=63&cateno=1">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="/contents/storage/50.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">????????? CITY BOYS BRIEFCASE 002</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">50000???</span>
                                    25000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=50&cateno=5">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img class="card-img-top" src="/contents/storage/51.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">?????? ???????????? ???????????? ??? ???</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">20000???</span>
                                    18000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=51&cateno=3">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="/contents/storage/60.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">???????????? ???????????? ?????????</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">35000???</span>
                                   25000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=60&cateno=3">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/contents/storage/36.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <h5 class="fw-bolder">??????  ???????????? 36 DX</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                     <span class="text-muted text-decoration-line-through">70000???</span>
                                   55000???
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/contents/read.do?contentsno=36&cateno=4">?????? ?????????</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white"> Powered by Spring Boot + MyBATIS + AWS EC2 + Docker + Oracle + jQuery + Aajx + Ubuntu 18.04.</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
