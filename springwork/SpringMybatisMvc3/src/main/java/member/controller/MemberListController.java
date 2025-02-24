package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import data.dto.MemberDto;
import data.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberListController {
	@Autowired
	MemberService memberService;
	
	@GetMapping("/list")
	public String memeberList(Model model) {
		List<MemberDto> list=memberService.getAllMembers();
		model.addAttribute("list", list);
		return "member/memberlist";
	}
}