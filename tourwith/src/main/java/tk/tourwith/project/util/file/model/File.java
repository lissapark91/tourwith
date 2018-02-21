package tk.tourwith.project.util.file.model;

import org.springframework.web.multipart.MultipartFile;

public class File {
	
	private String file_no;
	private String file_ty;
	private String file_nm;
	private String stre_nm;
	private String detail_stre_cours;
	private long file_size;
	private String fancy_size;
	private String register;
	private String reg_de;
	private String reg_yn;
	
	private MultipartFile file;

	public String getFile_no() {
		return file_no;
	}

	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}

	public String getFile_ty() {
		return file_ty;
	}

	public void setFile_ty(String file_ty) {
		this.file_ty = file_ty;
	}

	public String getFile_nm() {
		return file_nm;
	}

	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}

	public String getStre_nm() {
		return stre_nm;
	}

	public void setStre_nm(String stre_nm) {
		this.stre_nm = stre_nm;
	}

	public String getDetail_stre_cours() {
		return detail_stre_cours;
	}

	public void setDetail_stre_cours(String detail_stre_cours) {
		this.detail_stre_cours = detail_stre_cours;
	}

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	public String getFancy_size() {
		return fancy_size;
	}

	public void setFancy_size(String fancy_size) {
		this.fancy_size = fancy_size;
	}

	public String getRegister() {
		return register;
	}

	public void setRegister(String register) {
		this.register = register;
	}

	public String getReg_de() {
		return reg_de;
	}

	public void setReg_de(String reg_de) {
		this.reg_de = reg_de;
	}

	public String getReg_yn() {
		return reg_yn;
	}

	public void setReg_yn(String reg_yn) {
		this.reg_yn = reg_yn;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	

}
