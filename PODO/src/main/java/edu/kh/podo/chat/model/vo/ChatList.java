package edu.kh.podo.chat.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatList {
	
	private int chatNo;
	private int boardNo;
	private String chatStatus;
	
	private int memberNo;
	private String memberNickname;
	private String memberProfile;
	
	private String messageContent;
	private Date messageTime;

}
