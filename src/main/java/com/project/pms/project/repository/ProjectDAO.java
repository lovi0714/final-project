package com.project.pms.project.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.project.vo.Project;

@Repository
public interface ProjectDAO {
	public List<Project> getList();
	public void insert(Project project);

}
