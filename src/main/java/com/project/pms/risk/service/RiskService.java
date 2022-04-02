package com.project.pms.risk.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.project.vo.Project;
import com.project.pms.risk.repository.RiskDAO;

import com.project.pms.risk.vo.RiskBoard;
import com.project.pms.risk.vo.RiskDetail;
import com.project.pms.risk.vo.RiskFileInfo;
import com.project.pms.risk.vo.RiskSaveRequest;



@Service
public class RiskService {

	@Autowired
	private RiskDAO dao;
	
	// 전체 목록 가져오기
	public List<RiskBoard> getRiskList() {	
		return dao.getRiskList(); 
	}
	
	// 상세 페이지
	public RiskDetail getRiskDetail(int riskId) {
		return dao.getRiskDetail(riskId);
	}
	// 파일 정보 불러오기
	public RiskFileInfo getFileInfo(int riskId) {
		return dao.getFileInfo(riskId);
	}
	
	// 리스크 등록
	public void saveRisk(RiskSaveRequest riskSaveRequest) throws Exception {
		dao.saveRisk(riskSaveRequest);
		dao.setComAt(riskSaveRequest);
	}
	// 파일 저장
	public void saveFile(RiskFileInfo fileInfo, MultipartFile file) throws Exception {		
		
		
		String riskId = fileInfo.getRiskId();
		String rFileId = fileInfo.getrFileId();

				
		// riskId 가 있으면 수정이므로 있던 파일 삭제하고 새로 등록
		if(rFileId!=null) {
			if(rFileId.isBlank()==false && riskId != null) {
				deleteFile(Integer.parseInt(riskId));
			}
		}
	String originalName = file.getOriginalFilename();
	String extension = FilenameUtils.getExtension(originalName).toLowerCase();
	File saveFile;
	String saveName;
	long volume;
	String path = upload;
	
	do {
		saveName = UUID.randomUUID() + "." + extension;
		saveFile = new File(path,saveName);
		volume = file.getSize();
		
	} while (saveFile.exists());
	
	saveFile.getParentFile().mkdirs();
	file.transferTo(saveFile);
	
	if(riskId==null) riskId="0";
	if(rFileId==null) rFileId="0";
	fileInfo.setRiskId(riskId);
	fileInfo.setrFileId(rFileId);		
	fileInfo.setOriginalName(originalName);
	fileInfo.setSaveName(saveName);
	fileInfo.setExtension(extension);
	fileInfo.setVolume(volume);
		
		dao.saveFile(fileInfo);		
	}
	// 수정 정보
	public RiskSaveRequest getModifyInfo(int riskId) {
		return dao.getModifyInfo(riskId);
	} 
	
	//리스크 삭제 (DB에 있는 리스크 , 파일 정보 삭제)
	public void deleteRisk(int riskId) {
		dao.deleteRisk(riskId);
	}
	// 파일 삭제 (지정 경로에 업로드 된 파일 삭제)
	@Value("${upload}")
	private String upload;
	public void deleteFile(int riskId) {
		RiskFileInfo fileInfo = new RiskFileInfo();
		fileInfo = dao.getFileInfo(riskId);
		String saveName = fileInfo.getSaveName();
		String path = upload+"\\"+saveName;

		File file = new File(path);
		if(file.exists()==true) file.delete();
		
	}
	
	/* SELECT BOX 목록 가져오기 */
	
	// 사원 리스트
	public List<Emp> getEmpList() {
		return dao.getEmpList();
	}
	
	// 프로젝트 리스트
	public List<Project> getProjectList() {
		return dao.getProjectList();
	}
	
	// 작업 리스트
	public List<MyTask> getMyTaskList(){
		return dao.getMyTaskList();
	}
	
	
	
	
}
