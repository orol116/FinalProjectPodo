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
	
	public String getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = Time.calculateTime(createDate);
	}	
	
	public String getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(Date updateDate) {
		this.updateDate = Time.calculateTime(updateDate);
	}	
}
