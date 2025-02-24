package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.MemberDto;
import data.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/member")
public class MemberDelUpdateController {
	
	MemberService memberService;
	
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
		//모델에 dto저장
		model.addAttribute("dto", dto);
		
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
		//save 경로
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		
		//기존 파일명 얻기
		String oldFilename = memberService.getSelectByNum(num).getMphoto();
		
		//기존 파일 삭제
		File oldFile = new File(uploadFolder+"/"+oldFilename);
		if(oldFile.exists())
			oldFile.delete();
		
		//upload 할 파일명
		String uploadFilename=UUID.randomUUID()+"."+upload.getOriginalFilename().split("\\.")[1];
		
		//업로드
		try {
			upload.transferTo(new File(uploadFolder+"/"+uploadFilename));
			//session도 변경
			session.setAttribute("loginphoto", uploadFilename);
			
			//db도 사진변경
			memberService.changePhoto(uploadFilename, num);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@PostMapping("/updatemember")
	@ResponseBody
	public void updatemember(HttpServletRequest request, @RequestParam("num") int num, HttpSession session) {
		
		
	}
	
}
