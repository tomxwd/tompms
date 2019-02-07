package top.tomxwd.pms.mapper.sysuser;

import top.tomxwd.pms.vo.sysuser.SysuserQueryObj;

public class MySysuserSqlProvider {
	
	public String sysuserList(SysuserQueryObj query) {
		String sql = "select id,uname,nickname,delstatus,phone,email,qq,regtime from t_sysuser ";
		String name = query.getSearchNameOrNickName();
		if(!name.isEmpty()||!("".equals(name))) {
			sql += " where 1 = 1 and uname like '%' #{searchNameOrNickName} '%' or nickname like '%' #{searchNameOrNickName} '%' ";
		}
		sql+=" limit #{begin},#{size}";
		return sql;
	}
	
	public String sysuserListCount(SysuserQueryObj query) {
		String sql = "select count(*) from t_sysuser ";
		String name = query.getSearchNameOrNickName();
		if(!name.isEmpty()||!("".equals(name))) {
			sql += " where 1 = 1 and uname like '%' #{searchNameOrNickName} '%' or nickname like '%' #{searchNameOrNickName} '%' ";
		}
		return sql;
	}
	
}
