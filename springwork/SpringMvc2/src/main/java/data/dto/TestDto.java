package data.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  //@Setter, @Getter, @ToString 3가지 기능을 합친 기능
@NoArgsConstructor  //인자 없는 디폴트 생성자
@AllArgsConstructor  //모든 멤버를 인자로 받는 생성자
public class TestDto {
	private String name;
	private String addr;
	private String gender;
}
