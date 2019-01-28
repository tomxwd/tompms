package top.tomxwd.pms.service.impl.sysuser;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import top.tomxwd.pms.mapper.sysuser.SysuserMapper;
import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.pojo.sysuser.SysuserExample;
import top.tomxwd.pms.pojo.sysuser.SysuserExample.Criteria;
import top.tomxwd.pms.service.sysuser.SysuserService;
import top.tomxwd.pms.utils.CookieUtils;
import top.tomxwd.pms.vo.MsgObj;
import top.tomxwd.pms.vo.PageObj;

@Service
public class SysuserServiceImpl implements SysuserService {
	@Autowired
	private SysuserMapper mapper;
	
	
	@Override
	public MsgObj login(Sysuser user, String verifyCode, HttpServletRequest req,HttpServletResponse resp) {
		String rand = req.getSession().getAttribute("rand").toString();
		MsgObj msgObj = new MsgObj(0, "用户名或密码错误");
		if(rand!=null&&rand.toUpperCase().equals(verifyCode.toUpperCase())) {
			SysuserExample example = new SysuserExample();
			example.createCriteria().andUnameEqualTo(user.getUname());
			List<Sysuser> list = mapper.selectByExample(example);
			if(!list.isEmpty()) {
				Sysuser sysUser = list.get(0);
				if(sysUser==null) {
					return msgObj;
				}else {
					String pwd = sysUser.getPwd();
					if(user.getPwd().equals(pwd)) {
						msgObj.setOk(1);
						msgObj.setMsg("登录成功");
						sysUser.setPwd("");//需要将用户密码设为空再放入到cookie中去
						String sysuser_Json = JSON.toJSONString(sysUser);
						CookieUtils.setCookie(req, resp, "current_user", sysuser_Json, 259200, true);//保存3天
						return msgObj;
					}
				}
			}else {
				return msgObj;
			}
		}else {
			msgObj.setMsg("验证码错误，请重新输入");
			return msgObj;
		}
		return msgObj;
	}

	@Override
	public List<Sysuser> sysuserList(PageObj<Sysuser> pageObj) {
		pageObj.setPage(pageObj.getPage()-1);
		List<Sysuser> sysuserList = mapper.sysuserList(pageObj);
		return sysuserList;
	}

	
}
