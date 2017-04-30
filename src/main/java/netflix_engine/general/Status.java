package netflix_engine.general;

public class Status {
	private String status;
	private String message;
	private Object content;
	
	public Status(String status, String message, Object content){
		this.status = status;
		this.message = message;
		this.setContent(content);
	}
	
	public Status(String status, String message){
		this.status = status;
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}
	
	
}
