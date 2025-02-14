package bitcamp.study;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component //Bean을 주고싶을 때 사용 -> 첫글자가 소문자로 mycar 이름으로 bean이 등록이 됨
@Data
public class Mycar {
	@Value("아우디 A6")
	private String mycarName;
	@Value("진주색")
	private String mycarColor;
}
