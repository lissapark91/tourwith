package tk.tourwith.project.common;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import tk.tourwith.project.crew.service.CrewService;

public class CrewTask {
	
	@Resource(name="crewService")
	private CrewService crewService;

	protected void execute() throws Exception {

		crewService.updateRcritSttusByDe();
		crewService.updateRcritSttusByNmpr();
		
	}

}
