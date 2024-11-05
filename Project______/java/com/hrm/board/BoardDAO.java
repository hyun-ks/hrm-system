package com.hrm.board;

import java.util.List;

public class BoardDAO {
	private List<Board> boards;

	// 데이터베이스에서 게시글 목록을 가져오는 메서드
	public List<Board> getBoardList() {
		// 데이터베이스에서 쿼리를 이용하여 게시글 목록을 가져옴
		// 예를 들어, List<Board> boards = database.retrieveBoards();
		// 이후 가져온 목록을 리턴
		return boards;
	}
}