package tk.tourwith.project.faq.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.faq.model.Faq;

public interface FaqService {
	
	// 게시글 조회
	public List<Faq> selectFaqList(Map<String, Object> paramMap) throws Exception;
	
	// 게시글 보기
	public Faq viewFaq(String faq_no) throws Exception;
	
	// 게시글 등록
	public int insertFaq(Faq faq) throws Exception;
			
	// 게시글 수정
	public int updateFaq(Faq faq) throws Exception;
			
	// 게시글 삭제
	public int deleteFaq(Map<String, Object> paramMap) throws Exception;
}
