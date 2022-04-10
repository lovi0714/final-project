package com.project.pms.output.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import com.project.pms.output.repository.OutputDAO;
import com.project.pms.output.vo.Output;
import com.project.pms.output.vo.OutputCategory;
import com.project.pms.output.vo.OutputDetail;
import com.project.pms.output.vo.OutputFile;
import com.project.pms.output.vo.OutputFileInfo;
import com.project.pms.output.vo.OutputListForm;
import com.project.pms.output.vo.OutputSearchCriteria;
import com.project.pms.output.vo.OutputType;
import com.project.pms.output.vo.ProjectInfo;
import com.project.pms.utils.FileStore;

@Service
public class OutputService {
	
	@Autowired
	private OutputDAO dao;
	
	@Autowired
	private FileStore fileStore;
	
	public List<OutputListForm> getOutputList(OutputSearchCriteria sc) {
		return dao.getOutputList(sc);
	}
	
	@Transactional
	public void saveOutputWithFile(Output output, OutputFile outputFile) {
		// 산출물을 먼저 등록
		dao.saveOutput(output);

		// 첨부파일 존재하면 파일 등록
		if (!ObjectUtils.isEmpty(outputFile)) {
			outputFile.setOutputId(dao.getMaxOutputId());
			dao.saveOutputFile(outputFile);
		}
	}
	
	public List<OutputCategory> getOutputCategory() {
		return dao.getOutputCategory();
	}
	
	public List<OutputType> getOutputType() {
		return dao.getOutputType();
	}
	
	public List<ProjectInfo> getProjectInfo() {
		return dao.getProjectInfo();
	}
	
	public OutputDetail getOutputDetail(Integer outputId) {
		return dao.getOutputDetail(outputId);
	}

	public OutputFileInfo getOutputFile(Integer outputFileId) {
		return dao.getOutputFile(outputFileId);
	}

	public OutputFileInfo getOutputFileByTaskId(Integer taskId) {
		return dao.getOutputFileByTaskId(taskId);
	}
	
	@Transactional
	public boolean deleteOutputWithFile(Integer outputId) {
		OutputFileInfo fileInfo = dao.getOutputFile(outputId);
		// 파일을 먼저 삭제하고 산출물 삭제
		int result = dao.deleteOutputFile(outputId);
		
		// 파일이 존재하면서 삭제 실패일때 에러발생시켜야함
		if (result == 1) {
			try {
				File file = new File(fileStore.getFullPath(fileInfo.getSaveName())); 
				if(file.exists()) { 
					if(file.delete()) 
						System.out.println("파일삭제 성공"); 
					else { 
						System.out.println("파일삭제 실패");
						throw new Exception();
					} 
				} else
					System.out.println("파일이 존재하지 않습니다.");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// 산출물 정보 삭제
		int result2 = dao.deleteOutput(outputId);
		
		return (result == 1 && result2 == 1) ? true : false;
	}

	@Transactional
	public boolean deleteOutputWithFileByTaskId(Integer taskId) {
		OutputFileInfo fileInfo = dao.getOutputFileByTaskId(taskId);
		// 파일을 먼저 삭제하고 산출물 삭제
		int result = dao.deleteOutputFileByTaskId(taskId);
		
		// 파일이 존재하면서 삭제 실패일때 에러발생시켜야함
		if (result == 1) {
			try {
				File file = new File(fileStore.getFullPath(fileInfo.getSaveName())); 
				if(file.exists()) { 
					if(file.delete()) 
						System.out.println("파일삭제 성공"); 
					else { 
						System.out.println("파일삭제 실패");
						throw new Exception();
					} 
				} else
					System.out.println("파일이 존재하지 않습니다.");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// 산출물 정보 삭제
		int result2 = dao.deleteOutputByTaskId(taskId);
		
		return (result == 1 && result2 == 1) ? true : false;
	}
	
	public boolean updateOutput(Output output) {
		return (dao.updateOutput(output) == 1) ? true : false;
	}

	public int getOutputCount(OutputSearchCriteria sc) {
		
		return dao.getOutputCount(sc);
	}
	
}
