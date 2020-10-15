package com.ff.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.model.User;
import com.ff.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	@RequestMapping("login")
	public String login(User user,HttpServletRequest req,HttpServletResponse resp){
		User user2 = userService.login(user);
		System.out.println(user2);
		req.getSession().setAttribute("USER", user2);
		return "1";
	}
	
	@RequestMapping("userShow")
	public String show(@RequestParam(value="n",defaultValue="1")int n,HttpServletRequest req,HttpServletResponse resp){
		
		PageHelper.startPage(n, 3);
		String name = req.getParameter("name");
		req.setAttribute("name", name);
		
		List<User> list = userService.selectAll(name);
		req.setAttribute("list", list);
		PageInfo<User> info = new PageInfo<User>(list,5);
		req.setAttribute("pageInfo", info);
		
		return "show";
	}
	
	@RequestMapping("userAlter")
	public String alter(HttpServletRequest req,HttpServletResponse resp){
		String string = req.getParameter("userId");
		int id = Integer.valueOf(string);
		
		User user = userService.selectByPrimaryKey(id);
		System.out.println(user);
		req.setAttribute("one", user);
		return "alter";
	}
	
	@RequestMapping("userUpdate")
	public String update(User user,HttpServletRequest req,HttpServletResponse resp){
		
		userService.updateByPrimaryKey(user);
		
		return "forward:userShow";
	}
	
	@RequestMapping("userDelete")
	public String delete(HttpServletRequest req,HttpServletResponse resp){
		String string = req.getParameter("userId");
		int id = Integer.valueOf(string);
		userService.deleteByPrimaryKey(id);
		
		return "forward:userShow";
	}
	
	@RequestMapping("userAdd")
	public String delete(User user,HttpServletRequest req,HttpServletResponse resp){
		userService.insert(user);
		
		return "forward:userShow";
	}
	
	
}
