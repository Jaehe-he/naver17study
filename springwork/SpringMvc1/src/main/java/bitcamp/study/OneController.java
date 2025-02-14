package bitcamp.study;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Controller
//이번에는 @NoArgsConstructor 안쓴 이유 : 값이 들어가지 않기 때문에 적어주면 안됨
@AllArgsConstructor //모든 멤버변수(인자) 자동주입
public class OneController {
	
	//같은 타입의 빈을 찾아서 자동으로 주입한다(DI)
	//방법1. Autowired
	//@Autowired
	Mycar mycar; //자바에서는 Mycar mycar = new Mycar();로 했는데 스프링은 왜 이케하지?
	
	@GetMapping("/")
	public ModelAndView show() {
		ModelAndView mview = new ModelAndView();
		//Model에 데이터를 저장 (서블릿에서 request에 저장하는 것과 같음)
		mview.addObject("today", new Date());
		mview.addObject("message", "오늘은 즐거운 금요일!!!");
		
		//forward
		mview.setViewName("result1"); //properties에서 설정한 viewresolver에 의해서 forward
		
		return mview;
	}
	
	//매핑주소가 두가지 이상일 경우 {}안에 넣어준다.
	@GetMapping({"/board/list", "/board/list.do"}) //매핑주소 동일하나 처리 결과?가 다를 때
	public String list1(Model model) {
		model.addAttribute("writer", "한가람");
		return "boardlist";
	}
	
	@GetMapping("/shop/list")
	public String list2(Model model) {
		model.addAttribute("sangpum", "사과");
		model.addAttribute("price", "3000");
		
		return "shoplist";
		
	}
	
	@GetMapping({"bitcamp/study", "bitcamp/study2"})
	public String list3(Model model) {
		model.addAttribute("mycar", mycar.getMycarName());
		model.addAttribute("mycarColor", mycar.getMycarColor());
		return "study";
		
	}
}
