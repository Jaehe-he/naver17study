package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BoardRepleDto;

@Mapper
public interface BoardRepleMapper {
	public void insertReple(BoardRepleDto dto);
	public void deleteBoardReple(int idx);
	public String getPhoto(int idx);
	public List<BoardRepleDto> getSelectReples(int idx);
	

}
