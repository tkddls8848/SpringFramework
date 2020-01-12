package com.kitri.project.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kitri.project.board.BoardDTO;

@Repository
public class BoardDAO implements IBoardDAO{
	
	@Inject
	SqlSession sqlSession;

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
		sqlSession.delete("boardMapper.deleteBoard", bno);
	}

	@Override
	public BoardDTO selectBoard(int bno) {
		return sqlSession.selectOne("selectBoard", bno);
	}

	@Override
	public List<BoardDTO> selectAllBoard(int start, int end, String search_option, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("boardMapper.selectAll", map);
	}

	@Override
	public void insertBoard(BoardDTO dto) {
		sqlSession.insert("boardMapper.insert", dto);		
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", dto.getBno());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		
		sqlSession.update("boardMapper.updateBoard", map);
	}

	@Override
	public void increaseViewCnt(int bno) {
		sqlSession.update("boardMapper.increaseViewCnt", bno);
	}

	@Override
	public int searchBoard(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardTotalCount() {
		return sqlSession.selectOne("boardMapper.boardTotalCount");
	}

}
