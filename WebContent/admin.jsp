<%@page import="bean.dnadminbean"%>

<%@page import="bean.lichsubean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.sachdao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>AJax</title>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
  	

</head>
<body>
<%
dnadminbean kh = (dnadminbean) session.getAttribute("dn");
%>
	<nav class="navbar navbar-inverse">
	  	<div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand " href="upsach">Loai</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="admin">Trang chủ</a></li>
      
      <li><a href="loaiadmin">Quản lý loại</a></li>
      <li><a href="sachadminController">Quản lý sách</a></li>
      <li><a href="xacnhanadmin">Xác nhận</a></li>
      <li><a href="danhsachchuyentien">danh sách chuyển tiền</a></li>

	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="action_gh?xoaAll=true"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
	      <li><a href="admindn"><span class="glyphicon glyphicon-user"></span> Login</a></li>
	    </ul>
	  	</div>
</nav>
		
</body>
</html>