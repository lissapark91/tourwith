package tk.tourwith.project.common;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Service;

import tk.tourwith.project.crew.service.CrewService;
import tk.tourwith.project.crew.service.impl.CrewServiceImpl;
 
public class CrewStatusBean extends QuartzJobBean {

	/*@Resource(name="crewService")
	private CrewService crewService;*/
	
	private CrewTask crewTask;

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		
		/*System.out.println(crewService);

		crewService.updateRcritSttusByDe();
		crewService.updateRcritSttusByNmpr();
		System.out.println("=====================================");*/
		
		try {
			crewTask.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void setCrewTask(CrewTask crewTask) {
		this.crewTask = crewTask;
	}

	/*public CrewService getCrewService() {
		return crewService;
	}*/

	/*public void setCrewService(CrewService crewService) {
		this.crewService = crewService;
	}*/

}
