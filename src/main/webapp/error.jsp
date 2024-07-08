<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
 <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
    crossorigin="anonymous"

  />
</head>
<body>

<div class="container text-center">
       <img alt="" src="img/error.png" class="img-fluid" width='300px'>
       <h3 class="display-3">Sorry ! Something went wrong ...</h3>
            <%= exception%><br/>
            <a href="index.jsp" class="btn btn-primary">Home</a>
</div>

</body>
</html>