package controller.test;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import data.dto.FilenameChange;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PhotoUploadController {
	
	@GetMapping("/uploadform")
	public String upload() {
		
		return "upload/uploadform";
	}
	
	@PostMapping("/uploadprocess") //Post로 받기 했기 때문에 PostMapping
	public String uploadPhoto(
			HttpServletRequest request, //업로드한 사진이 SpringMvc2 프로젝트 내에 포함되어야하므로 request가 필요함
			Model model,
			@RequestParam String title,
			@RequestParam("upload") MultipartFile upload //사진은 String이 아니라 MultipartFile로 받아야함
			) {
		//업로드할 프로젝트 내의 위치 지정 (webapp/save)
		String uploadFolder = request.getSession().getServletContext().getRealPath("/save"); //업로드할 특정 폴더의 위치를 얻어옴
		System.out.println(uploadFolder);
		
		//업로드할 파일명
		//원래 파일명으로 저장할 경우 같은이름 업로드 시 덮어씌워지는 문제 발생
		//String uploadFile=upload.getOriginalFilename();
		
		//기존 코드는 FilenameChange.java에 옮겨놓음 (계속 반복해서 작성해야하기 때문에 효율성을 위해 따로 만듦)
		String uploadFileName=FilenameChange.getDateChangeFileName(upload.getOriginalFilename());
		
		
		
		//업로드
		try {
			upload.transferTo(new File(uploadFolder+"/"+uploadFileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //업로드 실패할 수 있기 떄문에 exception이 들어감
		model.addAttribute("title", title);
		model.addAttribute("photo", uploadFileName);
		
		return "upload/uploadresult"; //upload 폴더의 uploadresult 파일
	}
	
	//파일 여러개 업로드
	@GetMapping("/multiform")
	public String multi() {
		
		return "upload/uploadformmulti";
	}
	
	@PostMapping("/multiprocess")
	public String multiUpload(
		HttpServletRequest request,
		@RequestParam String title,
		@RequestParam("upload") List<MultipartFile> uploadList,
		Model model
		) {
		
		//제목부터 모델에 저장
		model.addAttribute("title", title);
		
		//업로드할 프로젝트 내의 위치를 지정 (webapp/save)
		String uploadFolder=request.getSession().getServletContext().getRealPath("/save");
		
		//업로드된 파일명을 저장할 리스트 변수
		List<String> list = new Vector<>();
		
		//여러개의 파일들을 업로드(파일명은 뒤에 날짜붙여서 업로드하기)
		for(MultipartFile multiFile: uploadList) {
			//업로드할 파일명 구하기
//			String uploadFileName=FilenameChange.getDateChangeFileName(multiFile.getOriginalFilename());
			String uploadFileName=FilenameChange.getRandomChangeFileName(multiFile.getOriginalFilename());
			
			//사진들 업로드
			try {
				multiFile.transferTo(new File(uploadFolder+"/"+uploadFileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//업로드된 파일명 list에 추가
			list.add(uploadFileName);
		}
		
		//list를 모델에 저장
		model.addAttribute("list", list);
		
		return "upload/uploadresultmulti";
	}
	
	//ajax
	@GetMapping("/ajaxupload")
	public String ajaxForm() {
		
		return "upload/ajaxphotoupload";
	}
	
	//사진을 업로드 후 json 형태로 파일명 벼노한
	//ajax 함수를 통해서 호출되는 메서드
	@PostMapping("/oneupload")
	@ResponseBody
	public Map<String, String> photoUpload(HttpServletRequest request,
			@RequestParam("upload") MultipartFile upload){
		
		//업로드할 경우
		String uploadPath = request.getSession().getServletContext().getRealPath("/save");
		
		//업로드할 파일명
		String uploadFileName = FilenameChange.getDateChangeFileName(upload.getOriginalFilename());
		
		//업로드
		try {
			upload.transferTo(new File(uploadPath+"/"+uploadFileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("photo", uploadFileName);
		return map;
	}
	

}
