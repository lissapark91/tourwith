package tk.tourwith.project.util.file.controller;

import java.io.IOException;
import java.net.MalformedURLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import tk.tourwith.project.member.model.Member;
import tk.tourwith.project.util.ContstantUtil;
import tk.tourwith.project.util.file.model.File;
import tk.tourwith.project.util.file.service.impl.FileServcieImpl;

@Controller
public class FileController {
	
	@Autowired
	FileServcieImpl fileService;
	
	//editor용 이미지 업로드
	@ResponseBody
	@RequestMapping(value="/image/upload", method=RequestMethod.POST)
	public String imageUpload(@RequestParam("file") MultipartFile imgFile,
			HttpSession session) throws IOException {
		
		File file = new File();
		file.setFile(imgFile);
		
		//로그인유저를 작성자로
		Member member = (Member) session.getAttribute("LOGIN_USER");
		
		file.setRegister(member.getMb_no());
		
		fileService.insertFile(file);
		String stre_nm = file.getStre_nm();
		file = fileService.selectFileByStre(stre_nm);
		
		return file.getFile_no();
	}
	
	
	@RequestMapping(value="/image/{file_no}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<?> imageURL(@PathVariable("file_no") String file_no) throws MalformedURLException {
		
		File image = null;
		Resource resource = null;
		
			
		image = fileService.selectFileByPk(file_no);
			
		String path = ContstantUtil.UPLOAD_PATH + image.getDetail_stre_cours()
						+ "/" + image.getStre_nm();
		
		System.out.println("path : " + path);
		resource = new UrlResource("file:"+path);
		
		HttpHeaders headers = new HttpHeaders();
		String content_disposition = "attachment; filename=\"" + image.getFile_nm() + "\"";
		headers.add(HttpHeaders.CONTENT_DISPOSITION, content_disposition);
		headers.setContentType(MediaType.valueOf(image.getFile_ty()));
		
		return ResponseEntity.ok().headers(headers).body(resource);

		
	}
	

}
