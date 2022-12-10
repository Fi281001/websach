package bean;

import java.sql.Date;

public class lichsubean {
	
	String tensach;
	int SoLuongMua;
	int gia;
	int ThanhTien;
	boolean damua;
	//Date NgayMua;
	
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public lichsubean( String tensach, int soLuongMua, int gia, int thanhTien, boolean damua
			) {
		super();
		
		this.tensach = tensach;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
		//NgayMua = ngayMua;
	}
	



	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(int thanhTien) {
		ThanhTien = thanhTien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
//	public Date getNgayMua() {
//		return NgayMua;
//	}
//	public void setNgayMua(Date ngayMua) {
//		NgayMua = ngayMua;
//	}
}
