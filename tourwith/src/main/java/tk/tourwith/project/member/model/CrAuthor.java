package tk.tourwith.project.member.model;

public class CrAuthor {
	
	private String cr_author_no;
	private String mb_no;
	private String cr_no;
	private String author_code;
	
	//doesnt exist in table added by bsp
	private String author_group_code;
	
	private String cr_sj;
	
	public String getCr_author_no() {
		return cr_author_no;
	}
	public void setCr_author_no(String cr_author_no) {
		this.cr_author_no = cr_author_no;
	}
	public String getMb_no() {
		return mb_no;
	}
	public void setMb_no(String mb_no) {
		this.mb_no = mb_no;
	}
	public String getCr_no() {
		return cr_no;
	}
	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}
	public String getAuthor_code() {
		return author_code;
	}
	public void setAuthor_code(String author_code) {
		this.author_code = author_code;
	}
	public String getAuthor_group_code() {
		return author_group_code;
	}
	public void setAuthor_group_code(String author_group_code) {
		this.author_group_code = author_group_code;
	}
	public String getCr_sj() {
		return cr_sj;
	}
	public void setCr_sj(String cr_sj) {
		this.cr_sj = cr_sj;
	}

}
