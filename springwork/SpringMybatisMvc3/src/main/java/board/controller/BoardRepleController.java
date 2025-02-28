package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import data.dto.BoardRepleDto;
import data.service.BoardRepleService;
import data.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import naver.storage.NcpObjectStorageService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardRepleController {
	final MemberService memberService;
	final BoardRepleService repleService;
	final NcpObjectStorageService storageService;
	
	private String bucketName = "bitcamp-bucket-122";
	
	//댓글에서 업로드한 파일명;
	private String uploadFilename;
	
	@PostMapping("/repleupload")
	public String upload(@RequestParam("upload") MultipartFile upload) {
		
		//사진을 다시 올릴경우 이전 사진은 삭제
		if(uploadFilename!=null)
			storageService.deleteFile(bucketName, "board", uploadFilename);
			
		uploadFilename=storageService.uploadFile(bucketName, "board", upload);
		return uploadFilename;
	}
	
	@GetMapping("/replephotodel")
	public void photoDel(@RequestParam String fname) {
		storageService.deleteFile(uploadFilename, "board", fname);
		uploadFilename=null;
	}
	
	@PostMapping("/addreple")
	public void addReple(@RequestParam int idx, @RequestParam String message,
			HttpSession session) {
		//로그인한 아이디
		String loginid=(String)session.getAttribute("loginid");
		
		//클래스명.builder()로 시작하여 값 세팅 후 build() 호출하여 객체 생성
		BoardRepleDto dto=BoardRepleDto.builder()
				.idx(idx)
				.message(message)
				.myid(loginid)
				.photo(uploadFilename)
				.build();
		
		repleService.insertReple(dto);
		uploadFilename=null;
	}
	
	@GetMapping("/replelist")
	   public List<BoardRepleDto> getRepleList(@RequestParam int idx)
	   {
	      System.out.println("idx="+idx);
	      List<BoardRepleDto> rlist=repleService.getSelectReples(idx);
	      for(int i=0;i<rlist.size();i++)
	      {
	         String writer=memberService.getSelectByMyid(rlist.get(i).getMyid()).getMname();
	         String profilePhoto=memberService.getSelectByMyid(rlist.get(i).getMyid()).getMphoto();
	         rlist.get(i).setWriter(writer);//댓글 작성자 저장
	         rlist.get(i).setProfile(profilePhoto);//댓글 작성자 프로필사진 저장         
	      }
	      return rlist;
	   }
	
	
}
