package com.project.pms.risk.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.risk.vo.RiskBoard;

@Repository
public interface RiskDAO {

	// 전체 목록 가져오기
	public List<RiskBoard> getRiskList();
}
