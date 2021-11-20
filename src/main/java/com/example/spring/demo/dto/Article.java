package com.example.spring.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
	private int id;
	private String regDate;
	private String title;
	private String body;
	
	public String getbodyForPrint() {
		return body.replaceAll("\n", "<br>");
	}
}
