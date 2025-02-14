//json 형태로 출력됨
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan({"controller.test", "lombok.test"}) //여러개 추가할 경우 {}안에 넣어서 출력

//패키지가 공통적으로 있을 경우 wild card도 가능 (*.파일명)
@ComponentScan({"*.test", "bitcamp.study"})

//아래처럼 따로 적어줘도 되고 {}로 묶어서 적어줘도 됨
//@ComponentScan("*.test") //앞에 상관 없고 뒤에가 .test인 것을 모두 호출해라
//@ComponentScan("*.study")
public class SpringMvc1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMvc1Application.class, args);
	}

}
