package tk.tourwith.project.faq.service;

import java.util.List;
import java.util.Map;

import tk.tourwith.project.faq.model.Faq;

public interface FaqService {
	public List<Faq> selectFaqList(Map<String, Object> paramMap) throws Exception;
}
