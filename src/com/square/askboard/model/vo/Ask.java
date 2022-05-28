package com.square.askboard.model.vo;

import java.sql.Date;

public class Ask {
 
	private int askNo;
	private int askType;
	private int askCategory;
	private String askTitle; 
	private String askContent;
	private String askWriter;
	private int askCount;
	private Date createDate;
	private String status;
	
	public Ask() {}

	public Ask(int askNo, int askType, int askCategory, String askTitle, String askContent, String askWriter,
			int askCount, Date createDate, String status) {
		super();
		this.askNo = askNo;
		this.askType = askType;
		this.askCategory = askCategory;
		this.askTitle = askTitle;
		this.askContent = askContent;
		this.askWriter = askWriter;
		this.askCount = askCount;
		this.createDate = createDate;
		this.status = status;
	}

	public int getAskNo() {
		return askNo;
	}

	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}

	public int getAskType() {
		return askType;
	}

	public void setAskType(int askType) {
		this.askType = askType;
	}

	public int getAskCategory() {
		return askCategory;
	}

	public void setAskCategory(int askCategory) {
		this.askCategory = askCategory;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public String getAskWriter() {
		return askWriter;
	}

	public void setAskWriter(String askWriter) {
		this.askWriter = askWriter;
	}

	public int getAskCount() {
		return askCount;
	}

	public void setAskCount(int askCount) {
		this.askCount = askCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Ask [askNo=" + askNo + ", askType=" + askType + ", askCategory=" + askCategory + ", askTitle="
				+ askTitle + ", askContent=" + askContent + ", askWriter=" + askWriter + ", askCount=" + askCount
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
	
}
