package com.project.pms.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.pms.project.repository.ProjectDAO;
import com.project.pms.project.vo.DeptType;
import com.project.pms.project.vo.Pm;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectType;
import com.project.pms.project.vo.RndType;
import com.project.pms.resource.service.ResourceService;
import com.project.pms.resource.vo.Resource;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO dao;
	
	@Autowired
	private ResourceService service;
	
	public List<Project> getList() {
		return dao.getList();
	}
	
	@Transactional
	public void create(Project project) {
		dao.insertProject(project);
		
		String projectId = dao.getProjectMaxId();
		Resource resource = new Resource();
		resource.setEmpId(project.getPmoId());
		resource.setProjectId(projectId);
		
		service.insertResource(resource);
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

	public Project getProjectByProjectId(String projectId) {
		
		return dao.getProjectByProjectId(projectId);
	}

	public Pm getPmByProjectId(String projectId) {
		
		return dao.getPmByProjectId(projectId);
	}

	public Pm getPmoByProjectId(String projectId) {
		
		return dao.getPmoByProjectId(projectId);
	}
	
	@Transactional
	public void modifyProject(Project project) {
		
		dao.modifyProject(project);
		service.insertResource(new Resource(project.getProjectId(), project.getPmoId()));

	}

}
