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
public class ChatMessage {
	
	private int messageNo;
	private String messageContent;
	private Date messageTime;
	private int chatNo; // 채팅방 번호
	
	private int memberNo;
	private String memberNickname;

}
