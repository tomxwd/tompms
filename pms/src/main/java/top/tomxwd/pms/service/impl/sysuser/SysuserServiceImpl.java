package top.tomxwd.pms.service.impl.sysuser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import top.tomxwd.pms.vo.QueryObj;
import top.tomxwd.pms.vo.sysuser.SysuserQueryObj;

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
	public PageObj<Sysuser> sysuserList(PageObj<Sysuser> pageObj,SysuserQueryObj queryObj) {
		queryObj.init(pageObj.getPage(),pageObj.getRows());
		//记录
		pageObj.setRoot(mapper.sysuserList(queryObj));
		//总条数
		pageObj.setRecords(mapper.sysuserListCount(queryObj));
		//计算总页数
		pageObj.calcTotal();
		return pageObj;
	}

	@Override
	public boolean checkUnameExist(String uname) {
		SysuserExample example = new SysuserExample();
		example.createCriteria().andUnameEqualTo(uname);
		List<Sysuser> list = mapper.selectByExample(example);
		if(list.size()==0) {
			return true;
		}
		return false;
	}

	@Override
	public MsgObj addUser(Sysuser user) {
		int i = mapper.insertSelective(user);
		if(0==i) {
			return new MsgObj(0, "添加用户失败");
		}
		return new MsgObj(1,"添加用户成功");
	}

	@Override
	public Sysuser findSysuserById(Integer id) {
		Sysuser sysuser = mapper.selectByPrimaryKey(id);
		sysuser.setPwd("");
		return sysuser;
	}

	
}
