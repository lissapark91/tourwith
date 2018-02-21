package tk.tourwith.project.util.file.service;


import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import tk.tourwith.project.util.file.model.File;

public interface FileService {
	
	public File uploadFile(MultipartFile file) throws IOException;
	
	public int insertFile(File file) throws IOException;
	
	public File selectFileByPk(String file_no);
	
	public File selectFileByStre(String stre_nm);
	
	public int updateRegynByPk(String file_no);

}
