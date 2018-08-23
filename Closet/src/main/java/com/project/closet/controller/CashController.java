package com.project.closet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CashController {

	@RequestMapping("/cash/policy")
	public String policy(Model model) {
		return "cash/policy";
	}
	
}
