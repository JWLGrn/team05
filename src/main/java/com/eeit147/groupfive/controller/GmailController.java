package com.eeit147.groupfive.controller;

import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Controller
@SessionAttributes({"verificationCode","userGet"} )
public class GmailController {

@Autowired	
private JavaMailSender  mailSender;

@Autowired
private UsersDao uDao;
	
    //接收使用者信箱，發送信件和驗證碼
    @PostMapping("/users/send/email")
	public String sendSimpleMail(@RequestParam("email") String email,Model model) throws Exception {
    	//亂數碼
    	StringBuilder verificationCode= new StringBuilder();
    	Random randomNumber = new Random();
    	 for (int i = 0; i < 6; i++) {
    		 verificationCode.append(randomNumber.nextInt(10));
    		  }
    	 System.out.println(verificationCode);
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setFrom("stu60406666@gmail.com");
	        message.setTo(email);
	        message.setSubject("主旨：I-Cook 歡迎您");
	        message.setText("很高興歡迎您，這是您的驗證碼"+verificationCode);
	        mailSender.send(message);
	        Users userEmail = uDao.findByemail02(email);
	        System.out.println(userEmail+"=========================================");
	         Integer userId = ((Users) userEmail).getUserId();
	         System.out.println(userId);
	         Optional<Users> user = uDao.findById(userId);
	         Users userGet = user.get();	       
	        model.addAttribute("userGet", userGet);
	        model.addAttribute("message", message);
	        model.addAttribute("verificationCode",verificationCode);
	        //需要導入首頁
	        return "email/confirmmail";
	    }
    //確認驗證碼是否相同
    @PostMapping("/users/confirm/email")
    public String confirm(@RequestParam("code") String code,Model model) {
    	
    	StringBuilder verificationCode =(StringBuilder) model.getAttribute("verificationCode");
    	String vCode = verificationCode.toString();
    	if(vCode.equals(code)) {
    		return "index";
    	}
    	//需要登入失敗的頁面
    	return "index"; 
    	
    }
}









