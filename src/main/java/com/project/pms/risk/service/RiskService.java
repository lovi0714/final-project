package com.project.pms.risk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.risk.repository.RiskDAO;
import com.project.pms.risk.vo.RiskBoard;

@Service
public class RiskService {

	@Autowired
	private RiskDAO dao;
	
	private final static java.util.logging.Logger LOGGER = java.util.logging.Logger.getGlobal();
	
	// 전체 목록 가져오기
	public List<RiskBoard> getRiskList() {
		
		List<RiskBoard> result = dao.getRiskList();
		LOGGER.info(result.toString());
		
		return dao.getRiskList(); 
	}
}
