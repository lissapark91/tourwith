package tk.tourwith.project.faq.model;

import tk.tourwith.project.faq.model.Faq;

public class Faq {
	

	
// 크루가 포함해야 할 정보 리스트들 추가 해야 함.
//	private List<Member> crMemberList;
	

	private String faq_no;
	private String sj;
	private String reg_de;
	private String con;
	private int hitcnt;
	private String upd_de;
	private String del_yn;
	private String reg_mb_no;
	
	
	
	public String getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getReg_de() {
		return reg_de;
	}
	public void setReg_de(String reg_de) {
		this.reg_de = reg_de;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public int getHitcnt() {
		return hitcnt;
	}
	public void setHitcnt(int hitcnt) {
		this.hitcnt = hitcnt;
	}
	public String getUpd_de() {
		return upd_de;
	}
	public void setUpd_de(String upd_de) {
		this.upd_de = upd_de;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getReg_mb_no() {
		return reg_mb_no;
	}
	public void setReg_mb_no(String reg_mb_no) {
		this.reg_mb_no = reg_mb_no;
	}
}
