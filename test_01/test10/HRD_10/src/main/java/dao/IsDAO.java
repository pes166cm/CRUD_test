package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DBUtils;
import vo.HtterVO;

public class IsDAO {
	
	public int input(HtterVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" insert into tbl_hitter_info values(?,?,?,?,?,?,?,?)");
			
			ps.setString(1, vo.getRegistration_code());
			ps.setInt(2, vo.getGame_numbers());
			ps.setInt(3, vo.getAppearance());
			ps.setInt(4, vo.getHit_numbers());
			ps.setInt(5, vo.getHome_runs());
			ps.setInt(6, vo.getPut_out());
			ps.setInt(7, vo.getDouble_play());
			ps.setInt(8, vo.getError_count());
			
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	
	
	
	
	
	
}
