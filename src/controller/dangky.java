package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class dangky
 */
@WebServlet("/dangky")
public class dangky extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangky() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
			
		String hoten = request.getParameter("fullname");
		String email = request.getParameter("email");
		String tk = request.getParameter("tk");
		String matkhau = request.getParameter("password");
		String matkhau2 = request.getParameter("password2");
		if (hoten != null && email != null && tk != null && matkhau != null && matkhau2 != null ) {
			 khachhangbo kh = new khachhangbo();
			if(matkhau.equals(matkhau2)) {
				if( kh.themkhachhang(hoten, email, tk, matkhau)== false) {
					RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
					rd.forward(request, response);
				}else {
						RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
						rd.forward(request, response);
						}
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
				rd.forward(request, response);
			}
			
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
			rd.forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
