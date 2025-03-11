package test.controller;

import java.util.Date;
import java.util.List;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import test.data.FoodDto;

@Controller
public class TestController {
	@GetMapping("/")
	public String home() {
		return "food/home";
	}
	
	
	@GetMapping("/hello")
	public String hello(Model model) {
		
		model.addAttribute("message", "Have a Nice Day!!!");
		model.addAttribute("socute", "짱구1.jpg");
		
		return "food/hello"; //Thymeleaf를 사용하면 기본 위치가 templates이므로 그 위치에 맞춰 food 밑에 hello 적으면 됨
	}
	
	@GetMapping("/hello2")
	public String hello2(Model model, @RequestParam(value="name") String name, @RequestParam(value="age") int age) {
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "food/hello2";
	}
	
	@GetMapping("/hello3")
	public String hello3(Model model) {
		FoodDto dto = FoodDto.builder()
				.foodName("짱구")
				.foodPhoto("짱구3.jpg")
				.foodPrice(15000)
				.build();
		model.addAttribute("dto", dto);
		model.addAttribute("bgcolor", "#00ff7f");
		model.addAttribute("today", new Date());
		
		return "food/hello3";
	}
	
	@GetMapping("/hello4")
	public String hello4(Model model) {
		List<FoodDto> list = new Vector<>();
		
		list.add(new FoodDto("짱구1", 12000, "짱구1.jpg"));
		list.add(new FoodDto("짱구2", 16000, "짱구2.png"));
		list.add(new FoodDto("짱구3", 9000, "짱구3.jpg"));
		list.add(new FoodDto("짱구4", 18000, "짱구4.png"));
		list.add(new FoodDto("짱구5", 20000, "짱구5.jpg"));
		
		model.addAttribute("list", list);
		
		return "food/hello4";
	}
	
	@GetMapping("/hello5")
	public String hello5(Model model, @RequestParam(value="myid") String myid,
			HttpSession session) {
		//loginid는 session이름 ...myid는 admin으로 되어있음
		session.setAttribute("loginid", myid);
		
		return "food/hello5";
	}
	
}
