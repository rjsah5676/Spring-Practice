package com.ict.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.myapp.service.BbsService;
import com.ict.myapp.vo.BbsVO;
import com.ict.myapp.vo.PagingVO;

@Controller
@RequestMapping("/bbs")
public class BbsController {
	
	@Inject
	BbsService service;
	
	@GetMapping("/list")
	public ModelAndView list(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		int record = service.bbsTotalRecord(pVO);
		pVO.setTotalRecord(record);
		List<BbsVO> list = service.bbsSelect(pVO);
		mav.addObject("pVO",pVO);
		mav.addObject("list",list);
		mav.setViewName("bbs/list");
		return mav;
	}
	@GetMapping("/write")
	public String write() {
		return "bbs/write";
	}
	@PostMapping("/writeOk")
	public ModelAndView writeOk(BbsVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setIp(request.getRemoteAddr());
		vo.setUserid((String)session.getAttribute("logid"));
		int result = service.bbsInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(result==1) {
			mav.setViewName("redirect:list");
		}else {
			mav.setViewName("bbs/result");
		}
		return mav;
	}
	@GetMapping("/view")
	public ModelAndView view(int news_no) {

		service.hitCount(news_no);
		
		BbsVO vo = service.bbsViewSelect(news_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("bbs/view");
		
		
		return mav;
	}
	@GetMapping("/edit")
	public ModelAndView edit(int news_no) {
		ModelAndView mav = new ModelAndView();
		
		BbsVO vo = service.bbsViewSelect(news_no);
		mav.addObject("vo",vo);
		mav.setViewName("bbs/edit");
		return mav;
	}
	
	@PostMapping("/editOk")
	public ModelAndView editOk(BbsVO vo) {
		ModelAndView mav = new ModelAndView();
		int result = service.bbsUpdate(vo);
		if(result>0) {
			mav.setViewName("redirect:view?news_no="+vo.getNews_no());
		} else {
			mav.setViewName("bbs/result");
		}

		return mav;
	}
	@GetMapping("/del")
	public ModelAndView del(int news_no) {
		int result = service.bbsDelete(news_no);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:list");
		}else {
			mav.setViewName("redirect:view?news_no="+news_no);
		}
		return mav;
	}
}
