package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import data.dto.ShopDto;
import data.mapper.ShopMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ShopService {
	ShopMapper shopMapper;
	
	public int getTotalCount()
	{
		return shopMapper.getTotalCount();
	}
	
	public void insertShop(ShopDto dto)
	{
		shopMapper.insertShop(dto);
	}
	
	public List<ShopDto> getAllSangpum()
	{
		return shopMapper.getAllSangpum();
	}
	public ShopDto getSelectOne(int num)
	{
		return shopMapper.getSelectOne(num);
	}
	public void updateShop(ShopDto dto)
	{
		shopMapper.updateShop(dto);
	}
	
	public void deleteShop(int num)
	{
		shopMapper.deleteShop(num);
	}
	
	public void updatePhoto(int num,String photo)
	{
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		map.put("photo", photo);
		shopMapper.updatePhoto(map);		
	}
	
}