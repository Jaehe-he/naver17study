package naver.storage;

import org.springframework.web.multipart.MultipartFile;

//추가 및 삭제
public interface ObjectStorageService {
	public String uploadFile(String bucketName, String directoryPath, MultipartFile file);
	public void deleteFile(String bucketName, String directoryPath, String fileName);
}
