package bitcamp.study;

import java.util.List;
import java.util.Vector;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.test.TestDto;

@RestController //json 데이터 처리밖에 못함
public class BitController {
	
	//@RestController는 json 출력 시 @ResponseBody 안붙인다
	@GetMapping("/hello")
	public List<TestDto> list(){
		List<TestDto> list = new Vector<>();
		list.add(new TestDto("강호동", "서울", "010-2222-4444"));
		list.add(new TestDto("이미자", "부산", "010-1234-5555"));
		list.add(new TestDto("손철수", "광주", "010-4321-5678"));
		
		return list;
	}
}
