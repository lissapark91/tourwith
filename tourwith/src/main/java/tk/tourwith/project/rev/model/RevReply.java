package tk.tourwith.project.rev.model;

public class RevReply {
	private String rev_rply_no;
	private String rev_no;
	private String parnts_rply_no;
	private String writng_mb_no;
	private String con;
	private String reg_de;
	private String upd_de;
	private String del_yn;

	
	// 작성자 이름
	private String writng_mb_nick;
	
	// 작성자 사진
	private String writng_fb_id;
	
	
	public String getRev_rply_no() {
		return rev_rply_no;
	}

	public void setRev_rply_no(String rev_rply_no) {
		this.rev_rply_no = rev_rply_no;
	}

	public String getRev_no() {
		return rev_no;
	}

	public void setRev_no(String rev_no) {
		this.rev_no = rev_no;
	}

	public String getParnts_rply_no() {
		return parnts_rply_no;
	}

	public void setParnts_rply_no(String parnts_rply_no) {
		this.parnts_rply_no = parnts_rply_no;
	}

	public String getWritng_mb_no() {
		return writng_mb_no;
	}

	public void setWritng_mb_no(String writng_mb_no) {
		this.writng_mb_no = writng_mb_no;
	}

	public String getCon() {
		return con;
	}

	public void setCon(String con) {
		this.con = con;
	}

	public String getReg_de() {
		return reg_de;
	}

	public void setReg_de(String reg_de) {
		this.reg_de = reg_de;
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

	public String getWritng_mb_nick() {
		return writng_mb_nick;
	}

	public void setWritng_mb_nick(String writng_mb_nick) {
		this.writng_mb_nick = writng_mb_nick;
	}

	public String getWritng_fb_id() {
		return writng_fb_id;
	}

	public void setWritng_fb_id(String writng_fb_id) {
		this.writng_fb_id = writng_fb_id;
	}

}
