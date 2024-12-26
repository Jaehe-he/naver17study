package day1224;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Ex8Map {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Map 타입은 key와 value 의 쌍으로 데이타를 추가한다
		//이때 key 값은 Set 타입이다. 즉,중복허용하지 않고 비순차적
		Map<String, String> map=new HashMap<String, String>();
		//map 에 데이타 추가
		map.put("name", "송혜교");
		map.put("age", "34");
		map.put("blood","AB");
		map.put("name", "이영자");
		
		System.out.println("map 의 사이즈:"+map.size());
		System.out.println("map 에서 key 값으로 value 값 꺼내기");
		System.out.println("이름:"+map.get("name"));
		System.out.println("나이:"+map.get("age"));
		System.out.println("혈액형:"+map.get("blood"));
		System.out.println("핸드폰:"+map.get("hp"));//없을경우 null 값 반환
		System.out.println();
		System.out.println("key 값들을 자동으로 얻은후 value 값들 얻기");
		Set<String> keySets=map.keySet();
		for(String key:keySets)
		{
			String v=map.get(key);
			System.out.println(key+"=>"+v);
		}
		
	}

}










