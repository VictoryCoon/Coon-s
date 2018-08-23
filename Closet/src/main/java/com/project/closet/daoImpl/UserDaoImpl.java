package com.project.closet.daoImpl;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.closet.dao.UserDao;
import com.project.closet.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public boolean signUp(UserDto dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("SP_User_Name", dto.getUserName());
		map.put("SP_Birthday", dto.getBirthday());
		map.put("SP_Birth_Kind", "S");
		map.put("SP_Login_Id", dto.getLoginId());
		map.put("SP_User_Pw", dto.getUserPw());
		map.put("SP_Mobile", dto.getMobile());
		
		System.out.println("UserDAO Dto Name : "+dto.getUserName());
		System.out.println("UserDAO Dto Password : "+dto.getUserPw());
		System.out.println("UserDAO Dto LoginId : "+dto.getLoginId());
		System.out.println("UserDAO Dto BirthDay : "+dto.getBirthday());
		System.out.println("UserDAO Dto Mobile : "+dto.getMobile());
		System.out.println("Maps Pre : " + map);
		
		sqlSessionTemplate.selectOne("userIns", map);
		
		System.out.println("Maps Aft : " + map);
		
		
		String returnCode = "";
	
		return (returnCode != "1") ? false : true; 
	}
	
	@Override
	public boolean signIn(UserDto dto) {
		String name = sqlSession.selectOne("signIn", dto);
		System.out.println("UserDAO Name : "+name);
		return (name == null) ? false : true;
	}

	@Override
	public UserDto viewUser(UserDto dto) {
		return sqlSession.selectOne("viewUser", dto);
	}

	@Override
	public void signOut(HttpSession session) { }

	@Override
	public boolean updatePassword(UserDto dto) {
		
		int update = 0;
		
		update = sqlSession.update("updatePassword", dto);
		System.out.println("UserDAO Dto updatePassword : "+dto.getUserPw());
		
		return (update != 0) ? true : false;
	}

	@Override
	public boolean updateMobile(UserDto dto) {
		
		int update = 0;
		
		update = sqlSession.update("updateMobile", dto);
		System.out.println("UserDAO Dto updateYn : "+update);
		return (update != 0) ? true : false;
	}

	@Override
	public boolean userDrop(UserDto dto) {
		int update = 0;
		
		update = sqlSession.update("userDrop", dto);
		System.out.println("UserDAO Dto userDrop : "+update);
		return (update != 0) ? true : false;
	}
}
