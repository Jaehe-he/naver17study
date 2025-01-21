package test.data;

public class FoodDto {
	private String foodName;
	private String foodPhoto;
	private int foodPrice;
	private String foodday;
	private int su;
	
	public FoodDto() {
		// TODO Auto-generated constructor stub
	}

	public FoodDto(String foodName, String foodPhoto, int foodPrice, String foodday, int su) {
		super();
		this.foodName = foodName;
		this.foodPhoto = foodPhoto;
		this.foodPrice = foodPrice;
		this.foodday = foodday;
		this.su = su;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	
	public String getFoodPhoto() {
		return foodPhoto;
	}
	
	public void setFoodPhoto(String foodPhoto) {
		this.foodPhoto = foodPhoto;
	}

	public int getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getFoodday() {
		return foodday;
	}

	public void setFoodday(String foodday) {
		this.foodday = foodday;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}
	
	
}
