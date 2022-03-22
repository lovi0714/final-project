package com.project.pms.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.project.repository.ProjectDAO;
import com.project.pms.project.vo.DeptType;
import com.project.pms.project.vo.Pm;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectType;
import com.project.pms.project.vo.RndType;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO dao;
	
	public List<Project> getList() {
		return dao.getList();
	}
	
	public void create(Project project) {
		dao.insertProject(project);
	}

	public List<RndType> getRndType() {
		return dao.getRndType();
	}

	public List<ProjectType> getProjectType() {
		return dao.getProjectType();
	}

	public List<Pm> getPmByDeptId(Integer deptId) {
		return dao.getPmByDeptId(deptId);
	}

	public List<DeptType> getDeptType() {
		return dao.getDeptType();
	}

	public List<Pm> getPmoByDeptId(Integer deptId) {
		return dao.getPmoByDeptId(deptId);
	}

}
