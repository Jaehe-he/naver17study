package data.dto;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Builder;
import lombok.Data;

@Data
@Alias("BoardRepleDto")
@Builder
public class BoardRepleDto {
	private int num;
	private int idx;
	private String myid;
	private String message;
	private String photo;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Timestamp writeday;
}
