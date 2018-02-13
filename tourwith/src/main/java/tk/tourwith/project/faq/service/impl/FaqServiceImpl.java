package tk.tourwith.project.faq.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.faq.mapper.FaqMapper;
import tk.tourwith.project.faq.model.Faq;
import tk.tourwith.project.faq.service.FaqService;

@Service(value="faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	FaqMapper faqMapper;
	
	@Override
	public List<Faq> selectFaqList(Map<String, Object> paramMap) throws Exception {
		
		return faqMapper.selectFaqList(paramMap);
	}

}
