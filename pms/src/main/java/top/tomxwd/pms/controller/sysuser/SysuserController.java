package top.tomxwd.pms.controller.sysuser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.service.sysuser.SysuserService;
import top.tomxwd.pms.vo.MsgObj;
import top.tomxwd.pms.vo.PageObj;

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
	public List<Sysuser> sysuserList(PageObj<Sysuser> pageObj){
		System.out.println(pageObj);
		List<Sysuser> cell = service.sysuserList(pageObj);
		return cell;
	}
	
}
