package day1219;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyCar {
	private String carName;
	private int carPrice;
	private String guipDay;
	private String carColor;
	
	public MyCar() { //class가 public이면 public 붙여주는게 좋음
		//생성되는 시간을 guipDay 구해서 넣어보자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		guipDay=sdf.format(new Date());
		
		carColor="흰색";
	}

	public MyCar(String carName, int carPrice, String carColor) {
//		super(); //상속관계일 때는 필요함. 이게 없어도 기본적으로 super로 인식함
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		guipDay=sdf.format(new Date());
		
		this.carName = carName;
		this.carPrice = carPrice;
		this.carColor = carColor;
	}

	@Override //부모가 object로 되어있어 똑같은 것을 다시 부르는게 override. 부모가 가진 메서드와 override가 성립한다는 것을 증명
	public String toString() {
		return "MyCar [carName=" + carName + ", carPrice=" + carPrice +
				"\nguipDay=" + guipDay + ", carColor="
				+ carColor + "]";
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public int getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}

	public String getGuipDay() {
		return guipDay;
	}

	public void setGuipDay(String guipDay) {
		this.guipDay = guipDay;
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	
	
}
