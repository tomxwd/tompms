package top.tomxwd.pms.vo;

public class MsgObj {
	
	private Integer ok;//0失败 1成功
	private String msg;
	public MsgObj() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MsgObj(Integer ok, String msg) {
		super();
		this.ok = ok;
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "MsgObj [ok=" + ok + ", msg=" + msg + "]";
	}
	public Integer getOk() {
		return ok;
	}
	public void setOk(Integer ok) {
		this.ok = ok;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	
	
}
