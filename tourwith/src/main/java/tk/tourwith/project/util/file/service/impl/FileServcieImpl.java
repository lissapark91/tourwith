package tk.tourwith.project.util.file.service.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tk.tourwith.project.util.ContstantUtil;
import tk.tourwith.project.util.file.mapper.FileMapper;
import tk.tourwith.project.util.file.model.File;
import tk.tourwith.project.util.file.service.FileService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service("fileService")
public class FileServcieImpl implements FileService{

	@Autowired
	NumberCreateMapper numberCreateMapper;
	@Autowired
	FileMapper fileMapper;
	
	private SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
	private DecimalFormat deciFmt = new DecimalFormat();
	
	@Override
	public int insertFile(File file) throws IOException {
		
		MultipartFile multiPartFile = file.getFile();
		
		//파일과 관련된 정보 추가
		file.setFile_ty(multiPartFile.getContentType());
		file.setFile_size(multiPartFile.getSize());
		file.setFancy_size(getFancySize(multiPartFile.getSize()));
		file.setFile_nm(multiPartFile.getOriginalFilename());
		file.setDetail_stre_cours("/" + fmt.format(new Date()));
		
		file.setStre_nm(UUID.randomUUID().toString() + "_" + multiPartFile.getOriginalFilename());
		
		//파일 저장
		java.io.File  savefile = new java.io.File(ContstantUtil.UPLOAD_PATH + file.getDetail_stre_cours() + "/" + file.getStre_nm());
		
		FileUtils.copyInputStreamToFile(multiPartFile.getInputStream(), savefile);
				
		int updCnt = fileMapper.insertFile(file);
		
		if(updCnt > 0) {
			
			numberCreateMapper.updateNumber("FILE_MANAGE");

		}
		
		return updCnt;
	}

	@Override
	public File selectFileByPk(String file_no) {
		
		return fileMapper.selectFileByPk(file_no);
	}

	@Override
	public File uploadFile(MultipartFile multiPartFile) throws IOException {
		
		File file = new File();
		
		file.setFile(multiPartFile); //multipartfile을 담아준다.
		
		file.setFile_ty(multiPartFile.getContentType());
		file.setFile_size(multiPartFile.getSize());
		file.setFancy_size(getFancySize(multiPartFile.getSize()));
		file.setFile_nm(multiPartFile.getOriginalFilename());
		file.setDetail_stre_cours(fmt.format(new Date()));
		
		file.setStre_nm(UUID.randomUUID().toString() + "_" + multiPartFile.getOriginalFilename());
		
		//파일 저장
		java.io.File  savefile = new java.io.File(ContstantUtil.UPLOAD_PATH + file.getDetail_stre_cours() + file.getStre_nm());
		
		FileUtils.copyInputStreamToFile(multiPartFile.getInputStream(), savefile);
		
		//파일 타입, 사이즈, 팬시사이즈, 파일이름, 저장경로, 저장이름만 추가된 file
		return file;
	}
	
	private String getFancySize(long size) {
		
		String fancy = "";
		
		
		if(size < 1024) {
			fancy = deciFmt.format(size) + "bytes";
		}else if(size < 1024 * 1024) {
			fancy = deciFmt.format(size / 1024.0) + "KB";
		}else {
			fancy = deciFmt.format(size / (1024 * 1024.0)) + "MB";
		}
		
		return fancy;
	}
	
	@Override
	public File selectFileByStre(String stre_nm) {
		
		return fileMapper.selectFileByStre(stre_nm);
	}

	@Override
	public int updateRegynByPk(String file_no) {
		
		return fileMapper.updateRegynByPk(file_no);
	}
}
