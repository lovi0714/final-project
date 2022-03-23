package com.project.pms.resource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

}
