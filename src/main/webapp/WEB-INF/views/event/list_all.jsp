<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
  <A href="./list_all.do" class='title_link'>이벤트 글 목록</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
    	<col style="width: 10%;"></col>
      <col style="width: 90%;"></col>
    </colgroup>
    <tbody>
      <c:forEach var="cateEventVO" items="${list }">
        <c:set var="name" value="${cateEventVO.name }" />
				<c:set var="evtno" value="${cateEventVO.evtno }" />
				<c:set var="evtitle" value="${cateEventVO.evtitle }" />
        <c:set var="evdesc" value="${cateEventVO.evdesc }" />
        <c:set var="evdate" value="${cateEventVO.evdate }" />
				<c:set var="evimage_rsaved" value="${cateEventVO.evimage_rsaved.toLowerCase() }" />
				<c:set var="evimage_t" value="${cateEventVO.evimage_t }" />
				<c:set var="evimage_r" value="${cateEventVO.evimage_r }" />
				<c:set var="evimage_size" value="${cateEventVO.evimage_size }" />
				<c:set var="evword" value="${cateEventVO.evword }" />
        <c:set var="cateno" value="${cateEventVO.cateno }" />				
        <c:set var="adminno" value="${cateEventVO.adminno }" />        
        <tr style="height: 132px;"> 
          <td style='vertical-align: middle; text-align: center;'>
          ${name }
          </td>
          
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${evimage_t.endsWith('jpg') || evimage_t.endsWith('png') || evimage_t.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
                <%-- /static/contents/storage/ --%>
                <a href="./read.do?evtno=${evtno}&now_page=${param.now_page }"><IMG src="/contents/storage/${evimage_t }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/event/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <a href="./read.do?evtno=${evtno}&cateno=${cateno}"><strong>${evtitle}</strong> 
            <c:choose>
              <c:when test="${evdesc.length() > 160 }">
                  ${evdesc.substring(0, 160)}.....
              </c:when>
              <c:when test="${evdesc.length() <= 160 }">
                  ${evdesc}
              </c:when>
            </c:choose>
            
            </a> 
          </td> 
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
</DIV>
</body>
 
</html>

