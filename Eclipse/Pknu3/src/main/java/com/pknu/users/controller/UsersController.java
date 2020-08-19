package com.pknu.users.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pknu.users.service.UsersService;
import com.pknu.users.vo.UsersVo;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;

	@RequestMapping("/LoginForm")
	public ModelAndView loginForm(UsersVo vo) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/users/loginForm");
		mv.addObject("pop", vo.getPop());
		return mv;
	}


	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, @RequestParam HashMap<String, Object> map) {
		String returnURL = "";

		if (map.get("mid") == "") {
			returnURL = "redirect:/LoginForm?pop=noid";
		} else if (map.get("mpwd") == "") {
			returnURL = "redirect:/LoginForm?pop=nopwd";
		} else {
			if (session.getAttribute("login") != null) {
				session.removeAttribute("login");
			}
			UsersVo vo = usersService.login(map);
			if (vo != null) {
				session.setAttribute("login", vo);
				returnURL = "redirect:/";
			} else {
				returnURL = "redirect:/LoginForm?pop=nocorrect";
			}
		}
		return returnURL;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/GetIdForm")
	public String getIdForm() {
		return "/users/getIdForm";
	}

	@RequestMapping("/getId")
	public ModelAndView getId(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		UsersVo vo = usersService.findId(map);
		if (vo != null) {
			mv.addObject("mid", vo.getMid());
			System.out.println(vo.getMid());
		}
		mv.addObject("count", "1");
		mv.setViewName("/users/getIdForm");
		return mv;
	}

	@RequestMapping("/GetPwdForm")
	public String getPwdForm() {
		return "/users/getPwdForm";
	}

	@RequestMapping("/getPwd")
	public ModelAndView getPwd(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		UsersVo vo = usersService.findPwd(map);
		if (vo != null) {
			mv.addObject("mpwd", vo.getMpwd());
		}
		mv.addObject("count", "1");
		mv.setViewName("/users/getPwdForm");
		return mv;
	}

	@RequestMapping("/myTicket")
	public ModelAndView myTicket(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<UsersVo> ticketList = usersService.getTicket(map);
		
		mv.addObject("ticket", ticketList);
		mv.setViewName("/users/myTicketForm");
		System.out.println("controller"+mv);
		
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/idChk",method = RequestMethod.POST)
	public HashMap<String, Object> idChk(@RequestBody HashMap<String, Object> map ) {
	
		UsersVo vo=usersService.getCount(map);
		map.put("count",vo.getCount() );
		System.out.println(map);
		return map ;
	}
	
	@RequestMapping("/AssignForm")
	public String assignForm() {
		return "/users/assignForm";
	}

	@RequestMapping(value="/assign",method = RequestMethod.POST)
	public String assign(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		usersService.setMember(map);
		return "home";
	}
	
}
