package com.project.pms.resource.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestBody;

import com.project.pms.resource.repository.ResourceDAO;
import com.project.pms.resource.vo.Resource;

@Service
public class ResourceService {

	@Autowired
	private ResourceDAO dao;
	
	public List<Resource> getResourceList(String projectId) {
		
		return dao.getResourceList(projectId);
	}

	public List<Resource> getAllResourceList(String projectId) {
		
		return dao.getAllResourceList(projectId);
	}

	@Transactional
	public void insertResource(Resource resource) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectId", resource.getProjectId());
		map.put("empId", resource.getEmpId());
		
		if (ObjectUtils.isEmpty(dao.resourceFindByEmpIdAndProjectId(map))) {
			dao.insertResource(resource);
		}
	}
	
	public void removeResource(Resource resource) {
		
		dao.removeReource(resource);
	}

}
