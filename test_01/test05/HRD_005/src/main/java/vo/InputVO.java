package vo;

import java.sql.Date;

public class InputVO {
	private String p_no;
	private String t_code;
	private Date t_sdate;
	private String t_status;
	private Date t_ldate;
	private String t_result;
	
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public Date getT_sdate() {
		return t_sdate;
	}
	public void setT_sdate(Date t_sdate) {
		this.t_sdate = t_sdate;
	}
	public String getT_status() {
		return t_status;
	}
	public void setT_status(String t_status) {
		this.t_status = t_status;
	}
	public Date getT_ldate() {
		return t_ldate;
	}
	public void setT_ldate(Date t_ldate) {
		this.t_ldate = t_ldate;
	}
	public String getT_result() {
		return t_result;
	}
	public void setT_result(String t_result) {
		this.t_result = t_result;
	}
	
}
