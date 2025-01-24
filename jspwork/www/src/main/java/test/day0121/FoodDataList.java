package test.day0121;

import java.util.ArrayList;
import java.util.List;

import test.data.FoodDto;

public class FoodDataList {

	private List<FoodDto> list=new ArrayList<FoodDto>();
	
	public FoodDataList() {
		// TODO Auto-generated constructor stub
		list.add(new FoodDto("달걀말이","계란말이.jpg", 23000, "2025-01-01", 2));
		list.add(new FoodDto("망고빙수","11.jpg", 11000, "2025-01-10", 1));
		list.add(new FoodDto("야채샌드위치","8.jpg",15000, "2025-01-13", 3));
		list.add(new FoodDto("콘치즈","5.jpg", 23000, "2025-01-01", 2));
		list.add(new FoodDto("치즈샌드위치","치즈샌드위치.jpg", 23000, "2025-01-01", 2));
		list.add(new FoodDto("짜장라면","짜장라면.jpg", 23000, "2025-01-01", 2));		
	}
	
	public List<FoodDto> getAllDatas()
	{
		return list;
	}
		
}
