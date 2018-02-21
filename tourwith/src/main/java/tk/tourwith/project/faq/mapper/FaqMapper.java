package tk.tourwith.project.faq.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.faq.model.Faq;

@Mapper
public interface FaqMapper {
	public List<Faq> selectFaqList(Map<String, Object> paramMap) throws Exception;
	
	public int updateHitCnt(String faq_no) throws Exception;
	
	public Faq selectFaq(String faq_no) throws Exception;
	
	public int insertFaq(Faq faq) throws Exception;
	
	public int updateFaq(Faq faq) throws Exception;
	
	public int deleteFaq(Faq faq) throws Exception;
	
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception;
}
