package com.oracle.samil.Amodel;

import lombok.Data;

@Data
public class Approval {
	public int 		documentFormId;		//문서서식ID
	public int 		approvalNum;		//결재문서번호
	public int 		empno;				//작성자
	public String 	approvalTitle;		//문서제목
	public int 		approvalCondition;	//결재상태
	public String 	approvalDate;		//기안일자
	public String 	relatedDocuments;	//연관문서
	public String 	imageAttachment;	//파일첨부
}
