package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.ListVO;
import vo.LlistVO;
import vo.LllistVO;

public class StudentDAO {
	public ArrayList<ListVO> getList(){
		ArrayList<ListVO> list = new ArrayList<ListVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select\r\n"
									+ "	student_id,\r\n"
									+ "	student_name,\r\n"
									+ "	major_code,\r\n"
									+ "	substr(jumin, 1, 6) || '-' || substr(jumin, 7, 7) as jumin,\r\n"
									+ "	substr(phone, 1, 3) || '-' || substr(phone, 4, 4) || '-' || substr(phone, 7, 4) as phone,\r\n"
									+ "	course\r\n"
									+ " from t8_student");
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ListVO vo = new ListVO();
				vo.setStudent_id(rs.getString("student_id"));
				vo.setStudent_name(rs.getString("student_name"));
				vo.setMajor_code(rs.getString("major_code"));
				vo.setJumin(rs.getString("jumin"));
				vo.setPhone(rs.getString("phone"));
				vo.setCourse(rs.getString("course"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
		
	public ArrayList<LlistVO> getLlist(){
		ArrayList<LlistVO> list = new ArrayList<LlistVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select\r\n"
									+ "	A.student_id,\r\n"
									+ "	A.student_name,\r\n"
									+ "	substr(A.jumin, 1, 6) || '-' || substr(A.jumin, 7, 7) as jumin,\r\n"
									+ "	B.subject_name,\r\n"
									+ "	B.classification,\r\n"
									+ "	B.professor_name,\r\n"
									+ "	C.mid_term,\r\n"
									+ "	C.final_term,\r\n"
									+ "	C.attend,\r\n"
									+ "	C.report,\r\n"
									+ "	C.etc\r\n"
									+ " from t8_student A, t8_subject B, t8_grade C\r\n"
									+ " where A.student_id = C.student_id and B.subject_code = C.subject_code");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				LlistVO vo = new LlistVO();
				vo.setStudent_id(rs.getString("student_id"));
				vo.setStudent_name(rs.getString("student_name"));
				vo.setJumin(rs.getString("jumin"));
				vo.setSubject_name(rs.getString("subject_name"));
				vo.setClassification(rs.getString("classification"));
				vo.setProfessor_name(rs.getString("professor_name"));
				vo.setMid_term(rs.getInt("mid_term"));
				vo.setFinal_term(rs.getInt("final_term"));
				vo.setAttend(rs.getInt("attend"));
				vo.setReport(rs.getInt("report"));
				vo.setEtc(rs.getInt("etc"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
		
	public ArrayList<LllistVO> getLllist(){
		ArrayList<LllistVO> list = new ArrayList<LllistVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select\r\n"
									+ "	A.course,\r\n"
									+ "	A.student_id,\r\n"
									+ "	A.student_name,\r\n"
									+ "	ROUND(sum((B.mid_term*0.3)+(B.final_term*0.3)+(B.attend*0.2)+(B.report*0.1)+(B.etc*0.1)),1) as chd, \r\n"
									+ "	count(A.student_id) as counta,\r\n"
									+ "	ROUND(avg((B.mid_term*0.3)+(B.final_term*0.3)+(B.attend*0.2)+(B.report*0.1)+(B.etc*0.1)),1) as phon\r\n"
									+ " from t8_student A, t8_grade B\r\n"
									+ " where A.student_id = B.student_id\r\n"
									+ " group by A.course, A.student_id, A.student_name\r\n"
									+ " order by count(A.student_id) desc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				LllistVO vo = new LllistVO();
				vo.setCourse(rs.getString("course"));
				vo.setStudent_id(rs.getString("student_id"));
				vo.setStudent_name(rs.getString("student_name"));
				vo.setChd(rs.getInt("chd"));
				vo.setCounta(rs.getInt("counta"));
				vo.setPhon(rs.getInt("phon"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int input(ListVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" insert into t8_student values(?,?,?,?,?,?)");
			ps.setString(1, vo.getStudent_id());
			ps.setString(2, vo.getStudent_name());
			ps.setString(3, vo.getMajor_code());
			ps.setString(4, vo.getJumin());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getCourse());
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public ListVO listOne(String student_id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ListVO vo = new ListVO();
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select *"
									+ " from t8_student"
									+ " where student_id=?");
			ps.setString(1, student_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setStudent_id(rs.getString(1));
				vo.setStudent_name(rs.getString(2));
				vo.setMajor_code(rs.getString(3));
				vo.setJumin(rs.getString(4));
				vo.setPhone(rs.getString(5));
				vo.setCourse(rs.getString(6));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
		
	public int update(ListVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" update t8_student set"
									+ "	student_name=?,"
									+ " major_code=?,"
									+ " jumin=?,"
									+ " phone=?,"
									+ " course=?"
									+ " where student_id=?");
			ps.setString(1, vo.getStudent_name());
			ps.setString(2, vo.getMajor_code());
			ps.setString(3, vo.getJumin());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getCourse());
			ps.setString(6, vo.getStudent_id());
			
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
}
