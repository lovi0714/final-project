package com.project.pms.resource.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.project.pms.resource.vo.Resource;
import com.project.pms.resource.vo.ResourceWbs;

@Repository
public interface ResourceDAO {

	public List<Resource> getResourceList(String projectId);

	public List<Resource> getAllResourceList(String projectId);

	public void insertResource(Resource resource);

	public void removeReource(Resource resource);

	public Resource resourceFindByEmpIdAndProjectId(Map<?, ?> map);

	public List<ResourceWbs> getWbsResourceList(String projectId);

	public void removeReourceByProjectId(String projectId);

}
