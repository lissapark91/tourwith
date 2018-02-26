package tk.tourwith.project.rev.model;

public class Rev {
	
	private String rev_no;
	private String sj;
	private String rev_writng_mb_no;
	private String del_yn;
	private int hitcnt;
	private String cr_no;
	private String con;
	private String reg_de;
	private String upd_de;
	
	//table에 없지만 추가
	private String trplc_no;
	private String nmpl;
	private String depr_de;
	private String arvl_de;
	private String rev_writng_mb_nm;
	
	
	
	public String getRev_no() {
		return rev_no;
	}
	public void setRev_no(String rev_no) {
		this.rev_no = rev_no;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getRev_writng_mb_no() {
		return rev_writng_mb_no;
	}
	public void setRev_writng_mb_no(String rev_writng_mb_no) {
		this.rev_writng_mb_no = rev_writng_mb_no;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public int getHitcnt() {
		return hitcnt;
	}
	public void setHitcnt(int hitcnt) {
		this.hitcnt = hitcnt;
	}
	public String getCr_no() {
		return cr_no;
	}
	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
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
	public String getTrplc_no() {
		return trplc_no;
	}
	public void setTrplc_no(String trplc_no) {
		this.trplc_no = trplc_no;
	}
	public String getNmpl() {
		return nmpl;
	}
	public void setNmpl(String nmpl) {
		this.nmpl = nmpl;
	}
	public String getDepr_de() {
		return depr_de;
	}
	public void setDepr_de(String depr_de) {
		this.depr_de = depr_de;
	}
	public String getArvl_de() {
		return arvl_de;
	}
	public void setArvl_de(String arvl_de) {
		this.arvl_de = arvl_de;
	}
	public String getRev_writng_mb_nm() {
		return rev_writng_mb_nm;
	}
	public void setRev_writng_mb_nm(String rev_writng_mb_nm) {
		this.rev_writng_mb_nm = rev_writng_mb_nm;
	}
}
