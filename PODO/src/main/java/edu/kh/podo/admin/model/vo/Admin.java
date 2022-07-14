package edu.kh.podo.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Admin {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int readCount;
	private String createDate;
	private String updateDate;
	private int boardCode;
	private int memberNo;
	private String memberNick;
	private String classification;
	
}
