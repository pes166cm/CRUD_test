package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.Student2VO;
import vo.StudentVO;

public class StudentDAO {
	public ArrayList<StudentVO> getList(){
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	s_no, \r\n"
									+ "	s_name, \r\n"
									+ "	substr(s_no, 1, 1) as year, \r\n"
									+ "	substr(s_no, 2, 2) as ban,\r\n"
									+ "	substr(s_no, 4, 2) as num,\r\n"
									+ "	decode(s_gender, 'M', '남', 'F', '여') as s_gender,\r\n"
									+ "	substr(s_phone, 1, 3) || '-' || substr(s_phone, 4, 4) || '-' || substr(s_phone, 7, 4) as s_phone,\r\n"
									+ "	s_address\r\n"
									+ "from t4_student");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setS_no(rs.getString("s_no"));
				vo.setS_name(rs.getString("s_name"));
				vo.setYear(rs.getString("year"));
				vo.setBan(rs.getString("ban"));
				vo.setNum(rs.getString("num"));
				vo.setS_gender(rs.getString("s_gender"));
				vo.setS_phone(rs.getString("s_phone"));
				vo.setS_address(rs.getString("s_address"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<Student2VO> getList2(){
		ArrayList<Student2VO> list = new ArrayList<Student2VO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select A.s_no,\r\n"
									+ "	substr(A.s_no, 1, 1) as year,\r\n"
									+ "	substr(A.s_no, 2, 2) as ban,\r\n"
									+ "	substr(A.s_no, 4, 2) as num,\r\n"
									+ "	A.s_name,\r\n"
									+ "	B.e_kor,\r\n"
									+ "	B.e_math,\r\n"
									+ "	B.e_eng,\r\n"
									+ "	B.e_hist,\r\n"
									+ "	(B.e_kor + B.e_math + B.e_eng + B.e_hist) as sum,\r\n"
									+ "	round((B.e_kor + B.e_math + B.e_eng + B.e_hist)/4, 2) as avg,\r\n"
									+ "	decode(B.e_kor, null, null, rank() over (order by (B.e_kor + B.e_eng + B.e_math + B.e_hist) desc nulls last)) as rank\r\n"
									+ "from T4_STUDENT A, T4_EXAM B\r\n"
									+ "where A.s_no = B.s_no(+)\r\n"
									+ "order by A.s_no");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Student2VO vo = new Student2VO();
				vo.setS_no(rs.getString("s_no"));
				vo.setYear(rs.getString("year"));
				vo.setBan(rs.getString("ban"));
				vo.setNum(rs.getString("num"));
				vo.setS_name(rs.getString("s_name"));
				vo.setE_kor(rs.getDouble("e_kor"));
				vo.setE_math(rs.getDouble("e_math"));
				vo.setE_eng(rs.getDouble("e_eng"));
				vo.setE_hist(rs.getDouble("e_hist"));
				vo.setSum(rs.getDouble("sum"));
				vo.setAvg(rs.getDouble("avg"));
				vo.setRank(rs.getInt("rank"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int input(StudentVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" insert into t4_student values(?,?,?,?,?)");
			ps.setString(1, vo.getS_no());
			ps.setString(2, vo.getS_name());
			ps.setString(3, vo.getS_phone());
			ps.setString(4, vo.getS_gender());
			ps.setString(5, vo.getS_address());
			n = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public StudentVO getUpdate(String s_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		StudentVO vo = new StudentVO();
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select "
									+ " s_no, "
									+ " s_name, "
									+ " s_gender, "
									+ " s_phone, "
									+ " s_address "
									+ " from t4_student where s_no = ?");
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setS_no(rs.getString("s_no"));
				vo.setS_name(rs.getString("s_name"));
				vo.setS_gender(rs.getString("s_gender"));
				vo.setS_phone(rs.getString("s_phone"));
				vo.setS_address(rs.getString("s_address"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int update(StudentVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
			
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" update t4_student set "
									+ " s_name=?, "
									+ " s_gender=?,"
									+ " s_phone=?, "
									+ " s_address=? "
									+ " where s_no =?");
			ps.setString(1, vo.getS_name());
			ps.setString(2, vo.getS_gender());
			ps.setString(3, vo.getS_phone());
			ps.setString(4, vo.getS_address());
			ps.setString(5, vo.getS_no());
			
			n = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public ArrayList<String> getS_no(){
		ArrayList<String> list = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select s_no from t4_student\r\n"
									+ "minus\r\n"
									+ "select s_no from t4_exam");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String str = new String();
				str = rs.getString("s_no");
				list.add(str);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int inputTwo(Student2VO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" insert into t4_exam values(?,?,?,?,?)");
			ps.setString(1, vo.getS_no());
			ps.setDouble(2, vo.getE_kor());
			ps.setDouble(3, vo.getE_eng());
			ps.setDouble(4, vo.getE_math());
			ps.setDouble(5, vo.getE_hist());
			
			n = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	public Student2VO getUpdate2(String s_no, String s_name) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Student2VO vo = new Student2VO();
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ " s_no,\r\n"
									+ "	e_kor,\r\n"
									+ "	e_math,\r\n"
									+ "	e_eng,\r\n"
									+ "	e_hist\r\n"
									+ " from T4_EXAM\r\n"
									+ " where s_no = ?");
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setS_no(rs.getString("s_no"));
				vo.setE_kor(rs.getDouble("e_kor"));
				vo.setE_eng(rs.getDouble("e_eng"));
				vo.setE_math(rs.getDouble("e_math"));
				vo.setE_hist(rs.getDouble("e_hist"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int update2(Student2VO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
			
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" update T4_EXAM set"
									+ " e_kor=?, "
									+ " e_eng=?, "
									+ " e_math=?, "
									+ " e_hist=? "
									+ " where s_no=?");
			ps.setDouble(1, vo.getE_kor());
			ps.setDouble(2, vo.getE_eng());
			ps.setDouble(3, vo.getE_math());
			ps.setDouble(4, vo.getE_hist());
			ps.setString(5, vo.getS_no());
			
			n = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
}
