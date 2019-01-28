package top.tomxwd.pms.service.sysuser;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.vo.MsgObj;
import top.tomxwd.pms.vo.PageObj;

public interface SysuserService {
	/**
	 * 用户登录，若验证码不正确，直接返回MsgObj对象，正确再进行下一步的账号密码校验
	 * @param user 用户对象
	 * @param verifyCode 用户输入的验证码
	 * @param req 获取session中"rand"的值，用于比对用户输入的验证码
	 * @param resp 将用户信息放入到cookie中存储
	 * @return 0为失败，1为成功 
	 */
	public MsgObj login(Sysuser user,String verifyCode,HttpServletRequest req,HttpServletResponse resp);
	
	public List<Sysuser> sysuserList(PageObj<Sysuser> pageObj);
}
