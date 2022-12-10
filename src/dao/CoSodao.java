package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

import bean.lichsubean;
import bean.xacnhanbean;
import bo.xacnhanbo;

public class CoSodao {
	public Connection cn;
	public void KetNoi(){
		try {
			//b1: xac dinh he quan tri csdl
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("xong b1");
			cn=DriverManager.getConnection("jdbc:sqlserver://DESKTOP-KVD6FF6\\MYSQL:1433;databaseName=QlySach;user=sa; password=123;");
			System.out.println("Ok b2");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void main(String [] ts) {
		try {
			CoSodao cs = new CoSodao();
			
			cs.KetNoi();
//			lichsudao ls = new lichsudao();
//			ArrayList<lichsubean> l = ls.getlichsu(20);
//			System.out.println(l.get(9).getTensach());
//			chitiethoadon ct = new chitiethoadon();
//			int a = ct.them("b14", 0, 0);
//			System.out.println(a);
			xacnhandao xn = new xacnhandao();
			
			xacnhanbo xnb = new xacnhanbo();
			
			System.out.println(xnb.getdanhsach());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}