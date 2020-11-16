<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>HI, STRANGER</title>
</head>
<body>
<h1>
	Hello! We always welcome you.
</h1>
<P>
<c:out value="현재 한국 서버의 시간은 ${serverTime} 입니다."></c:out>
</P>
<P> 현재 한국 서버의 시간은 ${serverTime} 입니다.
<script>alert('안녕하세요');</script>
</P>
</body>
</html>
