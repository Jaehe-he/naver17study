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
	
	public void insertReple(BoardRepleDto dto) {
		repleMapper.insertReple(dto);
	}
	
	public List<BoardRepleDto> getSelectReples(int idx)
	   {
	      return repleMapper.getSelectReples(idx);
	   }
	
	public void deleteBoardReple(int num) {
		repleMapper.deleteBoardReple(num);
	}
	
	public String getPhoto(int num) {
		return repleMapper.getPhoto(num);
	}
	
}
