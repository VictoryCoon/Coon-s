package com.project.closet.serviceImpl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.closet.dao.UserDao;
import com.project.closet.dto.UserDto;
import com.project.closet.service.UserService;

@Repository
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public boolean signUp(UserDto dto) {
		System.out.println("UserService signUp dto : "+dto);
		boolean result = userDao.signUp(dto);
		return result;
	}
	
	@Override
	public boolean signIn(UserDto dto, HttpSession session) {
		System.out.println("UserService signIn dto : "+dto);
		boolean result = userDao.signIn(dto);
		System.out.println("UserService result : "+result);
		if(result) {
			UserDto sDto = viewUser(dto);
			session.setAttribute("userId", sDto.getUserId());
			session.setAttribute("userName", sDto.getUserName());
			session.setAttribute("userPw", sDto.getUserPw());
			session.setAttribute("mobile", sDto.getMobile());
			session.setAttribute("address", sDto.getAddress());
			session.setAttribute("cash", sDto.getCash());
			session.setAttribute("cashAccAmt", sDto.getCashAccAmt());
			session.setAttribute("cashLastDate", sDto.getCashLastDate());
			session.setAttribute("loginId", sDto.getLoginId());
			session.setAttribute("bankCd", sDto.getBankCd());
			session.setAttribute("bankName", sDto.getBankName());
			session.setAttribute("closetCd", sDto.getClosetCd());
			session.setAttribute("closetName", sDto.getClosetName());
			System.out.println("Session : " + session);
		}
		return result;
	}

	@Override
	public void signOut(HttpSession session) {
		session.invalidate();
	}

	@Override
	public UserDto viewUser(UserDto dto) {
		return userDao.viewUser(dto);
	}

	@Override
	public boolean updatePassword(UserDto dto) {
		System.out.println("Service UpPasswd : " + dto.getUserPw());
		boolean result = userDao.updatePassword(dto);
		return result;
	}

	@Override
	public boolean updateMobile(UserDto dto, HttpSession session) {
		System.out.println("Service UpMoblie : " + dto.getMobile());
		boolean result = userDao.updateMobile(dto);
		if(result) {
			UserDto sDto = viewUser(dto);
			session.setAttribute("mobile", sDto.getMobile());
		}
		return result;
	}

	@Override
	public boolean userDrop(UserDto dto) {
		System.out.println("Service Drop User : " + dto.getUserPw());
		boolean result = userDao.userDrop(dto);
		
		return result;
	}

}
