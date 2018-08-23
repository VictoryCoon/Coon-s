package com.project.closet.dao;

import javax.servlet.http.HttpSession;

import com.project.closet.dto.UserDto;

public interface UserDao {

	public UserDto viewUser(UserDto dto);
	public boolean signUp(UserDto dto);
	public boolean signIn(UserDto dto);
	public void signOut(HttpSession session);
	public boolean updatePassword(UserDto dto);
	public boolean updateMobile(UserDto dto);
	public boolean userDrop(UserDto dto);
}
