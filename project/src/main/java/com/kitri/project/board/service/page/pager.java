package com.kitri.project.board.service.page;

public class pager {

	public static final int PAGE_SCALE=5;
	public static final int BLOCK_SCALE=10;
	
	private int curPage;
	private int prevPage;
	private int nextPage;
	private int totPage;
	private int totBlock;
	private int curBlock;
	private int prevBlock;
	private int nextBlock;
	
	private int pageBegin;
	private int pageEnd;
	
	private int blockBegin;
	private int blockEnd;
	
	public Pager(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotpage(count);
		setPageRange();
		setTotblock();
		setBlockRange();
	}
	
	public void setBlockRange() {
		
	}
	
}
