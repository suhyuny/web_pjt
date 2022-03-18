package member;

import java.util.Date;

public class ReplyDto {
	
	private int replyIdx;
	private String replyContent;
	private String replyWriter; //name
	private Date replyDate;
	private int replyBoardIdx;
	
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public int getReplyBoardIdx() {
		return replyBoardIdx;
	}
	public void setReplyBoardIdx(int replyBoardIdx) {
		this.replyBoardIdx = replyBoardIdx;
	}
}
