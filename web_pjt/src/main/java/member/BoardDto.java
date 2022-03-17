package member;

import java.util.Date;

public class BoardDto {
	
	private int boardIdx;
	private String boardSbj;
	private String boardContent;
	private String boardWriter;
	private Date boardDate;
	private int boardHits; //조회수
	private int boardReply; //댓글수
	private String boardFilename;
	private String boardId; //작성자 아이디
	
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getBoardSbj() {
		return boardSbj;
	}
	public void setBoardSbj(String boardSbj) {
		this.boardSbj = boardSbj;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}
	public int getBoardReply() {
		return boardReply;
	}
	public void setBoardReply(int boardReply) {
		this.boardReply = boardReply;
	}
	public String getBoardFilename() {
		return boardFilename;
	}
	public void setBoardFilename(String boardFilename) {
		this.boardFilename = boardFilename;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

}
