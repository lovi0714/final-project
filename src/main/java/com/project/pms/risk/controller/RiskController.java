package com.project.pms.risk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		model.addAttribute("fileInfo", riskService.getFileInfo(riskId));
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
		model.addAttribute("fileInfo", riskService.getFileInfo(riskId));
		return "risk/modify";
	}
	
	// 리스크 저장하기
	@Value("${upload}")
	private String upload;
	@PostMapping("/save.do")
	public String saveRisk(RiskSaveRequest riskSaveRequest, @RequestParam(required = false) MultipartFile file, RiskFileInfo fileInfo) throws Exception {
		
		
		riskService.saveRisk(riskSaveRequest);
		
		if(file.getSize()!=0) {
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
		
		fileInfo.setRiskId(riskSaveRequest.getRiskId());
		fileInfo.setOriginalName(originalName);
		fileInfo.setSaveName(saveName);
		fileInfo.setExtension(extension);
		fileInfo.setVolume(volume);

		riskService.insertFile(fileInfo);		
		
		}
		return "redirect:/risk/riskBoard.do";
	}
	
	@RequestMapping("/fileDown.do")
	public void fileDown(@RequestParam int riskId, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		RiskFileInfo fileInfo = riskService.getFileInfo(riskId);
		
		 //파일 업로드된 경로 
        try{

            String savePath = upload + "/";
            String saveName = fileInfo.getSaveName();
            
            //실제 내보낼 파일명 
            String oriFileName = fileInfo.getOriginalName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, saveName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }		
		
	}

	// 글 삭제하기
	@GetMapping("/delete.do")
	public String deleteRisk(@RequestParam int riskId) {
		riskService.deleteRisk(riskId);
		return "redirect:/risk/riskBoard.do";
	}
}
