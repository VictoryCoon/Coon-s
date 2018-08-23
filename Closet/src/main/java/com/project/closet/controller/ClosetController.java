package com.project.closet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClosetController {

	@RequestMapping("/closet/myCloset")
	public String stock() {
		return "closet/myCloset";
	}
	
}
