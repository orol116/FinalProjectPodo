package edu.kh.podo.member.model.vo;

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
public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberNickname;
	private String memberName;
	private String memberTel;
	private String secessionFlag;
	private String memberProfile;
	private int memberGrape;
	private String memberAddress;
	private String memberTown;
	private String createDate;
	private char admin;
	private String shopInfo;
	
	private MemberArea memberArea;
	private double dLon;
	private double dLat;
	private int distance;
	
	public String getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = Time.calculateTime(createDate);
	}	

}
