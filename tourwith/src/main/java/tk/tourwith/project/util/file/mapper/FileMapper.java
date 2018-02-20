package tk.tourwith.project.util.file.mapper;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.util.file.model.File;

@Mapper
public interface FileMapper {
	
	public int insertFile(File file);
	
	public File selectFileByPk(String file_no);
	
	public File selectFileByStre(String stre_nm);
	
	public int updateRegynByPk(String file_no);
	
}
