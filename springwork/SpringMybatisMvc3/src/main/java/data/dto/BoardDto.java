package data.dto;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("BoardDto")
@Data
public class BoardDto {
	private int idx;
	private String myid;
	private String writer;
	private String subject;
	private String content;
	private int readcount;
	private int regroup;
	private int relevel;
	private int restep;
	private Timestamp writeday;
	private List<String> photos;
	private int photoCount; //사진 갯수
}
