package top.tomxwd.pms.controller.sysuser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.service.sysuser.SysuserService;
import top.tomxwd.pms.vo.MsgObj;
import top.tomxwd.pms.vo.PageObj;
import top.tomxwd.pms.vo.QueryObj;
import top.tomxwd.pms.vo.sysuser.SysuserQueryObj;

@Controller
@RequestMapping("/sysuser")
public class SysuserController {
	@Autowired
	private SysuserService service;
	
	@RequestMapping("/login")
	@ResponseBody
	public MsgObj login(Sysuser user,String verify,HttpServletRequest req,HttpServletResponse resp) {
		MsgObj msgObj = service.login(user, verify, req, resp);
		return msgObj; 
	}
	
	@RequestMapping("/sysuserlist")
	@ResponseBody
	public PageObj<Sysuser> sysuserList(PageObj<Sysuser> pageObj,SysuserQueryObj queryObj){
		return service.sysuserList(pageObj,queryObj);
	}
	
	@RequestMapping("/checkuname")
	@ResponseBody
	public boolean checkUname(String uname) {
		boolean exist = service.checkUnameExist(uname);
		return exist;
	}
	
	@RequestMapping(value="/adduser",method=RequestMethod.POST)
	@ResponseBody
	public MsgObj addUser(Sysuser user) {
		MsgObj msgObj = service.addUser(user);
		return msgObj;
	}
	
	@RequestMapping(value="/info",method=RequestMethod.GET)
	@ResponseBody
	public Sysuser sysuserInfo(Integer id) {
		Sysuser user = service.findSysuserById(id);
		return user;
	}
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	@ResponseBody
	public PageObj<Sysuser> searchList(PageObj<Sysuser> pageObj,SysuserQueryObj queryObj){
		PageObj<Sysuser> sysuserList = service.sysuserList(pageObj, queryObj);
		return null;
	}
	
}
