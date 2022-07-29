package edu.kh.podo.chat.model.vo;

import java.sql.Date;

import edu.kh.podo.board.itemBoard.model.vo.Time;
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
	private String messageTime;
	private int messageNo;
	
	public String getMessageTime() {
		return messageTime;
	}
	
	public void setMessageTime(Date messageTime) {
		this.messageTime = Time.calculateTime(messageTime);
	}	
	
	
}
