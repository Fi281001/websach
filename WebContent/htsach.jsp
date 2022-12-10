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
  	<style>
  		.page-active .page-link 	 {
  			background-color: blue;
  			color: black;
  		}
  	</style>

</head>
<body>
	<% giohangbo gh = (giohangbo) session.getAttribute("gio");
	ArrayList<sachbean> dssach = (ArrayList<sachbean>)request.getAttribute("dssach");
	int n=dssach.size();
	int st = (n/10 == 0) ? 1 : n/10;
	
	if(n/10 != 0) st++;
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
		<div class="container-fluid container">
		    <ul class="list-group list-item">
				<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				//loaibo loai = new loaibo();
				ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
					for(loaibean l: loai/*loai.getloai()*/){%>
						<li class=""><a class="list-group-item" href="htsach?ml=<%=l.getMaLoai()%>">
						<%=l.getTenLoai()%></a></li>
					<%
					}
				%>
		    </ul>
		    
		    
		    <table width="600" style="padding: 0 15px">
		   		<%-- <%  sachbo sbo= new sachbo();
		   		    ArrayList<sachbean> dssach = sbo.getsach();
		   		    
		   		    if (request.getParameter("search")!=null){
		   		    	dssach = sbo.timKiemTheoTen(dssach, request.getParameter("search"));
		   		    	if (dssach.isEmpty()) {
		   		 %>   		
		   		 			<h4>Không có sách tên <%=request.getParameter("search")%></h4>
		   		 <%   	}
		   		    }
		   		    else if (request.getParameter("ml")!=null){
		   		    	dssach = sbo.timKiemTheoLoai(dssach, request.getParameter("ml"));
		   		    	
		   		    	if (dssach.isEmpty()) {
		   		 %>   		
		   		   		 			<h4>Không có sách loại <%=request.getParameter("ml")%></h4>
		   		 <%   	
		   		   		 }
		   		    } --%>
		   		    <% 
		   		    	
			   		    /* int n=dssach.size(); */
			   		    int trang = (int)request.getAttribute("trang");
			   		    int start = (trang-1)*10;
			   		    int end = (trang)*10;
			   		 if(trang  == n/10 +1){
		   					if(n%10 != 0)end = (trang -1)*10 + n%10;
		   				} 
			   		    for(int i=start;i<end;i++){
			   		    	sachbean s = dssach.get(i);
			   		%>
			   		     <tr>
				   		      <td>
					   		  	 <img style="border-radius: 6px" src="<%=s.getAnh() %>"> <br>
					   		     <%=s.getTenSach() %> <br>
					   		     <%=s.getTacGia() %><br>
					   		     <%=s.getGia() %><br>
					   		     
					   		     <a href="giohang?addbook=true&ms=<%=s.getMaSach()%>&tensach=<%=s.getTenSach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     	<img src="mua.jpg"/>
					   		     </a>
					   		  </td>
				   		   
				   		   	  <% i++; 
				   		   	  if(i<end){
				   		      		s = dssach.get(i);%>
				   		     		<td>
							   		    <img style="border-radius: 6px" src="<%=s.getAnh() %>"> <br>
							   		    <%=s.getTenSach()%> <br>
							   	     	<%=s.getTacGia() %><br>
							   		    <%=s.getGia() %><br>
							   		    <a href="giohang?addbook=true&ms=<%=s.getMaSach()%>&tensach=<%=s.getTenSach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     			<img src="mua.jpg"/>
					   		     		</a>
						   		     </td>
					   		
				   		     <%} %>
				   		  </tr>
				   	<%} %>
	   		 </table>
	   		 <div>
			
	</div>
			
		</div>
			</div>
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
						<%                //Button Previous
					        int back = 0;
					        if (trang == 0 || trang == 1) {
					            back = 1;//Luon la page 1
					        } else {
					            back = trang - 1;//Neu pages tu 2 tro len thi back tru 1
					        }
					    %>
				<li class="page-item"><a class="page-link" href="htsach?trang=<%=back%>">Previous</a></li>
				    	<%for(int i = 1; i<= st; i++){%>
				 		<li class="page-item <%=(trang ==i ) ? "page-active":""%>"><a class="page-link" href="htsach?trang=<%=i %>"><%=i %></a></li>
				    <%} %>
				    
							     <%                //Button Previous
						        int next = 0;
						        if(trang == st){
						        	next= st;
						        }else{
						        	next = trang + 1;
						        }
						   
						    %>
				    <li class="page-item"><a class="page-link" href="htsach?trang=<%=next%>">Next</a></li>
				  </ul>
				</nav>
</body>
</html>