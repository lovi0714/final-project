package com.project.pms.output.vo;

import java.time.LocalDateTime;

public class OutputFile {
	private Integer outputFileId;
	private Integer outputId;
	private String originalName;
	private String saveName;
	private String ext;
	private Long volume;
	private String volumeText;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;
	
	public OutputFile() {
		super();
	}

	public OutputFile(Integer outputFileId, Integer outputId, String originalName, String saveName, String ext,
			Long volume, String volumeText, LocalDateTime createAt, LocalDateTime updateAt) {
		super();
		this.outputFileId = outputFileId;
		this.outputId = outputId;
		this.originalName = originalName;
		this.saveName = saveName;
		this.ext = ext;
		this.volume = volume;
		this.volumeText = volumeText;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public Integer getOutputFileId() {
		return outputFileId;
	}

	public void setOutputFileId(Integer outputFileId) {
		this.outputFileId = outputFileId;
	}

	public Integer getOutputId() {
		return outputId;
	}

	public void setOutputId(Integer outputId) {
		this.outputId = outputId;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public Long getVolume() {
		return volume;
	}

	public void setVolume(Long volume) {
		this.volume = volume;
	}

	public String getVolumeText() {
		return volumeText;
	}

	public void setVolumeText(String volumeText) {
		this.volumeText = volumeText;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "OutputFile [outputFileId=" + outputFileId + ", outputId=" + outputId + ", originalName=" + originalName
				+ ", saveName=" + saveName + ", ext=" + ext + ", volume=" + volume + ", volumeText=" + volumeText
				+ ", createAt=" + createAt + ", updateAt=" + updateAt + "]";
	}
	
}
