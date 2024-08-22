package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.InputVO;
import vo.OneVO;
import vo.ThreeVO;
import vo.TwoVO;

public class TpDAO {
	public ArrayList<OneVO> getOneList(){
		ArrayList<OneVO> list = new ArrayList<OneVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select \r\n"
									+ "	A.c_no,\r\n"
									+ "	B.p_name,\r\n"
									+ "	A.p_code,\r\n"
									+ "	decode(A.c_school, '1', '고졸', '2', '학사', '3', '석사', '4', '박사') as c_school,\r\n"
									+ "	substr(A.c_jumin, 1, 6) || '-' || substr(A.c_jumin, 7, 13) as c_jumin,\r\n"
									+ "	A.c_city,\r\n"
									+ "	B.p_tel1 || '-' || B.p_tel2 || '-' || B.p_tel3 as p_tel\r\n"
									+ "from t3_candidate A, t3_party B\r\n"
									+ "where A.p_code = B.p_code");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OneVO vo = new OneVO();
				vo.setC_no(rs.getString("c_no"));
				vo.setP_name(rs.getString("p_name"));
				vo.setP_code(rs.getString("p_code"));
				vo.setC_school(rs.getString("c_school"));
				vo.setC_jumin(rs.getString("c_jumin"));
				vo.setC_city(rs.getString("c_city"));
				vo.setP_tel(rs.getString("p_tel"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<TwoVO> getTwoList(){
		ArrayList<TwoVO> list = new ArrayList<TwoVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	v_name,\r\n"
									+ "	'19' || substr(v_jumin, 1, 2) || '년' || substr(v_jumin, 3, 2) || '월' || substr(v_jumin, 5, 2) ||'일' as v_jumin,\r\n"
									+ "	'만' || (2024-to_number('19' || substr(v_jumin,1,2)))||'세' as age,\r\n"
									+ "	decode(substr(v_jumin, 7, 1), '1', '남', '2', '여', '3', '남', '4', '여') v_gender,\r\n"
									+ "	c_no,\r\n"
									+ "	substr(v_time, 1, 2) || ':' || substr(v_time, 3, 2) v_time,\r\n"
									+ "	decode(v_confirm, 'Y', '확인', 'N', '미확인') v_confirm \r\n"
									+ "from t3_vote");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TwoVO vo = new TwoVO();
				vo.setV_name(rs.getString("v_name"));
				vo.setV_jumin(rs.getString("v_jumin"));
				vo.setAge(rs.getString("age"));
				vo.setV_gender(rs.getString("v_gender"));
				vo.setC_no(rs.getString("c_no"));
				vo.setV_time(rs.getString("v_time"));
				vo.setV_confirm(rs.getString("v_confirm"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ThreeVO> getThreeList(){
		ArrayList<ThreeVO> list = new ArrayList<ThreeVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select \r\n"
									+ "	A.c_no,\r\n"
									+ "	B.c_name,\r\n"
									+ "	C.p_name,\r\n"
									+ "	count(A.c_no) as total,\r\n"
									+ "	rank() over(order by count(A.c_no) desc) as rank\r\n"
									+ "from t3_vote A, t3_candidate B, t3_party C\r\n"
									+ "where A.c_no = B.c_no and B.p_code = C.p_code and A.v_confirm ='Y'\r\n"
									+ "group by A.c_no, B.c_name, C.p_name\r\n"
									+ "order by rank");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ThreeVO vo  = new ThreeVO();
				vo.setC_no(rs.getString("c_no"));
				vo.setC_name(rs.getString("c_name"));
				vo.setP_name(rs.getString("p_name"));
				vo.setTotal(rs.getString("total"));
				vo.setRank(rs.getString("rank"));
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
			ps = con.prepareStatement(" insert into t3_vote values(?,?,?,?,?,?)");
			
			ps.setString(1, vo.getV_jumin());
			ps.setString(2, vo.getV_name());
			ps.setString(3, vo.getC_no());
			ps.setString(4, vo.getV_time());
			ps.setString(5, vo.getV_area());
			ps.setString(6, vo.getV_confirm());
			
			n = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	
	
	
	
	
	
	
}
