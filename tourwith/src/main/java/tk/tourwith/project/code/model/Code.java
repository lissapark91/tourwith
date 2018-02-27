package tk.tourwith.project.code.model;

import java.sql.Date;

public class Code {

	
	private String code_no;
	private Date code_rgsde;
	private String code_se;
	private String code_nm;
	private String group_code;
//	private String wrter;
	private String mngr;
	
	
	
	
	
	
	public String getMngr() {
		return mngr;
	}

	public void setMngr(String mngr) {
		this.mngr = mngr;
	}

	public String getCode_no() {
		return code_no;
	}
	
	public void setCode_no(String code_no) {
		this.code_no = code_no;
	}
	
	public Date getCode_rgsde() {
		return code_rgsde;
	}
	
	public void setCode_rgsde(Date code_rgsde) {
		this.code_rgsde = code_rgsde;
	}
	
	public String getCode_se() {
		return code_se;
	}
	
	public void setCode_se(String code_se) {
		this.code_se = code_se;
	}
	
	public String getCode_nm() {
		return code_nm;
	}
	
	public void setCode_nm(String code_nm) {
		this.code_nm = code_nm;
	}
	
	public String getGroup_code() {
		return group_code;
	}
	
	public void setGroup_code(String group_code) {
		this.group_code = group_code;
	}
	
//	public String getWrter() {
//		return wrter;
//	}
//	
//	public void setWrter(String wrter) {
//		this.wrter = wrter;
//	}

	
	
	
	
}
