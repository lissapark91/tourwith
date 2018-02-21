package tk.tourwith.project.faq.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.faq.mapper.FaqMapper;
import tk.tourwith.project.faq.model.Faq;
import tk.tourwith.project.faq.service.FaqService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;
		
	@Service(value="faqService")
	public class FaqServiceImpl implements FaqService{

	@Autowired
	FaqMapper faqMapper;
	
	@Autowired
	NumberCreateMapper numberCreateMapper;
	
	// FAQ 게시글 조회
	@Override
	public List<Faq> selectFaqList(Map<String, Object> paramMap) throws Exception {
		
		return faqMapper.selectFaqList(paramMap);
	}

	// FAQ 게시글 보기
	@Override
	public Faq viewFaq(String faq_no) throws Exception {
		
		faqMapper.updateHitCnt(faq_no);
		
		Faq faq = faqMapper.selectFaq(faq_no);
		
		return faq;			
	}
	
	// FAQ 게시글 작성
	@Override
	public int insertFaq(Faq faq) throws Exception {
		
		int updCnt = faqMapper.insertFaq(faq);
		
		if(updCnt > 0) {
			numberCreateMapper.updateNumber("FAQ");
		}
		
		return updCnt;
	}

	@Override
	public int updateFaq(Faq faq) throws Exception {

		int updCnt = faqMapper.updateFaq(faq);
		
		return updCnt;
	}

	@Override
	public int deleteFaq(Faq faq) throws Exception {
		
		int updCnt = faqMapper.deleteFaq(faq);
		
		return updCnt;
	}

	@Override
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception {

		return faqMapper.getTotalCnt(paramMap);
	}

	

}
