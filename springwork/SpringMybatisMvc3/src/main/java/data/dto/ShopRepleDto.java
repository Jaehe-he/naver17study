package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("ShopRepleDto")
public class ShopRepleDto {
	private int idx;
	private int num;
	private int likes;
	private String message;
	private String photo;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp writetime;	
}