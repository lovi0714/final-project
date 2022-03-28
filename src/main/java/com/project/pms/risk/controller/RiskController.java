package com.project.pms.risk.controller;

import java.io.File;

import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.pms.risk.service.RiskService;
import com.project.pms.risk.vo.RiskFileInfo;
import com.project.pms.risk.vo.RiskSaveRequest;

@Controller
@RequestMapping("/risk")
public class RiskController {
	
	@Autowired
	private RiskService riskService;

	// 리스크 목록 가져오기
	@GetMapping("/riskBoard.do")
	public String getRiskList(Model model) {
		model.addAttribute("riskList", riskService.getRiskList());

		return "risk/riskBoard";
	}

	// 상세 페이지 가져오기
	@GetMapping("/detail.do")
	public String getDetail(@RequestParam int riskId, Model model) {
		
		model.addAttribute("detail", riskService.getRiskDetail(riskId));
		return "risk/detail";
	}
	
	// 리스크 등록 페이지 
	@GetMapping("/write.do")
	public String writeRisk(Model model) {
		
		model.addAttribute("emp", riskService.getEmpList());
		model.addAttribute("prj", riskService.getProjectList());
		model.addAttribute("task",riskService.getMyTaskList());
		return "risk/writeForm";
	}
	
	// 수정 페이지 가져오기
	@GetMapping("/modify.do")
	public String modifyRisk(@RequestParam int riskId, Model model) {
		model.addAttribute("emp", riskService.getEmpList());
		model.addAttribute("prj", riskService.getProjectList());
		model.addAttribute("task",riskService.getMyTaskList());
		model.addAttribute("risk", riskService.getModifyInfo(riskId));
		return "risk/modify";
	}
	
	// 리스크 저장하기
	@Value("${upload}")
	private String upload;
	@PostMapping("/save.do")
	public String saveRisk(RiskSaveRequest riskSaveRequest, @RequestParam(required = false) MultipartFile file, RiskFileInfo fileInfo) throws Exception {
		
		
		riskService.saveRisk(riskSaveRequest);
		if(file!=null) {
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
		
		fileInfo.setBoardId(riskSaveRequest.getRiskId());
		fileInfo.setOriginalName(originalName);
		fileInfo.setSaveName(saveName);
		fileInfo.setExtension(extension);
		fileInfo.setVolume(volume);

		riskService.insertFile(fileInfo);
		
		}
		return "redirect:/risk/riskBoard.do";
	}
	
	// 글 삭제하기
	@GetMapping("/delete.do")
	public String deleteRisk(@RequestParam int riskId) {
		riskService.deleteRisk(riskId);
		return "redirect:/risk/riskBoard.do";
	}
}
