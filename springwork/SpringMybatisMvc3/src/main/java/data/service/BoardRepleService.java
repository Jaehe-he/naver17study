package data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.BoardRepleDto;
import data.mapper.BoardRepleMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardRepleService {
	BoardRepleMapper repleMapper;
	
	public void insertReple(BoardRepleDto dto)
	{
		repleMapper.insertReple(dto);
	}
	public List<BoardRepleDto> getSelectReples(int idx)
	{
		return repleMapper.getSelectReples(idx);
	}
	
	public BoardRepleDto getSelectData(int num)
	{
		return repleMapper.getSelectData(num);
	}
	public void deleteReple(int num)
	{
		repleMapper.deleteReple(num);
	}
}