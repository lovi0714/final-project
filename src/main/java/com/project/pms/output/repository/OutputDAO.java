package com.project.pms.output.repository;

import java.util.List;

import com.project.pms.output.vo.Output;
import com.project.pms.output.vo.OutputCategory;
import com.project.pms.output.vo.OutputDetail;
import com.project.pms.output.vo.OutputFile;
import com.project.pms.output.vo.OutputFileInfo;
import com.project.pms.output.vo.OutputListForm;
import com.project.pms.output.vo.OutputSearchCriteria;
import com.project.pms.output.vo.OutputType;
import com.project.pms.output.vo.ProjectInfo;

public interface OutputDAO {
	public List<OutputListForm> getOutputList(OutputSearchCriteria sc);
	public List<OutputCategory> getOutputCategory();
	public List<OutputType> getOutputType();
	public List<ProjectInfo> getProjectInfo();
	public OutputDetail getOutputDetail(Integer outputId);
	public Integer getMaxOutputId();
	public void saveOutput(Output output);
	public void saveOutputFile(OutputFile outputFile);
	public OutputFileInfo getOutputFile(Integer outputFileId);
	public int deleteOutputFile(Integer outputId);
	public int deleteOutput(Integer outputId);
	public int updateOutput(Output output);
	public OutputFileInfo getOutputFileByTaskId(Integer taskId);
	public int deleteOutputFileByTaskId(Integer taskId);
	public int deleteOutputByTaskId(Integer taskId);
}
