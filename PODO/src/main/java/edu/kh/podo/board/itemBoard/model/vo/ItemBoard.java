package edu.kh.podo.board.itemBoard.model.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ItemBoard {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int readCount;
	private String createDate;
	private String updateDate;
	private String itemCondition;	
	private String tradeCondition;
	private String delivery;
	private String price;
	private String secessionFlag;
	private String sellArea;
	private int boardCode;
	private int memberNo;
	private int categoryNo;
	private int MCategoryNo;
	private String categoryName;
	private int buyMemberNo;
	private int bookmarkCount;
	private String mCategoryName;
	private String lCategoryName;
	private String imageReName;
	private int memberGrape;
	
	
	private List<BoardImage> imageList;
	
	private BoardImage img;
	
	private Coordinate coordinate;
	
	public String getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(Date updateDate) {
		this.updateDate = Time.calculateTime(updateDate);
	}	

	private double dLon;
	private double dLat;
	private double distance;
}
