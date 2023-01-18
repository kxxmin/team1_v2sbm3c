<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Clothes</title>
 
<link href="/css/styles.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css 기준 -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>카테고리 등록</DIV>

<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <div >
       <label >카테고리 이름</label>
       <input type='text' name='name' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 50%;'>
    </div>
    <div class="content_body_bottom" >
      <button type="submit" class="btn btn-secondary">등록</button>
      <button type="button" onclick="location.href='./list_all.do'" class="btn btn-secondary">전체목록</button>
    </div>
  
  </FORM>
</DIV>

</body>
 
</html>