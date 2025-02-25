package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MemberDto;

@Mapper
public interface MemberMapper {
	public int checkMyid(String myid);
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public void deleteMember(int num);
	public int loginCheck(String loginid,String loginpass);
	public MemberDto getSelectByNum(int num);
	public MemberDto getSelectByMyid(String myid);
	public void changePhoto(String mphoto,int num);
	public void updateMember(MemberDto dto);
}