package com.kitri.project.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.board.service.page.Pager;
import com.kitri.project.member.MemberDTO;
import com.kitri.project.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	@RequestMapping(value="/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value="/list")//리스트 조회
	public ModelAndView memberList(@RequestParam(defaultValue = "1") int curPage) {
		System.out.println("memberList.controller");
		
		int count = memberService.memberTotalCount();
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<MemberDTO> listTab = memberService.memberListMenu(start, end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listTab", listTab);
		map.put("count", count);
		map.put("pager", pager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);	
		List<MemberDTO> list = memberService.memberList(start, end);
		mav.addObject("list", list);
		mav.setViewName("member/memberList");
		
		return mav;
	}	

	@RequestMapping(value="/insert", method=RequestMethod.GET)//회원가입
	public String memberInsert(Principal principal) {
		System.out.println("memberInsert.controller");
		String userid = ((MemberDTO) principal).getUserid();
		
		if(userid == null) {
			return "redirect:/member/list";			
		} else {
			return "/member/memberInsert";			
		}
	}	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)//회원가입완료 후 리스트
	public String memberJoin(@ModelAttribute MemberDTO memberDTO) {
		System.out.println("memberJoin.controller");
		memberService.memberInsert(memberDTO);
		return "redirect:/member/list";
	}
	
	@RequestMapping(value="/view", method={RequestMethod.GET, RequestMethod.POST})
	public String memberSelect(@RequestParam String userid, Model model) {
		System.out.println("memberSelect.controller");
		MemberDTO memberDTO = memberService.memberSelect(userid);
		model.addAttribute("memberDTO", memberDTO);
		return "/member/memberSelectDetail";
	}
	
	@RequestMapping(value="/modify")
	public String memberModify(@ModelAttribute MemberDTO memberDTO, Model model) {
		System.out.println("memberModify.controller");
		boolean result = true;
		
		if(result) {
			memberService.memberUpdate(memberDTO);
			return "redirect:/member/list";
		} else {
			MemberDTO dto = memberService.memberSelect(memberDTO.getUserid());
			model.addAttribute("memberDTO", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "/member/memberSelectDetail";			
		}
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberDTO memberDTO, Model model) {
		System.out.println("memberUpdate.controller");
		model.addAttribute("memberDTO", memberDTO);
		return "/member/memberUpdate";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String memberDelete(@ModelAttribute MemberDTO memberDTO, Model model) {
		System.out.println("memberDelete.controller");
		boolean result = memberService.checkPw(memberDTO.getUserid(), memberDTO.getMemPW());
		
		if(result) {	
			memberService.memberDelete(memberDTO);
			return "redirect:/member/list";		
		} else {
			MemberDTO dto = memberService.memberSelect(memberDTO.getUserid());
			model.addAttribute("memberDTO", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "/member/memberSelectDetail";			
		}
	}
}
