package com.kitri.project.board.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.project.board.BoardDTO;
import com.kitri.project.board.dao.BoardDAO;


@Service
public class BoardService implements IBoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public void deleteFiles(String fullName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> selectFiles(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFiles(String fullName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFiles(String fullName, int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardDTO selectBoard(int bno) {
		return boardDAO.selectBoard(bno);
	}

	@Override
	public List<BoardDTO> selectAllBoard(int start, int end, String Search_option, String keyword) {
		return boardDAO.selectAllBoard(start, end, Search_option, keyword);
	}

	@Override
	public void insertBoard(BoardDTO dto) {
		boardDAO.insertBoard(dto);
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseViewCnt(int bno) {
		boardDAO.increaseViewCnt(bno);
	}

	@Override
	public int searchBoard(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}