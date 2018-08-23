package com.project.closet.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.closet.dto.UserDto;
import com.project.closet.service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("info")
	public String info(Model model) {
		return "user/myInfo";
	}
	
	@RequestMapping("drop")	// 회원탈퇴는 myInfo페이지에서 이동
	public String drop(Model model) {
		return "user/myDrop";
	}
	
	@RequestMapping("signUp.do")
	public ModelAndView signUp(@ModelAttribute UserDto dto) {
		System.out.println("SignUp.do");
		
		boolean result = userService.signUp(dto);
		System.out.println("SignUp.do result :" + result);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.addObject("msg","Success");
			mav.setViewName("main");
			System.out.println("SignUp Success");
		} else {
			mav.addObject("msg","Failure");
			mav.setViewName("main");
			System.out.println("SignUp Failure");
		}
		return mav;
	}

	@RequestMapping("signIn.do")
	public ModelAndView signIn(@ModelAttribute UserDto dto, HttpSession session) {
		boolean result = userService.signIn(dto, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.addObject("msg","안녕하세요, "+ session.getAttribute("userName") + "님. 즐거운 시간 보내세요.");
			mav.setViewName("main");
		} else {
			mav.addObject("msg","로그인에 실패하였습니다. 아이디 또는 비밀번호를 확인 해 주세요.");
			mav.setViewName("main");
		}
		return mav;
	}

	@RequestMapping("signOut.do")
	public ModelAndView signOut(HttpSession session) {
		userService.signOut(session);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","로그아웃 되었습니다.");
		mav.setViewName("main");

		return mav;
	}
	
	@RequestMapping("updatePassword.do")
	public ModelAndView updatePassword(@ModelAttribute UserDto dto, HttpSession session) {
		
		System.out.println("UpPasswd : " + dto.getUserPw());
		
		ModelAndView mav = new ModelAndView();
		
		boolean result = userService.updatePassword(dto);
		
		if(result == true) {
			mav.addObject("msg","비밀번호가 변경되었습니다. 다시 로그인 해 주세요.");
			mav.setViewName("main");
			userService.signOut(session);
		} else {
			mav.addObject("msg","비밀번호 변경실패, 입력된 정보를 다시 한 번 확인해 주세요.");
			mav.setViewName("user/myInfo");
		}
		
		return mav;
	}
	
	@RequestMapping("updateMobile.do")
	public ModelAndView updateMobile(@ModelAttribute UserDto dto, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("UpMobile : " + dto.getMobile());
		
		boolean result = userService.updateMobile(dto, session);
		
		if(dto.getMobile() == "" || dto.getMobile() == null) {
			mav.setViewName("user/myInfo");
			mav.addObject("msg","변경하실 휴대폰 번호를 입력 해 주세요.");
		} else {
			if(result == true) {
				mav.setViewName("user/myInfo");
				mav.addObject("msg","휴대폰번호 변경이 완료되었습니다.");
				System.out.println("Mobile Update Success");
			} else {
				mav.setViewName("user/myInfo");
				mav.addObject("msg","휴대폰번호 변경에 실패했습니다. 계속해서 변경을 실패하실 경우 XXX-XXXX-XXXX로 문의하시기 바랍니다.");
				System.out.println("Mobile Update  Failure");
			}
		}

		return mav;
	}
	
	@RequestMapping("userDrop.do")
	public ModelAndView userDrop(@ModelAttribute UserDto dto, HttpSession session) {
		
		System.out.println("User Drop 1 : " + dto.getUserPw());
		System.out.println("User Drop 2 : " + dto.getRemark());
		
		ModelAndView mav = new ModelAndView();
		
		boolean result = userService.userDrop(dto);
		
		if(result == true) {
			mav.addObject("msg","회원탈퇴가 완료되었습니다. 그 동안 저희 서비스를 이용해주셔서 감사합니다.");
			mav.setViewName("user/myInfo");
			System.out.println("Password Update Success");
			userService.signOut(session);
		} else {
			mav.addObject("msg","회원탈퇴에 실패했습니다. 입력된 정보를 다시 한 번 확인하시기 바랍니다.");
			mav.setViewName("user/myInfo");
			System.out.println("Password Update Failure");
		}
		
		return mav;
	}
}
