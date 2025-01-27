package com.ict.myapp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@RequestMapping(value="/test1",method=RequestMethod.GET)
	public String test1(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		
		System.out.println(num+","+name);
		
		model.addAttribute("username","¼¼Á¾´ë¿Õ");
		model.addAttribute("hi","welcome");
		
		return "home";
	}
	
	@RequestMapping("/test2")
	public ModelAndView test2(int num, String name) {
		System.out.println(num+10+"===="+name);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("username","¼ÕÈï¹Î");
		mav.addObject("hi","Bye");
		
		mav.setViewName("home");
		
		return mav;
	}
	@GetMapping("/test3")
	public String test3(TestVO vo, Model model) {
		System.out.println(vo.toString());
		
		TestVO obj = new TestVO();
		obj.setNum(9999);
		obj.setName("±è¿¬¾Æ");
		obj.setTel("010-0019-1024");
		
		model.addAttribute("vo",obj);
		
		return "test/view";
	}
	
	//@RequestMapping(value="/order",method=RequestMethod.POST)
	@PostMapping("/order")
	public ModelAndView test4(String productName, int price, String opt) {
		System.out.println("ÁÖ¹®»óÇ°Á¤º¸->"+productName+","+price+","+opt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pName",productName+"("+opt+")");
		mav.addObject("price",price);
		mav.setViewName("test/view");
		
		return mav;
	}
} 
