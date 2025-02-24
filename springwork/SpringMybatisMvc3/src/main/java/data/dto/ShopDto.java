package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sdto")
public class ShopDto {
	private int num;
	private String sangpum;
	private String scolor;
	private int sprice;
	private int scnt;
	private String sphoto;
	private String ipgoday;
	private Timestamp writeday;	
	private String mainPhoto;
	private int replecount;//댓글 갯수저장
}