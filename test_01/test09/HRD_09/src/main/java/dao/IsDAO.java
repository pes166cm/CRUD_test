package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.ListOne;
import vo.ListThree;
import vo.ListTwo;

public class IsDAO {
	public ArrayList<ListOne> getListOne(){
		ArrayList<ListOne> list = new ArrayList<ListOne>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select \r\n"
									+ "	artist_id,\r\n"
									+ "	artist_name,\r\n"
									+ "	substr(artist_birth, 1, 4) || '년' || substr(artist_birth, 5, 2) || '월' || substr(artist_birth, 7, 2) || '일' as birth,\r\n"
									+ "	decode(aritst_gender, 'F', '여자', 'M', '남자') as gender,\r\n"
									+ "	decode(talent, '1', '보컬', '2', '댄스', '3', '랩') as talent,\r\n"
									+ "	agency\r\n"
									+ "from t9_artist");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ListOne vo = new ListOne();
				vo.setArtist_id(rs.getString("artist_id"));
				vo.setArtist_name(rs.getString("artist_name"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString("gender"));
				vo.setTalent(rs.getString("talent"));
				vo.setAgency(rs.getString("agency"));
				list.add(vo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ListTwo> getListTwo(){
		ArrayList<ListTwo> list = new ArrayList<ListTwo>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select \r\n"
									+ "	C.serial_no,\r\n"
									+ "	A.artist_name,\r\n"
									+ "	substr(A.artist_birth, 1, 4) || '년' || substr(A.artist_birth, 5, 2) || '월' || substr(A.artist_birth, 7, 2) || '일' as birth,\r\n"
									+ "	C.point,\r\n"
									+ "	case\r\n"
									+ "		when C.point >= 90 then 'A' \r\n"
									+ "		when C.point >= 80 then 'B' \r\n"
									+ "		when C.point >= 70 then 'C' \r\n"
									+ "		when C.point >= 60 then 'D' \r\n"
									+ "		else 'F'\r\n"
									+ "	end as point_two,\r\n"
									+ "	B.mento_name\r\n"
									+ "from t9_artist A, t9_mento B, t9_point C\r\n"
									+ "where B.mento_id = C.mento_id and C.artist_id = A.artist_id");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ListTwo vo = new ListTwo();
				vo.setSerial_no(rs.getString("serial_no"));
				vo.setArtist_name(rs.getString("artist_name"));
				vo.setBirth(rs.getString("birth"));
				vo.setPoint(rs.getString("point"));
				vo.setPoint_two(rs.getString("point_two"));
				vo.setMento_name(rs.getString("mento_name"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ListThree> getListThree(){
		ArrayList<ListThree> list = new ArrayList<ListThree>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select\r\n"
									+ "	A.artist_name,\r\n"
									+ "	round(sum(B.point),1) as sum_point,\r\n"
									+ "	round(avg(B.point),1) as avg_point,\r\n"
									+ "	rank() over(order by sum(B.point) desc) as rank\r\n"
									+ "from t9_artist A, t9_point B\r\n"
									+ "where A.artist_id = B.artist_id\r\n"
									+ "group by A.artist_name\r\n"
									+ "order by rank");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ListThree vo = new ListThree();
				vo.setArtist_name(rs.getString("artist_name"));
				vo.setSum_point(rs.getString("sum_point"));
				vo.setAvg_point(rs.getString("avg_point"));
				vo.setRank(rs.getString("rank"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int input(ListOne vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" insert into t9_artist "
									+ " values(?,?,?,?,?,?)");
			ps.setString(1, vo.getArtist_id());
			ps.setString(2, vo.getArtist_name());
			ps.setString(3, vo.getBirth());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getTalent());
			ps.setString(6, vo.getAgency());
			
			n = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
