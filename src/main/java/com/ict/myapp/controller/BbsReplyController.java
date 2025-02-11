package com.ict.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.myapp.service.BbsReplyService;
import com.ict.myapp.vo.BbsReplyVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply")
public class BbsReplyController {
	@Inject
	BbsReplyService service;
	
	@PostMapping("/bbsReplyWrite")
	@ResponseBody
	public String BbsReplyWrite(BbsReplyVO vo, HttpSession session) {
		vo.setUserid((String) session.getAttribute("logid"));
		log.info(vo.toString());
		service.replyInsert(vo);
		return service.replyInsert(vo)+ "";
	}
	
	@GetMapping("/bbsReplyList")
	@ResponseBody
	public List<BbsReplyVO> bbsReplyList(int news_no) {
		return service.replyList(news_no);
	}
	@PostMapping("/bbsReplyEdit")
	@ResponseBody
	public String bbsReplyEdit(BbsReplyVO vo) {	
		return service.replyUpdate(vo)+"";
	}
	@GetMapping("/bbsReplyDelete")
	@ResponseBody
	public Integer bbsReplyDelete(int reply_no) {
		return service.replyDelete(reply_no);
	}
}
