package com.pknu.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {

	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "/users/loginForm";
	}
	
	@RequestMapping("/AssignForm")
	public String assignForm() {
		return "/users/assignForm";
	}
	
	
}
