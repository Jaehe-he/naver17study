package data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.BoardDto;
import data.mapper.BoardMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardService {   
   BoardMapper boardMapper;
   
   public int getTotalCount()
   {
      return boardMapper.getTotalCount();
   }
   
   public int getMaxIdx() {
	   return boardMapper.getMaxIdx();
   }
   
   public void updateRestep(int regroup, int restep) {
	   boardMapper.updateRestep(regroup, restep);
   }
   
   public void insertBoard(BoardDto dto) {
	   int idx=dto.getIdx();
	   int regroup=dto.getRegroup();
	   int restep = dto.getRestep();
	   int relevel = dto.getRelevel();
	   
	   if(idx==0) { //새글인 경우
		   regroup = this.getMaxIdx()+1;
		   relevel=0;
		   restep=0;
	   }else { //답글인 경우
		   //전달받은 restep보다 큰 값은 모두 +1
		   this.updateRestep(regroup, restep);
		   
		   //그리고 전달받은 값보다 +1
		   restep++;
		   relevel++;
	   }
	   
	   dto.setRegroup(regroup);
	   dto.setRestep(restep);
	   dto.setRelevel(relevel);
	   
	   //db insert
	   boardMapper.insertBoard(dto);
   }
   
   public List<BoardDto> getPagingList(int start, int perpage){
	   return boardMapper.getPagingList(start, perpage);
   }
   
   public void updateReadcount(int idx) {
	   boardMapper.updateReadCount(idx);
   }
   
   public BoardDto getSelectByIdx(int idx) {
	   return boardMapper.getSelectByIdx(idx);
   }

   public List<BoardDto> getSelectById(String myid){
	   return boardMapper.getSelectById(myid);
   }
}