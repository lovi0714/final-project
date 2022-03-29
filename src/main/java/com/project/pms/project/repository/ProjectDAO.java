package com.project.pms.project.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.project.vo.DeptType;
import com.project.pms.project.vo.Link;
import com.project.pms.project.vo.Pm;
import com.project.pms.project.vo.Project;
import com.project.pms.project.vo.ProjectType;
import com.project.pms.project.vo.RndType;
import com.project.pms.project.vo.Task;

@Repository
public interface ProjectDAO {
	public List<Project> getList();
	public void insertProject(Project project);
	public void modifyProject(Project project);
	public Project getProjectByProjectId(String projectId);
	public List<RndType> getRndType();
	public List<ProjectType> getProjectType();
	public List<DeptType> getDeptType();
	public List<Pm> getPmByDeptId(Integer deptId);
	public List<Pm> getPmoByDeptId(Integer deptId);
	public Pm getPmByProjectId(String projectId);
	public Pm getPmoByProjectId(String projectId);
	public String getProjectMaxId();
	public void saveTask(Task task);
	public List<Task> getTasks(String projectId);
	public void saveLink(Link link);
	public List<Link> getLinks(String projectId);
	public Integer getLinkMaxId();
	public void deleteLink(Integer linkId);
	public Integer getTaskMaxId();
	public void updateTask(Task task);
	public void deleteTask(Integer taskId);
}
