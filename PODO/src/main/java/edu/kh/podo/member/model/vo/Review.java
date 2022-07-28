package edu.kh.podo.member.model.vo;

import java.util.Date;

import edu.kh.podo.board.itemBoard.model.vo.Time;
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
	
	public String getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = Time.calculateTime(createDate);
	}
	private String memberProfile;
	private int writeMemberNo;
	private String boardTitle;
	
}
