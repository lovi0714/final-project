package com.project.pms.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.project.pms.output.vo.OutputFile;

@Component
public class FileStore {
	
	@Value("${upload}")
	private String fileDir;
	
	public String getFullPath(String fileName) {
		
		return fileDir + fileName;
	}
	
	public OutputFile storeFile(MultipartFile multipartFile) throws IllegalStateException, IOException {
		
		if (multipartFile.isEmpty()) {
			
			return null;
		}
		
		String originalFileName = multipartFile.getOriginalFilename();
		String storeFileName = createStoreFileName(originalFileName);
		
		System.out.println("파일저장 : " + getFullPath(storeFileName));
		// 파일 저장
		multipartFile.transferTo(new File(getFullPath(storeFileName)));
		
		// 저장한 정보를 담아서 객체를 넘겨준다.
		OutputFile outputFile = new OutputFile();
		outputFile.setOriginalName(originalFileName);
		outputFile.setSaveName(storeFileName);
		outputFile.setExt(extractExt(originalFileName));
		outputFile.setVolume(getFileSzie(multipartFile));
		outputFile.setVolumeText(CommonUtils.humanReadableByteCountSI(outputFile.getVolume()));
		
		return outputFile;
	}
	
	private String createStoreFileName(String originalFileName) {
		String ext = extractExt(originalFileName);
		String uuid = UUID.randomUUID().toString();
		
		return uuid + "." + ext;
	}
	
	private String extractExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		
		return originalFileName.substring(pos + 1);
	}
	
	private long getFileSzie(MultipartFile multipartFile) {
		
		return multipartFile.getSize();
	}
	
}
