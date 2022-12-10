package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.lichsubean;

public class lichsudao {
	public ArrayList<lichsubean> getlichsu(int makh){
        try {
        	ArrayList<lichsubean> ds= new ArrayList<lichsubean>();
        	CoSodao cs = new CoSodao();
    		cs.KetNoi();
            String sql = "select * from lichsumuahang where makh = ?";
           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
	    	cmd.setInt(1, makh);
            
            ResultSet rs = cmd.executeQuery();
            
            
            while(rs.next()) {
            	
				String tensach = rs.getString("tensach");
				int SoLuongMua = rs.getInt("SoLuongMua");
				int gia = rs.getInt("gia");
				int ThanhTien = rs.getInt("ThanhTien");
				boolean damua =rs.getBoolean("damua");
				//Date NgayMua = rs.getDate("NgayMua");
				
				ds.add(new lichsubean(tensach, SoLuongMua, gia, ThanhTien, damua));
            }
            
            rs.close();
			   
            return ds;
	} catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return null;
	}
    }
}
