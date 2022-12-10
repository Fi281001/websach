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
	<% giohangbo gh = (giohangbo) session.getAttribute("gio");
	ArrayList<sachbean> dssach = (ArrayList<sachbean>)request.getAttribute("dssach");
	
	khachhangbean kh = (khachhangbean) session.getAttribute("kh");
	%>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="htsach">Trang Chủ</a>
    		</div>
		    <ul class="nav navbar-nav">
			      <li class="<% if (gh != null && gh.countBook() != 0) out.print("active"); %>"><a href="htgio">
			      <% if (gh != null){
			    	  if (gh.countBook() == 0)
				    		out.print("Giỏ Hàng");
				    	else{
				    		out.print("Giỏ Hàng (" + gh.countBook() + ")");
				    	} 
			      }
			      else{
			    	  out.print("Giỏ Hàng");
			      }
			      
			      %>
			      </a></li>
			      <li><a href="#">Thanh Toán</a></li>
			      <li><a href="lichsu">Lịch sử mua hàng</a></li>
			      <li><a href="#"><%=session.getAttribute("Sum")%></a></li>
		    </ul>
		    
		    <form class="navbar-form navbar-left">
				 <input type="text" class="form-control" placeholder="Tìm kiếm ở đây" name="search" value="">
		 		<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		    <ul class="nav navbar-nav navbar-right">
			      <li><a href="removesession.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			      <li>
			      <% if (session.getAttribute("kh") == null){ %>
			    	 <a href="ktdn"><span class="glyphicon glyphicon-user"></span>Log In</a>
			      <%}else{ %>
			    	 <a href="#"><span class="glyphicon glyphicon-user">
			    	 	<%=kh.getHoten() %>
			    	 </a>
			      <%} %>
			      
			      
			      
			      </a></li>
		    </ul>
  		</div>
	</nav>
	
	<div class="container">
	 <h3>Lịch sử mua hàng</h3>
		<div class="container-fluid container">
		     
		    <table width="600" style="padding: 0 15px"  border="1">
		    
		    	
		    	
		    				<tr height="30">
		    					<td style="font-weight: 700">Ten sach</td>
		    					<td style="font-weight: 700">Gia</td>
		    					<td style="font-weight: 700">So Luong</td>
		    					<td style="font-weight: 700">Thanh Tien</td>
		    					
		    				</tr>
		    		
		    		<% if (request.getAttribute("ds") != null){
		    			
		    			ArrayList<lichsubean> ds= (ArrayList<lichsubean>) request.getAttribute("ds");
		    			
		    			for (lichsubean o : ds){%>
		    				<tr height="30">
		    					<td><%=o.getTensach() %></td>
		    					<td><%=o.getGia() %></td>
		    					<td><%=o.getSoLuongMua() %></td>
		    					<td><%=o.getThanhTien() %></td>
		    					
		    				</tr>
		    			<%
		    			}%>
		    	
		    		<%}
		    		%>
		    		
	   		 </table>
	   		 <div>
			
	</div>
			
		</div>
			</div>
		
</body>
</html>