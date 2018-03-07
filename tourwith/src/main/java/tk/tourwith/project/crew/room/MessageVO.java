package tk.tourwith.project.crew.room;

import com.google.gson.Gson;

public class MessageVO {
	private String message;
	private String type;
	private String to;
	private String cr_room;
	 
	public static MessageVO converMessage(String source) {
	    MessageVO message = new MessageVO();
	    Gson gson = new Gson();
	    message = gson.fromJson(source, MessageVO.class);
	 
	    return message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getCr_room() {
		return cr_room;
	}

	public void setCr_room(String cr_room) {
		this.cr_room = cr_room;
	}


}
