package shop.data;

import java.sql.Timestamp;

public class ShopDto {
	private int num;
	private String sangpum;
	private String scolor;
	private String sphoto;
	private String ipgoday;
	private int scnt;
	private int sprice;
	private Timestamp writeday;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSangpum() {
		return sangpum;
	}
	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
	}
	public String getScolor() {
		return scolor;
	}
	public void setScolor(String scolor) {
		this.scolor = scolor;
	}
	public String getSphoto() {
		return sphoto;
	}
	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}
	public String getIpgoday() {
		return ipgoday;
	}
	public void setIpgoday(String ipgoday) {
		this.ipgoday = ipgoday;
	}
	public int getScnt() {
		return scnt;
	}
	public void setScnt(int scnt) {
		this.scnt = scnt;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	

}
