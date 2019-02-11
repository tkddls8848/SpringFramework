package com.kitri.project.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kitri.project.board.BoardDTO;

@Repository
public class BoardDAO implements IBoardDAO{
	
	@Inject
	SqlSession sqlsession;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> selectAllBoard(int start, int end, String Search_option, String keyword) {
		
		return sqlsession.selectList("boardMapper.selectAllBoard");
	}

	@Override
	public void insertBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseViewCnt(int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int searchBoard(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

}
