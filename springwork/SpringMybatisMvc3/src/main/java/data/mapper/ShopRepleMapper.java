package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ShopRepleDto;

@Mapper
public interface ShopRepleMapper {
	public void insertShopReple(ShopRepleDto dto);
	public void deleteShopReple(int idx);
	public List<ShopRepleDto> getRepleByNum(int num);
	public String getPhoto(int idx);
	public void updateLikes(int idx);
	public int getLikes(int idx);
}