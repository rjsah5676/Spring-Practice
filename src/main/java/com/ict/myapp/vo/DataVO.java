package com.ict.myapp.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataVO {
	private int no;
	private String subject;
	private String content;
	private String userid;
	private int hit;
	private String writedate;
	//private MultipartFile mf;
	private String filename;
}
