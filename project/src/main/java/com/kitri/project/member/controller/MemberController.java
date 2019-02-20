package com.kitri.project.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project.member.MemberDTO;
import com.kitri.project.member.dao.MemberDao;
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

	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String memberList(Model model) {
		System.out.println("memberList.controller");
		List<MemberDTO> list = memberService.memberList();
		model.addAttribute("list", list);
		return "member/memberList";
	}	
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String memberInsert() {
		System.out.println("memberInsert.controller");
		return "/member/memberInsert";
	}	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String memberJoin(@ModelAttribute MemberDTO memberDTO) {
		System.out.println("memberJoin.controller");
		memberService.memberInsert(memberDTO);
		return "redirect:/member/list";
	}
	
	@RequestMapping(value="/view", method={RequestMethod.GET, RequestMethod.POST})
	public String memberSelect(@RequestParam String memID, Model model) {
		System.out.println("memberSelect.controller");
		MemberDTO memberDTO = memberService.memberSelect(memID);
		model.addAttribute("memberDTO", memberDTO);
		return "/member/memberSelectDetail";
	}
	
	@RequestMapping(value="/modify")
	public String memberModify(@ModelAttribute MemberDTO memberDTO, Model model) {
		System.out.println("memberModify.controller");
		boolean result = memberService.checkPw(memberDTO.getMemID(), memberDTO.getMemPW());
		
		if(result == true) {
			memberService.memberUpdate(memberDTO);
			return "redirect:/member/list";			
		} else {
			MemberDTO dto = memberService.memberSelect(memberDTO.getMemID());
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
		boolean result = memberService.checkPw(memberDTO.getMemID(), memberDTO.getMemPW());
		
		if(result == true) {	
			memberService.memberDelete(memberDTO);
			return "redirect:/member/list";		
		} else {
			MemberDTO dto = memberService.memberSelect(memberDTO.getMemID());
			model.addAttribute("memberDTO", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "/member/memberSelectDetail";			
		}
	}
//		
//	@RequestMapping(value="/redirect", method=RequestMethod.GET)
//	public String redirect() {
//		return "redirect";
//	}
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String memberSearch(MemberDTO member, HttpSession session) {
//		
//		MemberDTO m = service.memberSearch(member);
//		session.setAttribute("session", m);
//		
//		return "member/loginOK";
//	}
//	
//	@RequestMapping(value="/logout", method=RequestMethod.GET)
//	public String memberLogout(MemberDTO member, HttpSession session) {
//		session.invalidate();
//		return "member/logoutOK";
//	}
//	

//	
//	@RequestMapping(value="/modify", method=RequestMethod.POST)
//	public ModelAndView memberModify(MemberDTO member, HttpSession session) {
//			
//		MemberDTO members = service.memberModify(member);
//		
//		session.setAttribute("session", members);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("memINFO", members);
//		mav.setViewName("member/modifyOK");
//					
//		return mav;
//
//	}
//	
//	@RequestMapping(value="/remove", method=RequestMethod.GET)
//	public String memberRemove(MemberDTO member, Model model, HttpSession session){
//		
//		MemberDTO mem = (MemberDTO) session.getAttribute("session");
//		
//		if(mem == null) {
//			
//			return "redirect:/member/redirect";
//			
//		} else {
//			
//			String s = member.getMemID();
//			model.addAttribute("mem", s);
//			
//			session.invalidate();
//			
//			service.memberRemove(member);
//			
//			return "member/removeOK";
//			
//		}
	
}
