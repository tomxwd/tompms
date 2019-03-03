package pms.testDate;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import top.tomxwd.pms.mapper.sysuser.SysuserMapper;
import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.service.sysuser.SysuserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application-spring.xml")
public class InsertSysuserDate {

	@Autowired
	private SysuserMapper mapper;

	@Test
	public void inserDate() throws Exception {
		Sysuser user = new Sysuser();
		user.setImg("/head/img");
		for (int i = 2; i < 50; i++) {
			user.setEmail("1231" + i + "@qq.com");
			user.setNickname("tom" + i);
			user.setPhone("123" + i);
			user.setPwd(i + "123" + i);
			user.setQq("213123" + i);
			user.setRegtime(new Date());
			user.setUname("admin" + i);
			mapper.insertSelective(user);
		}
	}

	@Test
	public void test() throws Exception {
		List<Map<String, Object>> oneJsTreeFirst = mapper.oneJsTreeFirst(0L);
		for (Map<String, Object> map : oneJsTreeFirst) {
			if (mapper.checkChild((Long) map.get("id")) != 0) {
				map.put("children", mapper.oneJsTreeFirst((Long) map.get("id")));
				
			}
		}
		for (Map<String, Object> map : oneJsTreeFirst) {

			System.out.println(map);
		}
	}
	
	@Test
	public void testName() throws Exception {
		List<Map<String, Object>> list = mapper.oneJsTreeFirst(0L);
		List<Map<String,Object>> tree = tree(list);
		for (Map<String, Object> map : tree) {
			System.out.println(map);
		}
	}
	
	public List<Map<String,Object>> tree(List<Map<String,Object>> list) {
		for (Map<String, Object> map : list) {
			if(mapper.checkChild((Long)map.get("id"))!=0){
				List<Map<String,Object>> oneJsTreeFirst = mapper.oneJsTreeFirst((Long)map.get("id"));
				tree(oneJsTreeFirst);
				map.put("children", oneJsTreeFirst);
			}
		}
		return list;
	}
	
	@Test
	public void testName1() throws Exception {
		mapper.insertTree("乱七八糟", 0);
	}

}
