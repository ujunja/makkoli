<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>

<link rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>
<header style="top : 0; left: 210px; position: fixed; background: white">
	<div><h1>이승원의 술마켓</h1></div>
	<div>
		<a class="underline" href="#">서울/경기도 (${areaCount[0] })</a>
		<a class="underline" href="#">충청도 (${areaCount[1] })</a>
		<a class="underline" href="#">강원도 (${areaCount[2] })</a>
		<a class="underline" href="#">전라도 (${areaCount[3] })</a>
		<a class="underline" href="#">경상도 (${areaCount[4] })</a>
		<a class="underline" href="#">제주도 (${areaCount[5] })</a>
	</div>
<br><br><hr>
<div style="width: 350px; display: inline-block; margin: 0; text-align: left;">상품 ${total }개</div>
<a style="width: 100px; display: inline-block; margin: 0" href="javascript:sort(1)" >낮은 가격순</a>
<a style="width: 100px; display: inline-block; margin: 0" href="javascript:sort(2)">높은가격순</a>
<a style="width: 100px; display: inline-block; margin: 0" href="javascript:sort(3)">최근등록순</a>
<a style="width: 100px; display: inline-block; margin: 0" href="javascript:sort(4)">지난등록순</a>

<select style="width: 100px; display: inline-block; margin: 0">
	<option name="five" value="five">4개씩 보기</option>
	<option name="ten" value="ten">8개씩 보기</option>
	<option name="twenty" value="twenty">12개씩 보기</option>
</select>

<hr><br>
</header>


<script type="text/javascript">
		
	function sort(num) {
		array = [];
		article = document.getElementsByTagName('article');

		<c:forEach var="str" items="${list }">
		data = {
			name: '${str.name}',			area: '${str.area}',
			company: '${str.company}',		regday: '<fmt:formatDate value="${str.regday }" pattern="yyyy.MM.dd"/>',
			cost: ${str.cost } * 1,
		}		
			array.push(data);
		</c:forEach>
		
		switch(num) {
		case 1:
	 		array.sort(function(a, b) {
				return a.cost - b.cost;		// 낮은가격 먼저
			});
	 		break;
		case 2:
		 	array.sort(function(a, b) {
				return b.cost - a.cost;		// 높은가격 먼저
			});
		 	break;
		case 3:
		 	array.sort(function(a, b) {
				return a.regday > b.regday ? -1 : 1;		// 날짜 정렬
			});
		 	break;
		case 4:
		 	array.sort(function(a, b) {
				return a.regday < b.regday ? -1 : 1;		// 날짜 정렬
			});
		 	break;
		}
			 	
	 	for(i = 0; i < array.length; i++) {
	 		article[i].children[0].setAttribute('src', '${cpath }/img/' + array[i].name + '.jpg'); 
	 		article[i].children[1].innerHTML = array[i].name + ' ' + array[i].area;
	 		array[i].cost = numberFormat(array[i].cost);
	 		array[i].cost = <fmt:formatNumber value='${array[i].cost }' pattern="#,###"/> + '원';		// null
			// el 태그를 주석처리 하려면 아래 주석을 사용하시오
			<%-- --%>
			article[i].children[2].innerHTML = array[i].cost;
	 		article[i].children[3].innerHTML = '등록날짜 : ' + array[i].regday;
	 	}
	}
	
	function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");		// 콤마 천단위 //정규표현식 // 리눅스에서 :s 찾아보도록 하시오
		}
	
</script>

<section>
	<c:forEach var="Item" items="${list }">
	<article>
		<img src="${cpath }/img/${Item.name }.jpg">
		<h5>${Item.name } ${Item.area }</h5>
		<h5><fmt:formatNumber value="${Item.cost }" pattern="#,###"/>원</h5>
		<h5>등록날짜 : <fmt:formatDate value="${Item.regday }" pattern="yyyy.MM.dd"/></h5>
	</article>
	</c:forEach>
</section>


</body>
</html>