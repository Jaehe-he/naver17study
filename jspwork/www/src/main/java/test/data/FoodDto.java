package test.data;

public class FoodDto {
	private String foodName;
	private String foodPhoto;
	private int foodPrice;
	private String foodDay;
	private int su;
	
	public FoodDto() {
		// TODO Auto-generated constructor stub
	}

	public FoodDto(String foodName,String foodPhoto, int foodPrice, String foodDay, int su) {
		super();
		this.foodName = foodName;
		this.foodPhoto=foodPhoto;
		this.foodPrice = foodPrice;
		this.foodDay = foodDay;
		this.su = su;
	}

	
	public String getFoodPhoto() {
		return foodPhoto;
	}

	public void setFoodPhoto(String foodPhoto) {
		this.foodPhoto = foodPhoto;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getFoodDay() {
		return foodDay;
	}

	public void setFoodDay(String foodDay) {
		this.foodDay = foodDay;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}
}
