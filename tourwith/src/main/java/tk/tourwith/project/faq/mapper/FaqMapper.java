package tk.tourwith.project.faq.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import tk.tourwith.project.faq.model.Faq;

@Mapper
public interface FaqMapper {
	public List<Faq> selectFaqList(Map<String, Object> paramMap) throws Exception;
}
