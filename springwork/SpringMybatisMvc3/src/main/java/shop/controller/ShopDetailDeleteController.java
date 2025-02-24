package shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.ShopDto;
import data.service.ShopService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ShopDetailDeleteController {
	@Autowired
	ShopService shopService;

	@GetMapping("/shop/detail")
	public String detail(@RequestParam int num,Model model)
	{
		ShopDto dto=shopService.getSelectOne(num);
		String mainPhoto=dto.getSphoto().split(",")[0];
		dto.setMainPhoto(mainPhoto);

		model.addAttribute("dto", dto);
		return "shop/detail";
	}

	@GetMapping("/shop/delete")
	public String delete(
			HttpServletRequest request,
			@RequestParam int num
			)
	{
		//배포된 프로젝트의 save 의 위치 구하기
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		//삭제전에 사진명들을 얻어야한다
		String photos=shopService.getSelectOne(num).getSphoto();
		//, 로 분리
		String []photo=photos.split(",");

		//실제 경로에서 파일을 찾아서 삭제
		for(String f:photo)
		{
			File file=new File(uploadFolder+"/"+f);
			//save 폴더에 파일이 존재할경우 삭제
			if(file.exists())
				file.delete();
		}

		//db 의 데이타도 삭제
		shopService.deleteShop(num);

		return "redirect:./list";
	}

	@GetMapping("/shop/photos")
	public String shopPhotos(@RequestParam int num,Model model)
	{
		//num 에 해당하는 사진 얻기
		String sphoto=shopService.getSelectOne(num).getSphoto();
		model.addAttribute("sphoto", sphoto);
		model.addAttribute("num", num);
		return "shop/photos";
	}

	@GetMapping("/shop/delphoto")
	@ResponseBody
	public void deletePhoto(@RequestParam int num,@RequestParam String pname,
			HttpServletRequest request)
	{
		//업로드 경로 구하기
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		//스토리지의 사진도 삭제
		File file=new File(uploadFolder+"/"+pname);
		if(file.exists())
			file.delete();

		//num 에 해당하는 sphoto 를 db 에서 얻는다
		String sphoto=shopService.getSelectOne(num).getSphoto();
		//sphoto 에서 pname 부분을 삭제하는데 중간일경우 뒤에 컴마도 삭제
		String changephoto="";
		if(sphoto.endsWith(pname))
			changephoto=sphoto.replace(pname, "");
		else
			changephoto=sphoto.replace(pname+",", "");
		System.out.println(changephoto);
		//그 변경된 changephoto 를 updatePhoto 를 통해서 보낸다
		shopService.updatePhoto(num, changephoto);
	}

	@PostMapping("/shop/addphoto")
	@ResponseBody
	public void addPhoto(@RequestParam int num,
			@RequestParam("upload") List<MultipartFile> uploadList,
			HttpServletRequest request)
	{
		//업로드 경로 구하기
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		//새로 업로드할 파일명 구할 변수
		String photos="";
		for(MultipartFile f:uploadList)
		{
			//업로드할 파일명
			String uploadFilename=UUID.randomUUID()+"."+f.getOriginalFilename().split("\\.")[1];
			photos+=uploadFilename+",";
			//업로드
			try {
				f.transferTo(new File(uploadFolder+"/"+uploadFilename));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//마지막 컴마 제거
		photos=photos.substring(0,photos.length()-1);
		//db 에서의 sphoto 얻기
		String sphoto=shopService.getSelectOne(num).getSphoto();
		//sphoto 가 값이 없을경우 photos 를 대입하고 , 이미 있을경우 ,를 추가후 photos 추가
		if(sphoto.length()==0)
			sphoto=photos;
		else
			sphoto=sphoto+","+photos;
		//db 에서 sphoto 수정
		shopService.updatePhoto(num, sphoto);
	}
}