package json.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


//@RestController :포워드 없이 브라우저로 직접 데이타를 출력(주로 json 방식)
//프론트의 GET,PUT,DELETE,POST 요청에 따라 메서드가 호출이 되는 방식

@RestController
public class JsonRestController {

	//@RequestMapping(value = "/bit",method = RequestMethod.GET)
	//@RequestMapping("/bit")  //스프링의 모든 버전에서 가능
	@GetMapping("/bit")  //스프링5버전부터 가능
	public String test1()
	{
		return "bitcamp";
	}
}
