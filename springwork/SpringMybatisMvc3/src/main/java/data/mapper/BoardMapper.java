package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BoardDto;

@Mapper
public interface BoardMapper {
   public int getTotalCount();
   public int getMaxIdx();
   public void updateRestep(int regroup, int restep);
   public void insertBoard(BoardDto dto);
   public List<BoardDto> getPagingList(int start, int perpage);
   public void updateReadCount(int idx);
   public BoardDto getSelectByIdx(int idx);
   public List<BoardDto> getSelectById(String myid);
}
