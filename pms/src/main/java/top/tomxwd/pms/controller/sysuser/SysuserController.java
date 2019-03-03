package top.tomxwd.pms.controller.sysuser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public MsgObj addUser(@RequestParam Sysuser user,@RequestParam MultipartFile[] headImg) {
		System.out.println(user);
		System.out.println(headImg);
		MsgObj msgObj = service.addUser(user,headImg);
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
	
	@RequestMapping(value="/showInfo",method=RequestMethod.GET)
	@ResponseBody
	public Sysuser showInfo(Integer id) {
		Sysuser sysuser = service.findSysuserById(id);
		return sysuser;
	}
	
	@RequestMapping(value="/deleteUser",method=RequestMethod.GET)
	@ResponseBody
	public MsgObj deleteUser(Integer id) {
		MsgObj msgObj = service.deleteUser(id);
		return msgObj;
	}
	
	@RequestMapping(value="/dimissOrRestore",method=RequestMethod.GET)
	@ResponseBody
	public MsgObj dimissOrRestore(Integer id,Integer delstatus) {
		MsgObj msgObj = service.dimissOrRestore(id, delstatus);
		return msgObj;
	}
	
	@RequestMapping(value="/edituser",method=RequestMethod.POST)
	@ResponseBody
	public MsgObj edituser(Sysuser user) {
		return service.updateUser(user);
	}
	
	@RequestMapping(value="/oneJsTree",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> oneJsTree(){
		return service.oneJsTree();
	}
	
	@RequestMapping(value="/lazyJsTree",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> lazyJsTree(String id){
		return service.lazyJsTree(id);
	}
	
	@RequestMapping(value="/addTree",method=RequestMethod.POST)
	@ResponseBody
	public MsgObj addTree(String text,Integer parent_id) {
		return service.addTree(text,parent_id);
	}
	
	@RequestMapping(value="/fileUpLoadTest",method=RequestMethod.POST)
	@ResponseBody
	public MsgObj fileUpLoadTest(HttpServletRequest req) {
		//判断req是否合法，表单为Post，contentType必须为multipart/开头
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if(isMultipart) {
			try {
				//创建一个处理FileItem的工程对象，可以处理基本磁盘（不能处理文件上传）
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				//设置图片缓存大小 单位字节 5M
				factory.setSizeThreshold(5*1024*1024);
				//自定义缓存临时目录
				factory.setRepository(new File(""));
				
				
				//创建一个新的文件上传处理器（基于基本的工厂对象）：装饰者（包装）设计模式
				ServletFileUpload fileUpload = new ServletFileUpload(factory);
				
				//文件大小约束  一次请求中的文件大小约束
				fileUpload.setSizeMax(10*1024*1024);
				//单个文件的大小约束 5M
				fileUpload.setFileSizeMax(5*1024*1024);
				
				//解析请求
				List<FileItem> list = fileUpload.parseRequest(req);
				for (FileItem item : list) {
					if(item.isFormField()) {
						//普通表单元素
						String value = item.getString("utf-8");
					}else {
						//文件上传
						//System.out.println("file:"+item);
						//获取文件的名称
						String name = item.getName();
						String extension = FilenameUtils.getExtension(name);
						//用UUID来生成32位随机数，全球唯一
						String targetName = ("tomxwd"+UUID.randomUUID().toString()+"."+extension).replaceAll("-", "");
						//获取文件的输入流
						InputStream inputStream = item.getInputStream();
						//确定磁盘上是否有这个路径文件夹
						File target = new File("/Users/xieweicong/Desktop/上传文件");
						if(!target.exists()) {
							target.mkdir();
						}
						
						//创建一个输出流
						FileOutputStream outputStream = new FileOutputStream(new File(target,targetName));
						//将流保存到另一个位置
						int copy = IOUtils.copy(inputStream, outputStream);
						System.out.println("成功");
					}
				}
				
			} catch (FileSizeLimitExceededException e) {
				//单个文件过大
				System.out.println("单个文件过大");
			} catch (SizeLimitExceededException e) {
				//所有文件过大
				System.out.println("所有文件过大");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		return null;
	}
	
}
