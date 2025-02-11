package com.ict.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.myapp.service.MemberService;
import com.ict.myapp.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MemberController {
	
	
	@Inject
	MemberService service;
	
	@GetMapping("/member/form")
	public String form() {
		return "member/memberForm";
	}
	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}
	@PostMapping("/member/formOk")
	public ModelAndView fomrOk(MemberVO vo) {
		int result;
		try {
			result = service.memberInsert(vo);
		} catch(Exception e) {
			result=0;
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("member/memberOkResult");
		
		return mav;
	}
	
	@PostMapping("/member/loginOk")
	public ModelAndView loginOk(String userid, String userpwd, HttpSession session) {  //()���� ������ request���ش�.	
		MemberVO vo = service.loginOk(userid, userpwd);
		
		ModelAndView mav = new ModelAndView();
		if(vo != null) { //���̵�� ��й�ȣ�� ��ġ�ϴ� ������ ������ vo�� �����Ͱ� ������� return�ǰ�, 
			
			//�α��� ���� : session�� ���̵�, �̸�, �α��λ��� ���� �� Ȩ���� �̵�
			//session ���ϴ� �� : HttpServletRequest, HttpSession (�ݵ�� �鿣�带 ���ؼ� ���Ѵ�.)
			session.setAttribute("logid", vo.getUserid());
			session.setAttribute("logName", vo.getUsername());
			session.setAttribute("logStatus", "Y");
			
			//�ٸ� ���� �ּҷ� �ٷ� �̵��ϱ� ���ؼ� 'redirect:' �� �ٿ��� �ش� ���� �ּҸ� ȣ���Ѵ�.
			mav.setViewName("redirect:/");
			//mav.setViewName("home"); ���� ȣ���ϸ� home.jsp�� �̵��Ѵ�. homecontroller.java������ ��ɾ� ó���� ������� �������Ѵ�.
			
		} else { //��ġ�ϴ� ������ ������ vo�� null�� ��� ��ü�� �� ���������.
			//�α��� ���� : �α��������� �̵�
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/member/edit")
	public ModelAndView edit(HttpSession session) {
		String userid = (String)session.getAttribute("logid");
		MemberVO vo = service.memberSelect(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("member/memberEdit");
		return mav;
	}
	@PostMapping("/member/editOk")
	public String editOk(MemberVO vo) {
		int result = service.memberUpdate(vo);
		return "redirect:edit";
	}
	
	@GetMapping("/member/idDuplicate")
	@ResponseBody
	public String idDuplicate(String userid) {
		log.info("userid");
		return Integer.toString(service.idDuplicate(userid));
	}
}
