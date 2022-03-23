package com.project.pms.resource.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.pms.resource.vo.Resource;

@Repository
public interface ResourceDAO {

	public List<Resource> getResourceList(String projectId);

}
