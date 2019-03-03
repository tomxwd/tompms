package top.tomxwd.pms.service.sysuser;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.vo.MsgObj;
import top.tomxwd.pms.vo.PageObj;
import top.tomxwd.pms.vo.QueryObj;
import top.tomxwd.pms.vo.sysuser.SysuserQueryObj;

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
	
	public PageObj<Sysuser> sysuserList(PageObj<Sysuser> pageObj,SysuserQueryObj queryObj);
	
	/**
	 * 查找用户名是否已经存在，不存在则返回false
	 * @param uname
	 */
	public boolean checkUnameExist(String uname);
	
	/**
	 * 添加新用户
	 * @param user
	 * @param headImg 
	 * @return
	 */
	public MsgObj addUser(Sysuser user, MultipartFile[] headImg);
	
	/**
	 * 根据id查用户信息
	 * @param id 用户id
	 * @return
	 */
	public Sysuser findSysuserById(Integer id);
	
	/**
	 * 根据id删除用户信息
	 * @param id
	 * @return
	 */
	public MsgObj deleteUser(Integer id);
	
	/**
	 * 根据用户id以及状态离职或复职
	 * @param id
	 * @param status
	 * @return
	 */
	public MsgObj dimissOrRestore(Integer id,Integer status);
	
	/**
	 * 编辑用户
	 * @param user
	 * @return
	 */
	public MsgObj updateUser(Sysuser user);
	
	/**
	 * 一次性加载jsTree数据
	 * @return
	 */
	public List<Map<String, Object>> oneJsTree();

	/**
	 * 懒加载jsTree数据
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> lazyJsTree(String id);
	
	/**
	 * 添加树节点
	 * @param text
	 * @param parent_id
	 * @return
	 */
	public MsgObj addTree(String text, Integer parent_id);
}
