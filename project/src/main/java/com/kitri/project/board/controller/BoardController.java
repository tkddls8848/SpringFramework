package com.kitri.project.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.board.BoardDTO;
import com.kitri.project.board.service.BoardService;
import com.kitri.project.board.service.page.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	
	@RequestMapping(value="/list")
	public ModelAndView boardList(
			@RequestParam(defaultValue = "1") int curPage, 
			@RequestParam(defaultValue = "all") String search_option, 
			@RequestParam(defaultValue = "") String keyword) {		
		
		int count = 200;
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = boardservice.selectAllBoard(start, end, search_option, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("board/boardList");
		
		return mav;
	}

	@RequestMapping(value="/view.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView boardView(
			@RequestParam int bno, 
			@RequestParam int curPage, 
			@RequestParam String search_option, 
			@RequestParam String keyword,
			Principal principal) {	
		
		boardservice.increaseViewCnt(bno);
		String userid = principal.getName();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/boardView");
		
		mav.addObject("dto", boardservice.selectBoard(bno));
		mav.addObject("curPage", curPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		mav.addObject("userid", userid);
		
		return mav;
	}
	
	@RequestMapping(value="/write.do", method={RequestMethod.POST, RequestMethod.GET})
	public String boardWrite() {		
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/insert.do", method={RequestMethod.POST, RequestMethod.GET})
	public String boardInsert(@ModelAttribute BoardDTO dto) {		
		boardservice.insertBoard(dto);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/imageUpload.do", method=RequestMethod.POST)
	public void boardImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws IOException {		
		System.out.println("boardImageUpload");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		
		String uploadPath = "C:\\SpringFramework\\SP board\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\WEB-INF\\views\\images\\";
		
		OutputStream out = new FileOutputStream(new File(uploadPath));
		
		out.write(bytes);
		String callback=request.getParameter("CKEditorFuncNum");
		PrintWriter printwriter = response.getWriter();
		String fileUrl = request.getContextPath()+"/images/"+fileName;
		System.out.println("FileUrl : " + fileUrl);
		
		printwriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
				+ callback +", '" + fileUrl
	            + "','이미지를 업로드 하였습니다.'"
	            + ")</script>");
		
		printwriter.flush();
		
	}	
	
	@RequestMapping(value="/delete.do", method={RequestMethod.POST, RequestMethod.GET})
	public String boardDelete(int bno) {		
		boardservice.deleteBoard(bno);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/update.do", method={RequestMethod.POST, RequestMethod.GET})
	public String boardUpdate(BoardDTO dto) {		
		boardservice.updateBoard(dto);
		return "redirect:/board/list";
	}
	
}
