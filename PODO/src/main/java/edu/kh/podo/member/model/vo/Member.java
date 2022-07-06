package edu.kh.podo.member.model.vo;

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
	private String memberTel;
	private String secessionFlag;
	private String profileImage;
	private int memberGrape;
	private String memberTown;

}