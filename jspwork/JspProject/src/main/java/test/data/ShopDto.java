package test.data;

public class ShopDto {
	private String sang;
	private int su;
	private int dan;
	
	public ShopDto(String sang, int su, int dan) {
		super();
		this.sang = sang;
		this.su = su;
		this.dan = dan;
	}
	
	public ShopDto() {
		// ToDO Auto-generated constructor stub
	}

	public String getSang() {
		return sang;
	}

	public void setSang(String sang) {
		this.sang = sang;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}

	public int getDan() {
		return dan;
	}

	public void setDan(int dan) {
		this.dan = dan;
	}
}
