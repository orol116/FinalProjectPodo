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
public class Note {
	
	private int noteNo;
	private String noteContent;
	private Date noteDate;
	private int receiverNo;
	
}
