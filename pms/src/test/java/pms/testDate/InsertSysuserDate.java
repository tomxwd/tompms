package pms.testDate;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import top.tomxwd.pms.mapper.sysuser.SysuserMapper;
import top.tomxwd.pms.pojo.sysuser.Sysuser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:application-spring.xml")
public class InsertSysuserDate {
	
	@Autowired
	private SysuserMapper mapper;
	
	@Test
	public void inserDate() throws Exception {
		Sysuser user = new Sysuser();
		user.setImg("/head/img");
		for(int i=2;i<50;i++) {
			user.setEmail("1231"+i+"@qq.com");
			user.setNickname("tom"+i);
			user.setPhone("123"+i);
			user.setPwd(i+"123"+i);
			user.setQq("213123"+i);
			user.setRegtime(new Date());
			user.setUname("admin"+i);
			mapper.insertSelective(user);
		}
	}
}
