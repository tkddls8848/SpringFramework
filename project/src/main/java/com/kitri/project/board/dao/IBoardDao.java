package com.kitri.project.board.dao;

import java.util.List;

import com.kitri.project.board.BoardDTO;

public interface IBoardDao {

	void deleteFiles(String fullName);
	List<String> selectFiles(int bno);
	void insertFiles(String fullName);
	void updateFiles(String fullName, int bno);
	
	void deleteBoard(int bno);
	BoardDTO selectBoard(int bno);
	List<BoardDTO> selectAllBoard(int start, int end, String Search_option, String keyword);
	void insertBoard(BoardDTO dto);
	void updateBoard(BoardDTO dto);	
	
	void increaseViewCnt(int bno);
	int searchBoard(String search_option, String keyword);
}
