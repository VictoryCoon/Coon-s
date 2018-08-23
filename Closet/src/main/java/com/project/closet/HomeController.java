package com.project.closet;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.closet.service.UserService;
import com.project.closet.util.FileService;
import com.project.closet.util.FileUtil;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about/about";
	}
	
	@RequestMapping(value = "/file/upload.do", method = RequestMethod.POST)
	public String addFileCtrl(@RequestParam("uploadFile") MultipartFile uploadFile, MultipartHttpServletRequest request, Object obj) {	// 오브젝트로 대체중. 시발.
		
		System.out.println("FileUpload Controller UploadFile : " + uploadFile);
		
		FileUtil uFile = new FileUtil();
		
		String uploadPath = uFile.fileUpload(request, uploadFile, obj);
		
		int num = FileService.addFile(uploadPath, obj);
		
		System.out.println("FileUpload Controller UploadFile num : " + num);
		System.out.println("FileUpload Controller UploadFile path : " + uploadPath);
		
		return "closet/myCloset";
	}
}
