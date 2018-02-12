package tk.tourwith.project.crew.model;

import java.util.List;

import tk.tourwith.project.member.model.Member;

public class Crew {
	
	private String cr_no;	
	private String cr_sj;	
	private String thema;	
	private String main_cours;	
	private String detail_trplc;	
	private String deprde;	
	private String arvlde;	
	private int now_male_nmpr;	
	private int male_nmpr;	
	private int female_nmpr;	
	private int now_female_nmpr;	
	private String prtxt;	
	private String reg_de;	
	private String upd_de;	
	private String del_yn;	
	private String cr_leadr_mb_no;	
	private String trplc_no	;
	private String rcrit_sttus;
	
// 크루가 포함해야 할 정보 리스트들 추가 해야 함.
//	private List<Member> crMemberList;
	
	
	public String getCr_no() {
		return cr_no;
	}
	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}
	public String getCr_sj() {
		return cr_sj;
	}
	public void setCr_sj(String cr_sj) {
		this.cr_sj = cr_sj;
	}
	public String getThema() {
		return thema;
	}
	public void setThema(String thema) {
		this.thema = thema;
	}
	public String getMain_cours() {
		return main_cours;
	}
	public void setMain_cours(String main_cours) {
		this.main_cours = main_cours;
	}
	public String getDetail_trplc() {
		return detail_trplc;
	}
	public void setDetail_trplc(String detail_trplc) {
		this.detail_trplc = detail_trplc;
	}
	public String getDeprde() {
		return deprde;
	}
	public void setDeprde(String deprde) {
		this.deprde = deprde;
	}
	public String getArvlde() {
		return arvlde;
	}
	public void setArvlde(String arvlde) {
		this.arvlde = arvlde;
	}
	public int getNow_male_nmpr() {
		return now_male_nmpr;
	}
	public void setNow_male_nmpr(int now_male_nmpr) {
		this.now_male_nmpr = now_male_nmpr;
	}
	public int getMale_nmpr() {
		return male_nmpr;
	}
	public void setMale_nmpr(int male_nmpr) {
		this.male_nmpr = male_nmpr;
	}
	public int getFemale_nmpr() {
		return female_nmpr;
	}
	public void setFemale_nmpr(int female_nmpr) {
		this.female_nmpr = female_nmpr;
	}
	public int getNow_female_nmpr() {
		return now_female_nmpr;
	}
	public void setNow_female_nmpr(int now_female_nmpr) {
		this.now_female_nmpr = now_female_nmpr;
	}
	public String getPrtxt() {
		return prtxt;
	}
	public void setPrtxt(String prtxt) {
		this.prtxt = prtxt;
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
	public String getCr_leadr_mb_no() {
		return cr_leadr_mb_no;
	}
	public void setCr_leadr_mb_no(String cr_leadr_mb_no) {
		this.cr_leadr_mb_no = cr_leadr_mb_no;
	}
	public String getTrplc_no() {
		return trplc_no;
	}
	public void setTrplc_no(String trplc_no) {
		this.trplc_no = trplc_no;
	}
	public String getRcrit_sttus() {
		return rcrit_sttus;
	}
	public void setRcrit_sttus(String rcrit_sttus) {
		this.rcrit_sttus = rcrit_sttus;
	}	

	
	
}
