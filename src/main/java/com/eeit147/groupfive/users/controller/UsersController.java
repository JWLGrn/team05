package com.eeit147.groupfive.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService UService;

	@PostMapping("/insertUser")
	public String InsertUser(@RequestParam("user_name") String user_name, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("permission") Integer permission,
			Model model) {
		Users newuser = new Users();
		newuser.setUserName(user_name);
		newuser.setEmail(email);
		newuser.setPassword(password);
		newuser.setPermission(permission);
		UService.insertUser(newuser);
		System.out.println(newuser);

		model.addAttribute("newUser", newuser);
		return "SuccessUser";
	}
	
	@GetMapping("/findAll")
	public String FindAllUsers(Model m) {
		List<Users> findUser = UService.findAllUsers();
		m.addAttribute("allUsers",findUser);
		return "showAllUsers123";
	}

}
