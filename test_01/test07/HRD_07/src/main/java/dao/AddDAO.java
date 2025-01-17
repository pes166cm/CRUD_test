package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.ListVO;

public class AddDAO {
	public ArrayList<ListVO> getList(){
		ArrayList<ListVO> list = new ArrayList<ListVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select\r\n"
									+ "	id,\r\n"
									+ "	name,\r\n"
									+ "	credit,\r\n"
									+ "	decode(lecturer, '1', '김교수', '2', '이교수', '3', '박교수', '4', '우교수', '5', '최교수', '6', '임교수') as lecturer,\r\n"
									+ "	decode(week,  '1', '월요일', '2', '화요일', '3', '수요일', '4', '목요일', '5', '금요일') as week,\r\n"
									+ "	substr(lpad(start_hour, 4, 0), 1, 2) || '시' || substr(lpad(start_hour, 4, 0), 3, 2) || '분' as start_hour,\r\n"
									+ "	substr(lpad(end_hour, 4, 0), 1, 2) || '시' || substr(lpad(end_hour, 4, 0), 3, 2) || '분' as end_hour\r\n"
									+ " from t7_course");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ListVO vo = new ListVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setCredit(rs.getInt("credit"));
				vo.setLecturer(rs.getString("lecturer"));
				vo.setWeek(rs.getString("week"));
				vo.setStart_hour(rs.getString("start_hour"));
				vo.setEnd_hour(rs.getString("end_hour"));
				list.add(vo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int Input(ListVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("insert into t7_course values(?,?,?,?,?,?,?)");
			
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setInt(3, vo.getCredit());
			ps.setString(4, vo.getLecturer());
			ps.setString(5, vo.getWeek());
			ps.setString(6, vo.getStart_hour());
			ps.setString(7, vo.getEnd_hour());
			n = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public ListVO listOne(String id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ListVO vo = new ListVO();
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select * from t7_course where id=?");
			ps.setString(1, id); 
			rs = ps.executeQuery();
	
			if(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getInt(3));
				vo.setLecturer(rs.getString(4));
				vo.setWeek(rs.getString(5));
				vo.setStart_hour(rs.getString(6));
				vo.setEnd_hour(rs.getString(7));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int Update(ListVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" update t7_course set"
									+ " name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=?"
									+ " where id=?");
			ps.setString(1, vo.getName());
			ps.setInt(2, vo.getCredit());
			ps.setString(3, vo.getLecturer());
			ps.setString(4, vo.getWeek());
			ps.setString(5, vo.getStart_hour());
			ps.setString(6, vo.getEnd_hour());
			ps.setString(7, vo.getId());
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int delete(String id) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("delete from t7_course where id=?");
			ps.setString(1, id);
			n = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
}
