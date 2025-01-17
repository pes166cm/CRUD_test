package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.InputVO;
import vo.ListVO;
import vo.SearchVO;

public class IsDAO {
	public ArrayList<ListVO> getList(){
		ArrayList<ListVO> list = new ArrayList<ListVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	A.h_zone,\r\n"
									+ "	decode(A.h_zone, '10', '서울', '20', '대전', '30', '대구', '40', '광주') as hh_zone,\r\n"
									+ "	count(B.r_no) as r_no\r\n"
									+ " from t6_hosp A, t6_resv B\r\n"
									+ " where A.h_code = B.h_code(+)\r\n"
									+ " group by A.h_zone\r\n"
									+ " order by count(B.r_no) desc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ListVO vo = new ListVO();
				vo.setH_zone(rs.getString("h_zone"));
				vo.setHh_zone(rs.getString("hh_zone"));
				vo.setR_no(rs.getInt("r_no"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int input(InputVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" insert into t6_resv values(?,?,?,?,?,?)");
			ps.setInt(1, vo.getR_no());
			ps.setString(2, vo.getJ_jumin());
			ps.setString(3, vo.getH_code());
			ps.setDate(4, vo.getR_date());
			ps.setInt(5, vo.getR_time());
			ps.setString(6, vo.getR_vcode());
			
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public ArrayList<SearchVO> getSearch(int r_no){
		ArrayList<SearchVO> list = new ArrayList<SearchVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("	select \r\n"
									+ "	A.r_no,\r\n"
									+ "	B.j_name,\r\n"
									+ "	decode(substr(B.j_jumin, 8, 1), '1', '남', '2', '여') as j_jumin,\r\n"
									+ "	C.h_name,\r\n"
									+ "	to_char(A.r_date, 'YYYY') || '년 ' || to_char(A.r_date, 'MM') || '월 ' || to_char(A.r_date, 'DD') || '일' as r_date,\r\n"
									+ "	substr(lpad(a.r_time, 4, 0), 1, 2) || ':' || substr(lpad(A.r_time, 4, 0), 3, 2) as r_time,\r\n"
									+ "	decode(A.h_code, 'H001', 'A백신', 'H002', 'B백신', 'H003', 'C백신') as h_code,\r\n"
									+ "	decode(C.h_zone, '10', '서울', '20', '대전', '30', '대구', '40', '광주') as h_zone\r\n"
									+ "from t6_jumin B , t6_hosp C, t6_resv A\r\n"
									+ "where A.j_jumin = B.j_jumin and A.h_code = C.h_code and A.r_no = ?");
			ps.setInt(1, r_no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				SearchVO vo = new SearchVO();
				vo.setR_no(rs.getInt("r_no"));
				vo.setJ_name(rs.getString("j_name"));
				vo.setJ_jumin(rs.getString("j_jumin"));
				vo.setH_name(rs.getString("h_name"));
				vo.setR_date(rs.getString("r_date"));
				vo.setR_time(rs.getString("r_time"));
				vo.setH_code(rs.getString("h_code"));
				vo.setH_zone(rs.getString("h_zone"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
