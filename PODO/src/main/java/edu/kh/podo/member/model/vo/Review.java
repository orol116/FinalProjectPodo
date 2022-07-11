package edu.kh.podo.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private String reviewCondition;
	private String secessionFlag;
	private int memberNo;
	private int boardNo;
	private String memberNickname;
	private String createDate;
	
}
