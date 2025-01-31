package simpleboard.data;

import java.sql.Timestamp;

public class SimpleBoardDto {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp writeday;
	
	public SimpleBoardDto() {
		// TODO Auto-generated constructor stub
	}

	public SimpleBoardDto(String writer, String subject, String content) {
		super();
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
}