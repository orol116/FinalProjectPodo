package edu.kh.podo.admin.model.vo;

import java.util.Date;

import edu.kh.podo.board.itemBoard.model.vo.Time;
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
	
	public String getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = Time.calculateTime(createDate);
	}	
	
	
}
