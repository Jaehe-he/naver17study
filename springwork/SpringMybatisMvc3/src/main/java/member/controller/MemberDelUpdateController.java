package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.service.BoardFileService;
import data.service.BoardService;
import data.service.MemberService;
import io.micrometer.common.lang.NonNull;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import naver.storage.NcpObjectStorageService;

@Controller
//@AllArgsConstructor //모든 멤버변수 자동 주입(MemberService, buckName, NcpObjectStorageService) -> 일부만 붙이고 싶을 경우 해당 이름에 @Autowired 또는 안붙이고 싶은 곳에 final과 @RequiredArgsConstructor 써주면 됨
@RequiredArgsConstructor //final을 붙인 멤버 변수만 자동 주입
@RequestMapping("/member")
public class MemberDelUpdateController {
	
	//@Autowired
	final MemberService memberService;
	
	//버켓 이름
	private String bucketName = "bitcamp-bucket-122"; //각자 자기꺼 써야함
	
	//@Autowired
	final NcpObjectStorageService storageService;
	final BoardService boardService;
	final BoardFileService fileService;
	
	@GetMapping("/delete")
	public String deleteMember(@RequestParam int num) {
		memberService.deleteMember(num);
		return "redirect:./list";
	}
	
	//마이페이지를 통한 본인 탈퇴
	@GetMapping("/mypagedel")
	@ResponseBody
	public void mypageDelete(@RequestParam int num, HttpSession session) {
		memberService.deleteMember(num);
		
		//모든 세션 제거
		session.removeAttribute("loginstatus");
		session.removeAttribute("loginid");
		session.removeAttribute("loginphoto");
	}
	
	
	@GetMapping("/checkdel")
	@ResponseBody
	public void checkDeleteMember(@RequestParam String nums) {
		//삭제할 num들
		String []num=nums.split(",");
		for(String str:num) { //num은 String -> 거기있는 숫자를 str 변수가 받고 그걸 n이 받아 삭제
			int n=Integer.parseInt(str);
			memberService.deleteMember(n);
		}
	}
	
	@GetMapping("/mypage")
	public String goMypage(HttpSession session, Model model) { //데이터를 출력해야하기 때문에 Model도 호출
		//세션으로부터 아이디를 얻는다
		String myid = (String)session.getAttribute("loginid");
		//아이디에 해당하는 dto 얻기
		MemberDto dto = memberService.getSelectByMyid(myid);
		
		//내가 쓴 게시글 가져오기
		List<BoardDto> list = boardService.getSelectById(myid);
		
		//각 list 안에 dto에 파일의 갯수 저장
		for(int i=0;i<list.size();i++) {
			int count=fileService.getFiles(list.get(i).getIdx()).size();
			list.get(i).setPhotoCount(count);
		}
		
		//모델에 dto저장
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/bitcamp-bucket-122");
		
		return "member/mypage";
	}

	@PostMapping("/changephoto")
	@ResponseBody
	public void changePhoto(
			HttpServletRequest request,
			@RequestParam("upload") MultipartFile upload,
			@RequestParam("num") int num,
			HttpSession session
			) {
//		//save 경로
//		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
//		
//		//기존 파일명 얻기
//		String oldFilename = memberService.getSelectByNum(num).getMphoto();
//		
//		//기존 파일 삭제
//		File oldFile = new File(uploadFolder+"/"+oldFilename);
//		if(oldFile.exists())
//			oldFile.delete();
//		
//		//upload 할 파일명
//		String uploadFilename=UUID.randomUUID()+"."+upload.getOriginalFilename().split("\\.")[1];
//		
//		//업로드
//		try {
//			upload.transferTo(new File(uploadFolder+"/"+uploadFilename));
//			//session도 변경
//			session.setAttribute("loginphoto", uploadFilename);
//			
//			//db도 사진변경
//			memberService.changePhoto(uploadFilename, num);
//		} catch (IllegalStateException | IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		//사진 수정시 db에 저장된 파일명을 받아서 스토리지에서 삭제 후 추가할 것
		String oldFilename = memberService.getSelectByNum(num).getMphoto();
		storageService.deleteFile(bucketName, "member", oldFilename);
		
		//네이버 스토리지에 업로드
		String uploadFilename = storageService.uploadFile(bucketName, "member", upload);
		
		//db에서도 수정
		memberService.changePhoto(uploadFilename, num);
		
		//세션도 변경
		session.setAttribute("loginphoto", uploadFilename);
	}
	
	@PostMapping("/update")
	@ResponseBody
	public void update(@ModelAttribute MemberDto dto) {
		System.out.println(dto.getNum());
		
		memberService.updateMember(dto);
		
		
	}
	
}
