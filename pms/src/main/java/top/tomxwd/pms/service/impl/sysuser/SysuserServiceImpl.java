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

	@Override
	public MsgObj deleteUser(Integer id) {
		int key = mapper.deleteByPrimaryKey(id);
		System.out.println(key);
		MsgObj msgObj = new MsgObj();
		if(key==0) {
			msgObj.setOk(0);
			msgObj.setMsg("删除失败，请稍后再试！");
		}else {
			msgObj.setOk(1);
			msgObj.setMsg("删除成功！");
		}
		return msgObj;
	}

	@Override
	public MsgObj dimissOrRestore(Integer id, Integer status) {
		MsgObj msg = new MsgObj();
		if(status==1) {
			//执行离职
			Sysuser user = new Sysuser();
			user.setId(id);
			user.setDelstatus(0);
			int i = mapper.updateByPrimaryKeySelective(user);
			if(i==1) {
				msg.setOk(1);
				msg.setMsg("离职成功！");
			}else {
				msg.setOk(0);
				msg.setMsg("系统故障，离职失败！");
			}
		}else {
			//执行复职
			Sysuser user = new Sysuser();
			user.setId(id);
			user.setDelstatus(1);
			int i = mapper.updateByPrimaryKeySelective(user);
			if(i==1) {
				msg.setOk(1);
				msg.setMsg("复职成功！");
			}else {
				msg.setOk(0);
				msg.setMsg("系统故障，复职失败！");
			}
		}
		return msg;
	}

	
}
