package sawon.data;

import java.sql.Timestamp;

public class SawonDto {
	private int num;
	private String sname;
	private String sphoto;
	private String ipsaday;
	private int sbirth;
	private String sblood;
	private Timestamp writeday;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSphoto() {
		return sphoto;
	}
	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}
	public String getIpsaday() {
		return ipsaday;
	}
	public void setIpsaday(String ipsaday) {
		this.ipsaday = ipsaday;
	}
	public int getSbirth() {
		return sbirth;
	}
	public void setSbirth(int sbirth) {
		this.sbirth = sbirth;
	}
	public String getSblood() {
		return sblood;
	}
	public void setSblood(String sblood) {
		this.sblood = sblood;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
}
