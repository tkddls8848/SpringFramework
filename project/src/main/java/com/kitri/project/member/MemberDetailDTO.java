package com.kitri.project.member;

public class MemberDetailDTO extends MemberDTO {
	
	private String memID;
	private String memJIBUN;
	private String memJIBUNDETAIL;
	private int memZIPNO;
	
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public String getMemJIBUN() {
		return memJIBUN;
	}
	public void setMemJIBUN(String memJIBUN) {
		this.memJIBUN = memJIBUN;
	}
	public String getMemJIBUNDETAIL() {
		return memJIBUNDETAIL;
	}
	public void setMemJIBUNDETAIL(String memJIBUNDETAIL) {
		this.memJIBUNDETAIL = memJIBUNDETAIL;
	}
	public int getMemZIPNO() {
		return memZIPNO;
	}
	public void setMemZIPNO(int memZIPNO) {
		this.memZIPNO = memZIPNO;
	}
	
}
