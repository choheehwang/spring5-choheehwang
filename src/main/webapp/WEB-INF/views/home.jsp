<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>스프링</title>
</head>
<body>
<h1>
	Hello! We always welcome you.
</h1>
<P> <c:out value="현재 한국 서버의 시간은 ${serverTime} 입니다."></c:out>
<!--  c:out 태그를 사용하는 이유는 해킹 방지용으로 필요합니다. -->
</P>
<P> 현재 한국 서버의 시간은 ${serverTime} 입니다.
<script>alert('It is NOT TRUE');</script>
</P>
</body>
</html>
