package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.CountVO;
import vo.InputVO;
import vo.PlistVO;
import vo.RlistVO;

public class IsDAO {
	
	public ArrayList<PlistVO> getpList(){
		ArrayList<PlistVO> list = new ArrayList<PlistVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	p_no, \r\n"
									+ "	p_name, \r\n"
									+ "	to_char(p_birth, 'yyyy\"년\"mm\"월\"dd\"일\"') as p_birth, \r\n"
									+ "	decode(p_gender, 'F', '여', 'M', '남') as p_gender, \r\n"
									+ "	(p_tel1 || '-' || p_tel2 || '-' || p_tel3) as p_tel, \r\n"
									+ "	decode(p_city, '10', '서울', '20', '경기','30', '강원', '40', '대구') as p_city \r\n"
									+ "from t5_patient");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				PlistVO vo = new PlistVO();
				vo.setP_no(rs.getString("p_no"));
				vo.setP_name(rs.getString("p_name"));
				vo.setP_birth(rs.getString("p_birth"));
				vo.setP_gender(rs.getString("p_gender"));
				vo.setP_tel(rs.getString("p_tel"));
				vo.setP_city(rs.getString("p_city"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<RlistVO> getrList(){
		ArrayList<RlistVO> list = new ArrayList<RlistVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	A.p_no,\r\n"
									+ "	A.p_name,\r\n"
									+ "	B.t_name,\r\n"
									+ "	to_char(C.t_sdate, 'yyyy-mm-dd') t_sdate,\r\n"
									+ "	decode(C.t_status, '1', '검사중','2', '검사완료') t_status, \r\n"
									+ "	to_char(C.t_ldate, 'yyyy-mm-dd') t_ldate,\r\n"
									+ "	decode(C.t_result, 'X' , '미입력','P', '양성', 'N', '음성') t_result\r\n"
									+ "from t5_patient A, t5_test B, t5_result C\r\n"
									+ "where A.p_no = C.p_no and B.t_code = C.t_code");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				RlistVO vo = new RlistVO();
				vo.setP_no(rs.getString("p_no"));
				vo.setP_name(rs.getString("p_name"));
				vo.setT_name(rs.getString("t_name"));
				vo.setT_sdate(rs.getString("t_sdate"));
				vo.setT_status(rs.getString("t_status"));
				vo.setT_ldate(rs.getString("t_ldate"));
				vo.setT_result(rs.getString("t_result"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<CountVO> getcountList(){
		ArrayList<CountVO> list = new ArrayList<CountVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	B.p_city,\r\n"
									+ "	decode(B.p_city, '10', '서울', '20', '경기','30', '강원', '40', '대구') as city,\r\n"
									+ "	count(B.p_city) as count\r\n"
									+ "from t5_result A, t5_patient B\r\n"
									+ "where A.p_no = B.p_no\r\n"
									+ "group by B.p_city\r\n"
									+ "order by B.p_city asc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				CountVO vo = new CountVO();
				vo.setP_city(rs.getString("p_city"));
				vo.setCity(rs.getString("city"));
				vo.setCount(rs.getString("count"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<String> getP_no(){
		ArrayList<String> list = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select p_no from t5_patient ");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String str = new String();
				str = rs.getString("p_no");
				list.add(str);
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
			ps = con.prepareStatement(" insert into t5_result values(?,?,?,?,?,?) ");
			ps.setString(1, vo.getP_no());
			ps.setString(2, vo.getT_code());
			ps.setDate(3, vo.getT_sdate());
			ps.setString(4, vo.getT_status());
			ps.setDate(5, vo.getT_ldate());
			ps.setString(6, vo.getT_result());
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public PlistVO listOne(String p_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		PlistVO vo = new PlistVO();
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select * from t5_patient where p_no = ?");
			ps.setString(1, p_no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setP_no(rs.getString(1));
				vo.setP_name(rs.getString(2));
				vo.setP_birth(rs.getString(3));
				vo.setP_gender(rs.getString(4));
				vo.setP_tel1(rs.getString(5));
				vo.setP_tel2(rs.getString(6));
				vo.setP_tel3(rs.getString(7));
				vo.setP_city(rs.getString(8));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int update(PlistVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" update t5_patient set"
									+ " p_name=?, p_birth=?, p_gender=?,"
									+ " p_tel1=?, p_tel2=?, p_tel3=?, p_city=?"
									+ " where p_no=?");
			ps.setString(1, vo.getP_name());
			ps.setString(2, vo.getP_birth());
			ps.setString(3, vo.getP_gender());
			ps.setString(4, vo.getP_tel1());
			ps.setString(5, vo.getP_tel2());
			ps.setString(6, vo.getP_tel3());
			ps.setString(7, vo.getP_city());
			ps.setString(8, vo.getP_no());
			
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
}
