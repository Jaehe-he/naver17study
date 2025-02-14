package lombok.test;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Setter //자동으로 Setter 메서드 인식
//@Getter //자동으로 Getter 메서드 인식
//@ToString //자동으로 ToString 인식. tostring : 자동으로 멤버변수 값 인식해주는 것
@Data //위 3개(Setter, Getter, ToString) 합친 기능

@NoArgsConstructor //default 생성자. **AllArgsConstructor 쓸때 무조건 같이 적어줘야 함
@AllArgsConstructor //모든 변수를 인자로 갖는 생성자
public class TestDto {
	private String name;
	private String addr;
	private String hp;
}
