package edu.kh.podo.board.itemBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Coordinate {
	
	private int coordinateNo;
	private int boardNo;
	private String dLon;
	private String dLat;
}
