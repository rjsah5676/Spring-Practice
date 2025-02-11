package com.ict.myapp.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.myapp.service.DataService;
import com.ict.myapp.vo.DataVO;

@Controller
@RequestMapping("/data")
public class DataController {
	@Inject
	DataService service;
	ModelAndView mav;
	
	@GetMapping("/list")
	public ModelAndView list() {
		mav = new ModelAndView();
		mav.addObject("list", service.dataAllSelect());
		mav.setViewName("data/list");
		return mav;
	}
	
	@GetMapping("/dataWrite")
	public String dataWrite() {
		return "data/dataWrite";
	}
	@PostMapping("/test")
	public String test(MultipartFile mf) {
		System.out.println(mf.getOriginalFilename()+"!");
		return "data/dataWrite";
	}
	
	@PostMapping("/dataWriteOk")
	public ModelAndView dataWriteOk(DataVO vo,MultipartFile mf, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logid"));
		String path = session.getServletContext().getRealPath("/uploadfile");
		System.out.println(path);
		String orgFilename = mf.getOriginalFilename();
		System.out.println("!"+orgFilename);
		File file = new File(path,orgFilename);
		System.out.println(file.toString());
		if(file.exists()) {
			for(int i=1;;i++) {
				int point = orgFilename.lastIndexOf(".");
				String f = orgFilename.substring(0,point);
				String ext = orgFilename.substring(point+1);
				System.out.println("56");
				String newFilename = f+" ("+i+")."+ext;
				file= new File(path, newFilename);
				if(!file.exists()) {
					orgFilename=newFilename;
					break;
				}
			}
		}
		try {
			System.out.println("66");
			mf.transferTo(file);
		} catch(Exception e) {
			System.out.println("59");
		}
		vo.setFilename(orgFilename);
		int result=0;
		try {
			result= service.dataInsert(vo);
		} catch(Exception e) {
			e.printStackTrace();
			File f = new File(path,orgFilename);
			f.delete();
		}
		mav = new ModelAndView();
		if(result<=0) {
			mav.setViewName("bbs/result");
		} else {
			mav.setViewName("redirect:list");
		}
		return mav;
	}
	@GetMapping("/dataView")
	public ModelAndView dataView(int no) {
		mav = new ModelAndView();
		mav.addObject("vo",service.dataSelect(no));
		mav.setViewName("data/dataView");
		return mav;
	}
	@GetMapping("/dataEdit")
	public ModelAndView dataEdit(int no) {
		mav = new ModelAndView();
		mav.addObject("vo", service.dataSelect(no));
		mav.setViewName("data/dataEdit");
		
		return mav;
	}
	@PostMapping("/dataEditOk")
	public ModelAndView dataEditOk(DataVO vo, MultipartFile mf,HttpSession session) {
		String path= session.getServletContext().getRealPath("/uploadfile");
		DataVO orgVO = service.dataSelect(vo.getNo());
		if(mf!=null) {
			String orgFilename = mf.getOriginalFilename();
			File file = new File(path,orgFilename);
			orgFilename = fileRename(file,path,orgFilename);
			try {
				mf.transferTo(file);
			}catch(Exception e) {}
			vo.setFilename(orgFilename);
			
		} 
		int result = 0;
		try {
			result = service.dataUpdate(vo);
			
			if(vo.getFilename()!=null) {
				File f = new File(path,orgVO.getFilename());
				f.delete();
			}
			mav.setViewName("redirect:dataView?no="+vo.getNo());
		} catch(Exception e) {
			if(vo.getFilename()!=null) {
				File f = new File(path,vo.getFilename());
				f.delete();
			}
			mav.setViewName("bbs/result");
		}
		return mav;
	}
	public String fileRename(File file, String path, String orgFilename) {
		if(file.exists()) {
			for(int i=1;;i++) {
				int point = orgFilename.lastIndexOf(".");
				String f = orgFilename.substring(0,point);
				String ext = orgFilename.substring(point+1);
				System.out.println("56");
				String newFilename = f+" ("+i+")."+ext;
				file= new File(path, newFilename);
				if(!file.exists()) {
					orgFilename=newFilename;
					break;
				}
			}
		}
		return orgFilename;
	}
}
