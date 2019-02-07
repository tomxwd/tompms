package top.tomxwd.pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PageController {
	
	//去登录页面
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "sysuser/login";
	}
	
	//去主页
	@RequestMapping("/toIndex")
	public String toIndex() {
		return "index";
	}
	
	//去添加用户界面
	@RequestMapping("/sysuser/toAddUser")
	public String toAddUser() {
		return "sysuser/adduser";
	}
	
	//去用户列表界面
	@RequestMapping("/sysuser/list")
	public String toSysuserList() {
		return "sysuser/list";
	}
	
	//去用户列表界面
	@RequestMapping("/sysuser/toUserList")
	public String toUserList() {
		return "sysuser/userlist";
	}
	
	
}
