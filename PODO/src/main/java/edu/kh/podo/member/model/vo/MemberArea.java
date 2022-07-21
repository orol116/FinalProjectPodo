package edu.kh.podo.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class MemberArea {
	
	private int mcrdntNo;
	private int memberNo;
	private int coordinateX;
	private int coordinateY;

}
