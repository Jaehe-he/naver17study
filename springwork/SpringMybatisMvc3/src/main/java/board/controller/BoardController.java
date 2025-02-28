package board.controller;

import java.security.Timestamp;
import java.util.List;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.BoardDto;
import data.dto.BoardFileDto;
import data.service.BoardFileService;
import data.service.BoardService;
import data.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import naver.storage.NcpObjectStorageService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	final BoardService boardService;
	final BoardFileService fileService;
	final MemberService memberService;
	final NcpObjectStorageService storageService;
	
	//버켓 이름
	private String bucketName="bitcamp-bucket-122";
	
	@GetMapping("/writeform")
	public String writeForm(
			//아래 4개의 값은 답글일때만 넘어온다. 새글일때는 null값이 넘어오므로
			//required를 false로 주거나 defaultValue를 지정해야한다
			@RequestParam(value="idx", defaultValue="0") int idx, //새글인지 답글인지 판단용
			@RequestParam(value="regroup", defaultValue="0") int regroup,
			@RequestParam(value="restep", defaultValue="0") int restep,
			@RequestParam(value="relevel", defaultValue="0") int relevel,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			Model model
			) {
		model.addAttribute("idx", idx);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("pageNum", pageNum);
		
		
		return "board/writeform";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BoardDto dto,
			@RequestParam int pageNum,
			@RequestParam("upload") List<MultipartFile> upload,
			HttpSession session
			) {
		
		//세션으로부터 아이디를 얻는다
		//session.getAttribute("loginid")의 반환타입이 Object임 -> 형변환 or tostring()인데 tostring()은 null일때 오류나서 형변환으로 
		String myid =(String)session.getAttribute("loginid");
		
		//아이디를 이용해서 멤버 테이블에서 작성자를 얻어서 아이디와 작성자는 dto에 넣어야함
		String writer = memberService.getSelectByMyid(myid).getMname();
		
		//dto에 넣기
		dto.setMyid(myid);
		dto.setWriter(writer);
		
		//게시판 내용을 일단 db에 저장(그래야만 idx를 얻어올 수 있다)
		boardService.insertBoard(dto); //selectKey를 dto에 넣어줌
		
		//파일이 있는 경우에만 해당, 네이버 스토리지에 저장 후 파일저장(이때 필요한 게 idx, filename)***
		// => 반복문 안에서 이루어져야 함
		if(!upload.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile f:upload) {
				String filename=storageService.uploadFile(bucketName, "board", f);
				BoardFileDto bdto = new BoardFileDto();
				bdto.setIdx(dto.getIdx());
				bdto.setFilename(filename);
				
				//boardfile에 insert
				fileService.insertBoardFile(bdto);
			}
		}
		return "redirect:./list?pageNum="+pageNum;
		
		/*
		BoardFileDto filedto = new BoardFileDto();
		for(MultipartFile file:upload) {
			if(!file.isEmpty()) { //file이 아무것도 없는게 true일 경우
				String filename = storageService.uploadFile(bucketName, "board", file);
				filedto.setIdx(dto.getIdx());
				filedto.setFilename(filename);
				
				fileService.insertBoardFile(filedto);
			}
		}
		
		return "redirect:./list?pageNum="+pageNum;
		*/
	}
	
	
	@GetMapping("/detail")
	//boardlist에서 idx와 pageNum만 받고 있으므로 ()안에 넣어주면 됨
	//Model : 저장하기 위함
	public String detail(@RequestParam int idx, @RequestParam(defaultValue="1") int pageNum, Model model,
			HttpSession session) {
		
		//조회수 1 증가
		boardService.updateReadcount(idx);
		
		//idx에 해당하는 dto 얻기
		BoardDto dto = boardService.getSelectByIdx(idx);
		
		//idx 글에 등록된 파일들 가져오기
		List<String> fileList = new Vector<>();
		List<BoardFileDto> flist = fileService.getFiles(idx);
		
		for(BoardFileDto fdto:flist) {
			fileList.add(fdto.getFilename());
		}
		
		dto.setPhotos(fileList);
		
		//해당 아이디에 대한 사진을 멤버 테이블에서 얻기
		String memberPhoto = memberService.getSelectByMyid(dto.getMyid()).getMphoto();
		
		//로그인한 아이디에 해당하는 이름
		String loginid=(String)session.getAttribute("loginid");
		String writer = memberService.getSelectByMyid(loginid).getMname();
		
		//모델에 저장
		model.addAttribute("dto", dto);
		model.addAttribute("writer", writer);
		model.addAttribute("memberPhoto", memberPhoto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/"+bucketName);
		
		return "board/boarddetail";
	}
	
	@GetMapping("/updateform")
	public String updateForm(
			@RequestParam int idx, @RequestParam int pageNum, Model model) {
		BoardDto dto = boardService.getSelectByIdx(idx);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/"+bucketName);
		
		return "board/updateform";
	}
	
	//수정폼에서 기존 사진 목록 나타냄
	@GetMapping("/photolist")
	@ResponseBody
	public List<BoardFileDto> photoList(@RequestParam int idx){
		List<BoardFileDto> list = fileService.getFiles(idx);	
		return list;
	}
	
	//수정폼에서 각각의 사진 삭제 시
	@GetMapping("/photodel")
	@ResponseBody
	public void deletePhoto(@RequestParam int num) {
		//스토리지에 있는 파일명 얻기
		String filename = fileService.getFilename(num);
		
		//스토리지에서 사진 삭제
		storageService.deleteFile(bucketName, "board", filename);		
		
		//사진 삭제
		fileService.deleteFile(num);
	}
	
	//사진추가 및 글 수정
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDto dto, @RequestParam int pageNum,
			@RequestParam("upload") List<MultipartFile> upload
			) {
		//제목 및 내용 수정
		boardService.updateBoard(dto);
		
		//사진은 추가
		//파일이 있는 경우에만 해당, 네이버 스토리지에 저장 후 파일저장(이때 필요한 게 idx, filename)***
		// => 반복문 안에서 이루어져야 함
		if(!upload.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile f:upload) {
				String filename=storageService.uploadFile(bucketName, "board", f);
				BoardFileDto bdto = new BoardFileDto();
				bdto.setIdx(dto.getIdx());
				bdto.setFilename(filename);
						
				//boardfile에 insert
				fileService.insertBoardFile(bdto); //사진은 수정이 아니라 추가이므로 insertBoardFile(dto);
			}
		}
		
		return "redirect:./detail?idx="+dto.getIdx()+"&pageNum="+pageNum;
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public void boardDelete(@RequestParam int idx) {
		//idx에 해당하는 파일들 삭제
		List<BoardFileDto> filelist = fileService.getFiles(idx);
		for(BoardFileDto fdto:filelist) {
			String filename = fdto.getFilename();
			storageService.deleteFile(bucketName, "board", filename);
		}
		
		boardService.deleteBoard(idx); //원글을 지우면 그 글에 업로드된 파일들 db정보는 자동으로 지워짐 on delete cascade를 설정했기 때문
	}
	

}
