package com.project.pms.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pms.project.repository.ProjectDAO;
import com.project.pms.project.vo.Project;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO dao;
	
	public List<Project> getList() {
		return dao.getList();
	}
	
	public void create(Project project) {
		dao.insert(project);
	}

}
