package tk.tourwith.project.crew.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {
	
	@RequestMapping("/chat")
	public String viewChattingPage() {
        return "part/chatting";
    }
	

}
