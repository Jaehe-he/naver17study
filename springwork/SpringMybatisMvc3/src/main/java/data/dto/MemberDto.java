package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("MemberDto")
public class MemberDto {
	private int num;
	private String mname;
	private String mpass;
	private String myid;
	private String mhp;
	private String maddr;
	private String mphoto;
//	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp gaipday;	
}