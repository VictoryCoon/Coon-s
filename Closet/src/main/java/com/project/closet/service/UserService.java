package com.project.closet.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.project.closet.dto.UserDto;

public interface UserService {
	
	public UserDto viewUser(UserDto dto);
	
	public boolean signIn(UserDto dto, HttpSession session);
	
	public void signOut(HttpSession session);

	public boolean signUp(UserDto dto);

	public boolean updatePassword(UserDto dto);

	public boolean updateMobile(UserDto dto, HttpSession session);

	public boolean userDrop(UserDto dto);
	
}
