package com.spring.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/kwi")
	public String test_kwi() {
		return "kwi_test";
	}
	
<<<<<<< HEAD
	@RequestMapping("/cdw")
	public String test_kwi() {
		return "cdw_test";
=======
	@RequestMapping("/ary")
	public String test_ary() {
		return "ary_test";
>>>>>>> 67ef550c31f868913c2868ddb0b043985ace28ab
	}

}
