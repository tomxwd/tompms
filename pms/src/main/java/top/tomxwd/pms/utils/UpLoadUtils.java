package top.tomxwd.pms.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import top.tomxwd.pms.vo.MsgObj;

public class UpLoadUtils {
	
	/**
	 * 传入一个位置，以及需要上传的文件
	 * @param headFiles
	 * @return
	 */
	public static String[] UpLoadFile(String savePath,MultipartFile[] headFiles) {
//		String savePath = ""+System.getProperty("user.dir")+"/src/main/webapp/resources/upload";
		String[] nameArray = new String[headFiles.length];
		// 创建一个磁盘目录用于保存文件
		File destFile = new File(savePath);
		if (!destFile.exists()) {
			destFile.mkdir();
		}
		for (int i = 0; i < headFiles.length; i++) {
			MultipartFile headFile = headFiles[i];
			// 使用uuid作为文件随机名称
			String fileName = UUID.randomUUID().toString().replaceAll("-", "");
			// 使用FileNameUtils获取上传文件名的后缀
			String extension = FilenameUtils.getExtension(headFile.getOriginalFilename());// jpg , png 等等
			if(extension.equals("")) {
				continue;
			}
			// 创建新的文件名称
			String newFileName = "tomxwd"+fileName + "." + extension;
			// 创建要保存文件的File对象
			File file = new File(destFile, newFileName);
			// 保存文件到本地磁盘
			try {
				headFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			nameArray[i]=newFileName;
		}
		return nameArray;
	}
	
	
	/**
	 * 单个文件上传
	 */
	public static String UpLoadFile(String savePath,MultipartFile headFile) {
//		String savePath = ""+System.getProperty("user.dir")+"/src/main/webapp/";
		String newFileName =null;
		/*String[] nameArray = new String[headFile.length];*/
		// 创建一个磁盘目录用于保存文件
		File destFile = new File(savePath);
		if (!destFile.exists()) {
			destFile.mkdir();
		}
			// 使用uuid作为文件随机名称
			String fileName = "tomxwd"+UUID.randomUUID().toString().replaceAll("-", "");
			// 使用FileNameUtils获取上传文件名的后缀
			String extension = FilenameUtils.getExtension(headFile.getOriginalFilename());// jpg , png 等等
	
			// 创建新的文件名称
			 newFileName = fileName + "." + extension;
			// 创建要保存文件的File对象
			File file = new File(destFile, newFileName);
			// 保存文件到本地磁盘
			try {
				headFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
		return newFileName;
	}
	
	
//	@RequestMapping(value="/fileUpLoadTest",method=RequestMethod.POST)
//	@ResponseBody
//	public MsgObj fileUpLoadTest(HttpServletRequest req) {
//		//判断req是否合法，表单为Post，contentType必须为multipart/开头
//		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
//		if(isMultipart) {
//			try {
//				//创建一个处理FileItem的工程对象，可以处理基本磁盘（不能处理文件上传）
//				DiskFileItemFactory factory = new DiskFileItemFactory();
//				//创建一个新的文件上传处理器（基于基本的工厂对象）：装饰者（包装）设计模式
//				ServletFileUpload fileUpload = new ServletFileUpload(factory);
//				//解析请求
//				List<FileItem> list = fileUpload.parseRequest(req);
//				for (FileItem item : list) {
//					if(item.isFormField()) {
//						//普通表单元素
//						String value = item.getString("utf-8");
//					}else {
//						//文件上传
//						//System.out.println("file:"+item);
//						//获取文件的名称
//						String name = item.getName();
//						String extension = FilenameUtils.getExtension(name);
//						//用UUID来生成32位随机数，全球唯一
//						String targetName = ("tomxwd"+UUID.randomUUID().toString()+"."+extension).replaceAll("-", "");
//						//获取文件的输入流
//						InputStream inputStream = item.getInputStream();
//						//确定磁盘上是否有这个路径文件夹
//						File target = new File("/Users/xieweicong/Desktop/上传文件");
//						if(!target.exists()) {
//							target.mkdir();
//						}
//						
//						//创建一个输出流
//						FileOutputStream outputStream = new FileOutputStream(new File(target,targetName));
//						//将流保存到另一个位置
//						int copy = IOUtils.copy(inputStream, outputStream);
//					}
//				}
//				
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//		}
//		
//		return null;
//	}
	
}
