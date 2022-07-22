package edu.kh.podo.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class AdminReply {

	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String createDate;
	
}
