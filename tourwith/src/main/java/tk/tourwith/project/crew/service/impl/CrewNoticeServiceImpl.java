package tk.tourwith.project.crew.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.mapper.CrewNoticeMapper;
import tk.tourwith.project.crew.model.CrewNotice;
import tk.tourwith.project.crew.service.CrewNoticeService;
import tk.tourwith.project.util.mapper.NumberCreateMapper;

@Service
public class CrewNoticeServiceImpl implements CrewNoticeService{
	
	@Autowired
	CrewNoticeMapper crewNoticeMapper;
	
	@Autowired
	NumberCreateMapper numberCreateMapper;
	
	@Override
	public List<CrewNotice> selectCrewNoticeList(Map<String, Object> paramMap) throws Exception{
		
		return crewNoticeMapper.selectCrewNoticeList(paramMap);
	}

	@Override
	public CrewNotice selectCrewNotice(String notice_no) throws Exception {
		
		crewNoticeMapper.updateHitCnt(notice_no);
		
		CrewNotice crewNotice = crewNoticeMapper.selectCrewNotice(notice_no);

		return crewNotice;
	}

	@Override
	public int insertCrewNotice(CrewNotice crewNotice) throws Exception {
		
		int updcnt = crewNoticeMapper.insertCrewNotice(crewNotice);
		
		if(updcnt>0) {
			numberCreateMapper.updateNumber("CR_NOTICE");
		}

		return updcnt;
	}

	@Override
	public int updateCrew(CrewNotice crewNotice) throws Exception {

		return crewNoticeMapper.updateCrewNotice(crewNotice);
	}

	@Override
	public int deletCrewNotice(String notice_no) throws Exception {

		return crewNoticeMapper.deleteCrewNotice(notice_no);
	}

	@Override
	public int getTotalCnt(Map<String, Object> paramMap) throws Exception {

		return crewNoticeMapper.getTotalCnt(paramMap);
	}
	

}
