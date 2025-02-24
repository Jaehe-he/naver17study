package shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import data.dto.ShopRepleDto;
import data.service.ShopRepleService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
public class ShopRepleController {
	
	@Autowired
	ShopRepleService repleService;
	
	@PostMapping("/shop/addreple")
	public void insertReple(
			HttpServletRequest request,
			@RequestParam int num,
			@RequestParam String message,
			@RequestParam("upload") MultipartFile upload
			)
	{
		System.out.println(upload.getOriginalFilename()+","+message);
		//save 의 실제 경로 구하기
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		//업로드할 파일명(랜덤문자열.확장자)
		String uploadFilename=UUID.randomUUID()+"."+upload.getOriginalFilename().split("\\.")[1];
		//사진업로드
		try {
			upload.transferTo(new File(uploadFolder+"/"+uploadFilename));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//dto 생성
		ShopRepleDto dto=new ShopRepleDto();
		dto.setNum(num);
		dto.setMessage(message);
		dto.setPhoto(uploadFilename);
		//db insert	
		repleService.insertShopReple(dto);
	}

	@GetMapping("/shop/replelist")
	public List<ShopRepleDto> repleList(
			@RequestParam int num
			)
	{
		List<ShopRepleDto> list=null;
		list=repleService.getRepleByNum(num);		
		return list;
	}
	
	@GetMapping("/shop/repledel")
	public void repleDelete(@RequestParam int idx,HttpServletRequest request)
	{
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		//삭제할 사진명
		String photo=repleService.getPhoto(idx);
		//사진 삭제
		File file=new File(uploadFolder+"/"+photo);
		if(file.exists())
			file.delete();
		repleService.deleteShopReple(idx);
	}
	
	@GetMapping("/shop/likes")
	public Map<String, Integer> getLikes(@RequestParam int idx)
	{
		//likes 1 증가
		repleService.updateLikes(idx);
		//최종 likes 받기
		int likes=repleService.getLikes(idx);
		//Map
		Map<String, Integer> map=new HashMap<>();
		map.put("likes", likes);
		return map;
	}
}