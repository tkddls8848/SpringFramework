package com.kitri.project.board.dao;

import java.util.List;

import com.kitri.project.board.BoardDTO;

public interface IBoardDAO {

	public void deleteFiles(String fullName);
	public List<String> selectFiles(int bno);
	public void insertFiles(String fullName);
	public void updateFiles(String fullName, int bno);
	
	public void deleteBoard(int bno);
	public BoardDTO selectBoard(int bno);
	public List<BoardDTO> selectAllBoard(int start, int end, String Search_option, String keyword);
	public void insertBoard(BoardDTO dto);
	public void updateBoard(BoardDTO dto);	
	
	public int boardTotalCount();
	public void increaseViewCnt(int bno);
	public int searchBoard(String search_option, String keyword);
}
